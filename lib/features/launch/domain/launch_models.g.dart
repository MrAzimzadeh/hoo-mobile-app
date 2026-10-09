// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'launch_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ComingSoonContent _$ComingSoonContentFromJson(Map<String, dynamic> json) =>
    _ComingSoonContent(
      mode:
          $enumDecodeNullable(_$StoreModeEnumMap, json['mode']) ??
          StoreMode.comingSoon,
      launchAt: json['launchAt'] == null
          ? null
          : DateTime.parse(json['launchAt'] as String),
      title: json['title'] as String? ?? '',
      subtitle: json['subtitle'] as String? ?? '',
      perks:
          (json['perks'] as List<dynamic>?)?.map((e) => e as String).toList() ??
          const <String>[],
      contacts: json['contacts'] == null
          ? const StoreContacts()
          : StoreContacts.fromJson(json['contacts'] as Map<String, dynamic>),
      waitlistCount: (json['waitlistCount'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$ComingSoonContentToJson(_ComingSoonContent instance) =>
    <String, dynamic>{
      'mode': _$StoreModeEnumMap[instance.mode]!,
      'launchAt': instance.launchAt?.toIso8601String(),
      'title': instance.title,
      'subtitle': instance.subtitle,
      'perks': instance.perks,
      'contacts': instance.contacts,
      'waitlistCount': instance.waitlistCount,
    };

const _$StoreModeEnumMap = {
  StoreMode.comingSoon: 'ComingSoon',
  StoreMode.live: 'Live',
};

_WaitlistCount _$WaitlistCountFromJson(Map<String, dynamic> json) =>
    _WaitlistCount(
      total: (json['total'] as num?)?.toInt() ?? 0,
      today: (json['today'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$WaitlistCountToJson(_WaitlistCount instance) =>
    <String, dynamic>{'total': instance.total, 'today': instance.today};

_WaitlistJoined _$WaitlistJoinedFromJson(Map<String, dynamic> json) =>
    _WaitlistJoined(
      position: (json['position'] as num).toInt(),
      total: (json['total'] as num).toInt(),
      alreadyJoined: json['alreadyJoined'] as bool? ?? false,
    );

Map<String, dynamic> _$WaitlistJoinedToJson(_WaitlistJoined instance) =>
    <String, dynamic>{
      'position': instance.position,
      'total': instance.total,
      'alreadyJoined': instance.alreadyJoined,
    };
