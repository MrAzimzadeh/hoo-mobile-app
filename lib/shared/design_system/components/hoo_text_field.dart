import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../l10n/l10n.dart';
import '../tokens/hoo_theme.dart';
import '../tokens/hoo_tokens.dart';
import 'hoo_icons.dart';

/// 52px filled field (surface.muted, no border; focused → 1px black; error → 1px error + caption).
class HooTextField extends StatefulWidget {
  const HooTextField({
    super.key,
    this.controller,
    this.label,
    this.hint,
    this.errorText,
    this.helperText,
    this.keyboardType,
    this.textInputAction,
    this.onChanged,
    this.onSubmitted,
    this.obscure = false,
    this.autofillHints,
    this.inputFormatters,
    this.maxLines = 1,
    this.minLines,
    this.maxLength,
    this.enabled = true,
    this.prefix,
    this.suffix,
    this.focusNode,
    this.autofocus = false,
    this.textCapitalization = TextCapitalization.none,
    this.initialValue,
  });

  /// Password with a show/hide toggle.
  const HooTextField.password({
    super.key,
    this.controller,
    this.label,
    this.hint,
    this.errorText,
    this.helperText,
    this.textInputAction,
    this.onChanged,
    this.onSubmitted,
    this.autofillHints = const [AutofillHints.password],
    this.focusNode,
    this.autofocus = false,
    this.enabled = true,
  })  : obscure = true,
        keyboardType = TextInputType.visiblePassword,
        inputFormatters = null,
        maxLines = 1,
        minLines = null,
        maxLength = null,
        prefix = null,
        suffix = null,
        textCapitalization = TextCapitalization.none,
        initialValue = null;

  final TextEditingController? controller;
  final String? label;
  final String? hint;
  final String? errorText;
  final String? helperText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final bool obscure;
  final Iterable<String>? autofillHints;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final bool enabled;
  final Widget? prefix;
  final Widget? suffix;
  final FocusNode? focusNode;
  final bool autofocus;
  final TextCapitalization textCapitalization;
  final String? initialValue;

  @override
  State<HooTextField> createState() => _HooTextFieldState();
}

class _HooTextFieldState extends State<HooTextField> {
  late bool _hidden = widget.obscure;
  TextEditingController? _own;

  TextEditingController get _controller => widget.controller ?? (_own ??= TextEditingController(text: widget.initialValue));

  @override
  void dispose() {
    _own?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final c = context.hoo.colors;
    final l = context.l10n;
    final multiline = (widget.maxLines ?? 2) > 1;
    final suffix = widget.obscure
        ? Semantics(
            button: true,
            label: _hidden ? l.a11yShowPassword : l.a11yHidePassword,
            excludeSemantics: true,
            child: IconButton(
              onPressed: () => setState(() => _hidden = !_hidden),
              icon: Icon(_hidden ? HooIcons.eye : HooIcons.eyeOff, color: c.textSecondary, size: HooSize.iconSmall),
            ),
          )
        : widget.suffix;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.label != null) ...[
          Text(widget.label!, style: context.hoo.text.caption.copyWith(color: c.textPrimary, fontWeight: FontWeight.w600)),
          const SizedBox(height: HooSpacing.xs),
        ],
        ConstrainedBox(
          constraints: BoxConstraints(minHeight: multiline ? HooSize.inputHeight * 2 : HooSize.inputHeight),
          child: TextField(
            controller: _controller,
            focusNode: widget.focusNode,
            autofocus: widget.autofocus,
            enabled: widget.enabled,
            obscureText: _hidden,
            keyboardType: widget.keyboardType,
            textInputAction: widget.textInputAction,
            onChanged: widget.onChanged,
            onSubmitted: widget.onSubmitted,
            autofillHints: widget.autofillHints,
            inputFormatters: widget.inputFormatters,
            maxLines: widget.obscure ? 1 : widget.maxLines,
            minLines: widget.minLines,
            maxLength: widget.maxLength,
            textCapitalization: widget.textCapitalization,
            style: context.hoo.text.body,
            decoration: InputDecoration(
              hintText: widget.hint,
              errorText: widget.errorText,
              helperText: widget.helperText,
              helperStyle: context.hoo.text.caption,
              errorMaxLines: 3,
              helperMaxLines: 3,
              prefixIcon: widget.prefix,
              prefixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
              suffixIcon: suffix,
              counterStyle: context.hoo.text.caption,
            ),
          ),
        ),
      ],
    );
  }
}

/// Azerbaijani phone field: fixed `+994` prefix, mask `XX XXX XX XX`. Read the wire value with
/// `HooFormat.phoneWire(controller.text)`.
class HooPhoneField extends StatelessWidget {
  const HooPhoneField({super.key, required this.controller, this.label, this.errorText, this.onChanged, this.textInputAction, this.onSubmitted, this.autofocus = false});

  final TextEditingController controller;
  final String? label;
  final String? errorText;
  final ValueChanged<String>? onChanged;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onSubmitted;
  final bool autofocus;

  @override
  Widget build(BuildContext context) {
    return HooTextField(
      controller: controller,
      label: label,
      hint: '50 123 45 67',
      errorText: errorText,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      autofocus: autofocus,
      textInputAction: textInputAction,
      keyboardType: TextInputType.phone,
      autofillHints: const [AutofillHints.telephoneNumberNational],
      inputFormatters: [AzPhoneFormatter()],
      prefix: Padding(
        padding: const EdgeInsets.only(left: HooSpacing.md, right: HooSpacing.xs),
        child: Text('+994', style: context.hoo.text.bodyStrong),
      ),
    );
  }

  /// True when 9 national digits were entered.
  static bool isComplete(String text) => text.replaceAll(RegExp(r'\D'), '').length == 9;
}

/// Formats national digits as `XX XXX XX XX` (max 9 digits; a pasted +994/0 prefix is dropped).
class AzPhoneFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    var digits = newValue.text.replaceAll(RegExp(r'\D'), '');
    if (digits.startsWith('994') && digits.length > 9) digits = digits.substring(3);
    if (digits.startsWith('0') && digits.length > 9) digits = digits.substring(1);
    if (digits.length > 9) digits = digits.substring(0, 9);
    final b = StringBuffer();
    for (var i = 0; i < digits.length; i++) {
      if (i == 2 || i == 5 || i == 7) b.write(' ');
      b.write(digits[i]);
    }
    final text = b.toString();
    return TextEditingValue(text: text, selection: TextSelection.collapsed(offset: text.length));
  }
}

/// 6-box OTP input. One hidden field drives the boxes, so paste and SMS autofill (`oneTimeCode`) work.
class HooOtpField extends StatefulWidget {
  const HooOtpField({super.key, required this.onCompleted, this.length = 6, this.onChanged, this.errorText, this.enabled = true, this.autofocus = true});

  final int length;
  final ValueChanged<String> onCompleted;
  final ValueChanged<String>? onChanged;
  final String? errorText;
  final bool enabled;
  final bool autofocus;

  @override
  State<HooOtpField> createState() => HooOtpFieldState();
}

class HooOtpFieldState extends State<HooOtpField> {
  final _controller = TextEditingController();
  final _focus = FocusNode();

  void clear() {
    _controller.clear();
    setState(() {});
    _focus.requestFocus();
  }

  @override
  void dispose() {
    _controller.dispose();
    _focus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final c = context.hoo.colors;
    final value = _controller.text;
    final hasError = widget.errorText != null;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Row(
              children: [
                for (var i = 0; i < widget.length; i++) ...[
                  if (i > 0) const SizedBox(width: HooSpacing.xs),
                  Expanded(
                    child: AnimatedContainer(
                      duration: context.hoo.motion(HooDurations.fast),
                      height: 56,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: c.surface,
                        borderRadius: HooRadius.inputAll,
                        border: Border.all(
                          color: hasError
                              ? c.error
                              : (_focus.hasFocus && (i == value.length || (i == widget.length - 1 && value.length == widget.length)))
                                  ? c.textPrimary
                                  : Colors.transparent,
                        ),
                      ),
                      child: Text(i < value.length ? value[i] : '', style: context.hoo.text.h2),
                    ),
                  ),
                ],
              ],
            ),
            Positioned.fill(
              child: Opacity(
                opacity: 0.011,
                child: TextField(
                  controller: _controller,
                  focusNode: _focus,
                  autofocus: widget.autofocus,
                  enabled: widget.enabled,
                  keyboardType: TextInputType.number,
                  autofillHints: const [AutofillHints.oneTimeCode],
                  maxLength: widget.length,
                  showCursor: false,
                  enableInteractiveSelection: false,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: const InputDecoration(counterText: '', border: InputBorder.none, filled: false),
                  onTap: () => setState(() {}),
                  onChanged: (v) {
                    setState(() {});
                    widget.onChanged?.call(v);
                    if (v.length == widget.length) widget.onCompleted(v);
                  },
                ),
              ),
            ),
          ],
        ),
        if (hasError) ...[
          const SizedBox(height: HooSpacing.xs),
          Text(widget.errorText!, style: context.hoo.text.caption.copyWith(color: c.error)),
        ],
      ],
    );
  }
}

/// Checkbox row with wrapping label (terms, consents). Min 48px target.
class HooCheckboxTile extends StatelessWidget {
  const HooCheckboxTile({super.key, required this.value, required this.onChanged, required this.label, this.errorText});

  final bool value;
  final ValueChanged<bool> onChanged;
  final Widget label;
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    final c = context.hoo.colors;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () => onChanged(!value),
          borderRadius: HooRadius.cardAll,
          child: ConstrainedBox(
            constraints: const BoxConstraints(minHeight: HooSize.touchTarget),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(width: 32, child: Checkbox(value: value, onChanged: (v) => onChanged(v ?? false))),
                const SizedBox(width: HooSpacing.xs),
                Expanded(child: DefaultTextStyle(style: context.hoo.text.caption.copyWith(color: c.textPrimary), child: label)),
              ],
            ),
          ),
        ),
        if (errorText != null) Padding(padding: const EdgeInsets.only(left: 40), child: Text(errorText!, style: context.hoo.text.caption.copyWith(color: c.error))),
      ],
    );
  }
}
