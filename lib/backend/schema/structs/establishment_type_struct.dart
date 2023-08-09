// ignore_for_file: unnecessary_getters_setters
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EstablishmentTypeStruct extends FFFirebaseStruct {
  EstablishmentTypeStruct({
    String? bar,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _bar = bar,
        super(firestoreUtilData);

  // "Bar" field.
  String? _bar;
  String get bar => _bar ?? '';
  set bar(String? val) => _bar = val;
  bool hasBar() => _bar != null;

  static EstablishmentTypeStruct fromMap(Map<String, dynamic> data) =>
      EstablishmentTypeStruct(
        bar: data['Bar'] as String?,
      );

  static EstablishmentTypeStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic>
          ? EstablishmentTypeStruct.fromMap(data)
          : null;

  Map<String, dynamic> toMap() => {
        'Bar': _bar,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Bar': serializeParam(
          _bar,
          ParamType.String,
        ),
      }.withoutNulls;

  static EstablishmentTypeStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      EstablishmentTypeStruct(
        bar: deserializeParam(
          data['Bar'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'EstablishmentTypeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is EstablishmentTypeStruct && bar == other.bar;
  }

  @override
  int get hashCode => const ListEquality().hash([bar]);
}

EstablishmentTypeStruct createEstablishmentTypeStruct({
  String? bar,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    EstablishmentTypeStruct(
      bar: bar,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

EstablishmentTypeStruct? updateEstablishmentTypeStruct(
  EstablishmentTypeStruct? establishmentType, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    establishmentType
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addEstablishmentTypeStructData(
  Map<String, dynamic> firestoreData,
  EstablishmentTypeStruct? establishmentType,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (establishmentType == null) {
    return;
  }
  if (establishmentType.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && establishmentType.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final establishmentTypeData =
      getEstablishmentTypeFirestoreData(establishmentType, forFieldValue);
  final nestedData =
      establishmentTypeData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = establishmentType.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getEstablishmentTypeFirestoreData(
  EstablishmentTypeStruct? establishmentType, [
  bool forFieldValue = false,
]) {
  if (establishmentType == null) {
    return {};
  }
  final firestoreData = mapToFirestore(establishmentType.toMap());

  // Add any Firestore field values
  establishmentType.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getEstablishmentTypeListFirestoreData(
  List<EstablishmentTypeStruct>? establishmentTypes,
) =>
    establishmentTypes
        ?.map((e) => getEstablishmentTypeFirestoreData(e, true))
        .toList() ??
    [];
