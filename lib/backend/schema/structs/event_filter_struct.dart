// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EventFilterStruct extends FFFirebaseStruct {
  EventFilterStruct({
    String? themeEvent,
    String? musicType,
    bool? weekend,
    bool? jeudredi,
    bool? freeEnter,
    bool? booked,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _themeEvent = themeEvent,
        _musicType = musicType,
        _weekend = weekend,
        _jeudredi = jeudredi,
        _freeEnter = freeEnter,
        _booked = booked,
        super(firestoreUtilData);

  // "themeEvent" field.
  String? _themeEvent;
  String get themeEvent => _themeEvent ?? '';
  set themeEvent(String? val) => _themeEvent = val;
  bool hasThemeEvent() => _themeEvent != null;

  // "musicType" field.
  String? _musicType;
  String get musicType => _musicType ?? '';
  set musicType(String? val) => _musicType = val;
  bool hasMusicType() => _musicType != null;

  // "Weekend" field.
  bool? _weekend;
  bool get weekend => _weekend ?? false;
  set weekend(bool? val) => _weekend = val;
  bool hasWeekend() => _weekend != null;

  // "Jeudredi" field.
  bool? _jeudredi;
  bool get jeudredi => _jeudredi ?? false;
  set jeudredi(bool? val) => _jeudredi = val;
  bool hasJeudredi() => _jeudredi != null;

  // "freeEnter" field.
  bool? _freeEnter;
  bool get freeEnter => _freeEnter ?? false;
  set freeEnter(bool? val) => _freeEnter = val;
  bool hasFreeEnter() => _freeEnter != null;

  // "booked" field.
  bool? _booked;
  bool get booked => _booked ?? false;
  set booked(bool? val) => _booked = val;
  bool hasBooked() => _booked != null;

  static EventFilterStruct fromMap(Map<String, dynamic> data) =>
      EventFilterStruct(
        themeEvent: data['themeEvent'] as String?,
        musicType: data['musicType'] as String?,
        weekend: data['Weekend'] as bool?,
        jeudredi: data['Jeudredi'] as bool?,
        freeEnter: data['freeEnter'] as bool?,
        booked: data['booked'] as bool?,
      );

  static EventFilterStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? EventFilterStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'themeEvent': _themeEvent,
        'musicType': _musicType,
        'Weekend': _weekend,
        'Jeudredi': _jeudredi,
        'freeEnter': _freeEnter,
        'booked': _booked,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'themeEvent': serializeParam(
          _themeEvent,
          ParamType.String,
        ),
        'musicType': serializeParam(
          _musicType,
          ParamType.String,
        ),
        'Weekend': serializeParam(
          _weekend,
          ParamType.bool,
        ),
        'Jeudredi': serializeParam(
          _jeudredi,
          ParamType.bool,
        ),
        'freeEnter': serializeParam(
          _freeEnter,
          ParamType.bool,
        ),
        'booked': serializeParam(
          _booked,
          ParamType.bool,
        ),
      }.withoutNulls;

  static EventFilterStruct fromSerializableMap(Map<String, dynamic> data) =>
      EventFilterStruct(
        themeEvent: deserializeParam(
          data['themeEvent'],
          ParamType.String,
          false,
        ),
        musicType: deserializeParam(
          data['musicType'],
          ParamType.String,
          false,
        ),
        weekend: deserializeParam(
          data['Weekend'],
          ParamType.bool,
          false,
        ),
        jeudredi: deserializeParam(
          data['Jeudredi'],
          ParamType.bool,
          false,
        ),
        freeEnter: deserializeParam(
          data['freeEnter'],
          ParamType.bool,
          false,
        ),
        booked: deserializeParam(
          data['booked'],
          ParamType.bool,
          false,
        ),
      );

  static EventFilterStruct fromAlgoliaData(Map<String, dynamic> data) =>
      EventFilterStruct(
        themeEvent: convertAlgoliaParam(
          data['themeEvent'],
          ParamType.String,
          false,
        ),
        musicType: convertAlgoliaParam(
          data['musicType'],
          ParamType.String,
          false,
        ),
        weekend: convertAlgoliaParam(
          data['Weekend'],
          ParamType.bool,
          false,
        ),
        jeudredi: convertAlgoliaParam(
          data['Jeudredi'],
          ParamType.bool,
          false,
        ),
        freeEnter: convertAlgoliaParam(
          data['freeEnter'],
          ParamType.bool,
          false,
        ),
        booked: convertAlgoliaParam(
          data['booked'],
          ParamType.bool,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'EventFilterStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is EventFilterStruct &&
        themeEvent == other.themeEvent &&
        musicType == other.musicType &&
        weekend == other.weekend &&
        jeudredi == other.jeudredi &&
        freeEnter == other.freeEnter &&
        booked == other.booked;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([themeEvent, musicType, weekend, jeudredi, freeEnter, booked]);
}

EventFilterStruct createEventFilterStruct({
  String? themeEvent,
  String? musicType,
  bool? weekend,
  bool? jeudredi,
  bool? freeEnter,
  bool? booked,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    EventFilterStruct(
      themeEvent: themeEvent,
      musicType: musicType,
      weekend: weekend,
      jeudredi: jeudredi,
      freeEnter: freeEnter,
      booked: booked,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

EventFilterStruct? updateEventFilterStruct(
  EventFilterStruct? eventFilter, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    eventFilter
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addEventFilterStructData(
  Map<String, dynamic> firestoreData,
  EventFilterStruct? eventFilter,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (eventFilter == null) {
    return;
  }
  if (eventFilter.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && eventFilter.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final eventFilterData =
      getEventFilterFirestoreData(eventFilter, forFieldValue);
  final nestedData =
      eventFilterData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = eventFilter.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getEventFilterFirestoreData(
  EventFilterStruct? eventFilter, [
  bool forFieldValue = false,
]) {
  if (eventFilter == null) {
    return {};
  }
  final firestoreData = mapToFirestore(eventFilter.toMap());

  // Add any Firestore field values
  eventFilter.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getEventFilterListFirestoreData(
  List<EventFilterStruct>? eventFilters,
) =>
    eventFilters?.map((e) => getEventFilterFirestoreData(e, true)).toList() ??
    [];
