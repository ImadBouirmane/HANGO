// ignore_for_file: unnecessary_getters_setters
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ArtistStruct extends FFFirebaseStruct {
  ArtistStruct({
    String? name,
    DateTime? scheduleStart,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _scheduleStart = scheduleStart,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "scheduleStart" field.
  DateTime? _scheduleStart;
  DateTime? get scheduleStart => _scheduleStart;
  set scheduleStart(DateTime? val) => _scheduleStart = val;
  bool hasScheduleStart() => _scheduleStart != null;

  static ArtistStruct fromMap(Map<String, dynamic> data) => ArtistStruct(
        name: data['name'] as String?,
        scheduleStart: data['scheduleStart'] as DateTime?,
      );

  static ArtistStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? ArtistStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'scheduleStart': _scheduleStart,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'scheduleStart': serializeParam(
          _scheduleStart,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static ArtistStruct fromSerializableMap(Map<String, dynamic> data) =>
      ArtistStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        scheduleStart: deserializeParam(
          data['scheduleStart'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'ArtistStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ArtistStruct &&
        name == other.name &&
        scheduleStart == other.scheduleStart;
  }

  @override
  int get hashCode => const ListEquality().hash([name, scheduleStart]);
}

ArtistStruct createArtistStruct({
  String? name,
  DateTime? scheduleStart,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ArtistStruct(
      name: name,
      scheduleStart: scheduleStart,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ArtistStruct? updateArtistStruct(
  ArtistStruct? artist, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    artist
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addArtistStructData(
  Map<String, dynamic> firestoreData,
  ArtistStruct? artist,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (artist == null) {
    return;
  }
  if (artist.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && artist.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final artistData = getArtistFirestoreData(artist, forFieldValue);
  final nestedData = artistData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = artist.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getArtistFirestoreData(
  ArtistStruct? artist, [
  bool forFieldValue = false,
]) {
  if (artist == null) {
    return {};
  }
  final firestoreData = mapToFirestore(artist.toMap());

  // Add any Firestore field values
  artist.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getArtistListFirestoreData(
  List<ArtistStruct>? artists,
) =>
    artists?.map((e) => getArtistFirestoreData(e, true)).toList() ?? [];
