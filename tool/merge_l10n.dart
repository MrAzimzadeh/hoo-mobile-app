// Merges the per-feature ARB fragments into the ARB files `flutter gen-l10n` reads.
//
//   lib/l10n/core/app_<lang>.arb                 shared strings (nav, buttons, errors, enum labels)
//   lib/l10n/fragments/<feature>/app_<lang>.arb  strings owned by one feature (keys prefixed with the feature)
//   → lib/l10n/arb/app_<lang>.arb                generated, do not edit
//
// Run: `dart run tool/merge_l10n.dart && flutter gen-l10n`
// Fails on duplicate keys and on keys missing from a language (az is the template).
import 'dart:convert';
import 'dart:io';

const languages = ['az', 'en', 'ru', 'tr'];

void main() {
  final root = Directory('lib/l10n');
  final sources = <Directory>[Directory('${root.path}/core')];
  final fragments = Directory('${root.path}/fragments');
  if (fragments.existsSync()) {
    sources.addAll(fragments.listSync().whereType<Directory>().toList()..sort((a, b) => a.path.compareTo(b.path)));
  }

  final merged = {for (final l in languages) l: <String, Object?>{'@@locale': l}};
  final owner = <String, String>{};
  var errors = 0;

  for (final dir in sources) {
    for (final lang in languages) {
      final file = File('${dir.path}/app_$lang.arb');
      if (!file.existsSync()) {
        stderr.writeln('missing ${file.path}');
        errors++;
        continue;
      }
      final map = jsonDecode(file.readAsStringSync()) as Map<String, dynamic>;
      map.forEach((key, value) {
        if (key == '@@locale') return;
        if (lang == 'az' && !key.startsWith('@')) {
          final prev = owner[key];
          if (prev != null) {
            stderr.writeln('duplicate key "$key" in ${dir.path} (already in $prev)');
            errors++;
          }
          owner[key] = dir.path;
        }
        merged[lang]![key] = value;
      });
    }
  }

  final template = merged['az']!.keys.where((k) => !k.startsWith('@')).toSet();
  for (final lang in languages.where((l) => l != 'az')) {
    final keys = merged[lang]!.keys.where((k) => !k.startsWith('@')).toSet();
    for (final missing in template.difference(keys)) {
      stderr.writeln('[$lang] missing "$missing" (from ${owner[missing]})');
      errors++;
    }
    // metadata (@key) only belongs in the template
    merged[lang]!.removeWhere((k, _) => k.startsWith('@') && k != '@@locale');
  }

  final out = Directory('${root.path}/arb')..createSync(recursive: true);
  const encoder = JsonEncoder.withIndent('  ');
  for (final lang in languages) {
    File('${out.path}/app_$lang.arb').writeAsStringSync('${encoder.convert(merged[lang])}\n');
  }
  stdout.writeln('merged ${template.length} keys from ${sources.length} sources');
  if (errors > 0) {
    stderr.writeln('$errors problem(s)');
    exitCode = 1;
  }
}
