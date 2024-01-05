// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class EventTypeStruct extends FFFirebaseStruct {
  EventTypeStruct({
    String? football,
    String? hockey,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _football = football,
        _hockey = hockey,
        super(firestoreUtilData);

  // "Football" field.
  String? _football;
  String get football => _football ?? '';
  set football(String? val) => _football = val;
  bool hasFootball() => _football != null;

  // "Hockey" field.
  String? _hockey;
  String get hockey => _hockey ?? '';
  set hockey(String? val) => _hockey = val;
  bool hasHockey() => _hockey != null;

  static EventTypeStruct fromMap(Map<String, dynamic> data) => EventTypeStruct(
        football: data['Football'] as String?,
        hockey: data['Hockey'] as String?,
      );

  static EventTypeStruct? maybeFromMap(dynamic data) => data is Map
      ? EventTypeStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'Football': _football,
        'Hockey': _hockey,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Football': serializeParam(
          _football,
          ParamType.String,
        ),
        'Hockey': serializeParam(
          _hockey,
          ParamType.String,
        ),
      }.withoutNulls;

  static EventTypeStruct fromSerializableMap(Map<String, dynamic> data) =>
      EventTypeStruct(
        football: deserializeParam(
          data['Football'],
          ParamType.String,
          false,
        ),
        hockey: deserializeParam(
          data['Hockey'],
          ParamType.String,
          false,
        ),
      );

  static EventTypeStruct fromAlgoliaData(Map<String, dynamic> data) =>
      EventTypeStruct(
        football: convertAlgoliaParam(
          data['Football'],
          ParamType.String,
          false,
        ),
        hockey: convertAlgoliaParam(
          data['Hockey'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: const FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'EventTypeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is EventTypeStruct &&
        football == other.football &&
        hockey == other.hockey;
  }

  @override
  int get hashCode => const ListEquality().hash([football, hockey]);
}

EventTypeStruct createEventTypeStruct({
  String? football,
  String? hockey,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    EventTypeStruct(
      football: football,
      hockey: hockey,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

EventTypeStruct? updateEventTypeStruct(
  EventTypeStruct? eventType, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    eventType
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addEventTypeStructData(
  Map<String, dynamic> firestoreData,
  EventTypeStruct? eventType,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (eventType == null) {
    return;
  }
  if (eventType.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && eventType.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final eventTypeData = getEventTypeFirestoreData(eventType, forFieldValue);
  final nestedData = eventTypeData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = eventType.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getEventTypeFirestoreData(
  EventTypeStruct? eventType, [
  bool forFieldValue = false,
]) {
  if (eventType == null) {
    return {};
  }
  final firestoreData = mapToFirestore(eventType.toMap());

  // Add any Firestore field values
  eventType.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getEventTypeListFirestoreData(
  List<EventTypeStruct>? eventTypes,
) =>
    eventTypes?.map((e) => getEventTypeFirestoreData(e, true)).toList() ?? [];
