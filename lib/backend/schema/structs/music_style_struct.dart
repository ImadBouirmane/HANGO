// ignore_for_file: unnecessary_getters_setters
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MusicStyleStruct extends FFFirebaseStruct {
  MusicStyleStruct({
    String? rock,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _rock = rock,
        super(firestoreUtilData);

  // "Rock" field.
  String? _rock;
  String get rock => _rock ?? '';
  set rock(String? val) => _rock = val;
  bool hasRock() => _rock != null;

  static MusicStyleStruct fromMap(Map<String, dynamic> data) =>
      MusicStyleStruct(
        rock: data['Rock'] as String?,
      );

  static MusicStyleStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? MusicStyleStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'Rock': _rock,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Rock': serializeParam(
          _rock,
          ParamType.String,
        ),
      }.withoutNulls;

  static MusicStyleStruct fromSerializableMap(Map<String, dynamic> data) =>
      MusicStyleStruct(
        rock: deserializeParam(
          data['Rock'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'MusicStyleStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MusicStyleStruct && rock == other.rock;
  }

  @override
  int get hashCode => const ListEquality().hash([rock]);
}

MusicStyleStruct createMusicStyleStruct({
  String? rock,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    MusicStyleStruct(
      rock: rock,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

MusicStyleStruct? updateMusicStyleStruct(
  MusicStyleStruct? musicStyle, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    musicStyle
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addMusicStyleStructData(
  Map<String, dynamic> firestoreData,
  MusicStyleStruct? musicStyle,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (musicStyle == null) {
    return;
  }
  if (musicStyle.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && musicStyle.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final musicStyleData = getMusicStyleFirestoreData(musicStyle, forFieldValue);
  final nestedData = musicStyleData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = musicStyle.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getMusicStyleFirestoreData(
  MusicStyleStruct? musicStyle, [
  bool forFieldValue = false,
]) {
  if (musicStyle == null) {
    return {};
  }
  final firestoreData = mapToFirestore(musicStyle.toMap());

  // Add any Firestore field values
  musicStyle.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getMusicStyleListFirestoreData(
  List<MusicStyleStruct>? musicStyles,
) =>
    musicStyles?.map((e) => getMusicStyleFirestoreData(e, true)).toList() ?? [];
