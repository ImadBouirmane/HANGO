// ignore_for_file: unnecessary_getters_setters
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AddressStruct extends FFFirebaseStruct {
  AddressStruct({
    String? street,
    String? zipCode,
    String? city,
    String? state,
    String? country,
    LatLng? latiLong,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _street = street,
        _zipCode = zipCode,
        _city = city,
        _state = state,
        _country = country,
        _latiLong = latiLong,
        super(firestoreUtilData);

  // "street" field.
  String? _street;
  String get street => _street ?? '';
  set street(String? val) => _street = val;
  bool hasStreet() => _street != null;

  // "zip_code" field.
  String? _zipCode;
  String get zipCode => _zipCode ?? '';
  set zipCode(String? val) => _zipCode = val;
  bool hasZipCode() => _zipCode != null;

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  set city(String? val) => _city = val;
  bool hasCity() => _city != null;

  // "State" field.
  String? _state;
  String get state => _state ?? '';
  set state(String? val) => _state = val;
  bool hasState() => _state != null;

  // "Country" field.
  String? _country;
  String get country => _country ?? '';
  set country(String? val) => _country = val;
  bool hasCountry() => _country != null;

  // "LatiLong" field.
  LatLng? _latiLong;
  LatLng? get latiLong => _latiLong;
  set latiLong(LatLng? val) => _latiLong = val;
  bool hasLatiLong() => _latiLong != null;

  static AddressStruct fromMap(Map<String, dynamic> data) => AddressStruct(
        street: data['street'] as String?,
        zipCode: data['zip_code'] as String?,
        city: data['city'] as String?,
        state: data['State'] as String?,
        country: data['Country'] as String?,
        latiLong: data['LatiLong'] as LatLng?,
      );

  static AddressStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? AddressStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'street': _street,
        'zip_code': _zipCode,
        'city': _city,
        'State': _state,
        'Country': _country,
        'LatiLong': _latiLong,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'street': serializeParam(
          _street,
          ParamType.String,
        ),
        'zip_code': serializeParam(
          _zipCode,
          ParamType.String,
        ),
        'city': serializeParam(
          _city,
          ParamType.String,
        ),
        'State': serializeParam(
          _state,
          ParamType.String,
        ),
        'Country': serializeParam(
          _country,
          ParamType.String,
        ),
        'LatiLong': serializeParam(
          _latiLong,
          ParamType.LatLng,
        ),
      }.withoutNulls;

  static AddressStruct fromSerializableMap(Map<String, dynamic> data) =>
      AddressStruct(
        street: deserializeParam(
          data['street'],
          ParamType.String,
          false,
        ),
        zipCode: deserializeParam(
          data['zip_code'],
          ParamType.String,
          false,
        ),
        city: deserializeParam(
          data['city'],
          ParamType.String,
          false,
        ),
        state: deserializeParam(
          data['State'],
          ParamType.String,
          false,
        ),
        country: deserializeParam(
          data['Country'],
          ParamType.String,
          false,
        ),
        latiLong: deserializeParam(
          data['LatiLong'],
          ParamType.LatLng,
          false,
        ),
      );

  @override
  String toString() => 'AddressStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AddressStruct &&
        street == other.street &&
        zipCode == other.zipCode &&
        city == other.city &&
        state == other.state &&
        country == other.country &&
        latiLong == other.latiLong;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([street, zipCode, city, state, country, latiLong]);
}

AddressStruct createAddressStruct({
  String? street,
  String? zipCode,
  String? city,
  String? state,
  String? country,
  LatLng? latiLong,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AddressStruct(
      street: street,
      zipCode: zipCode,
      city: city,
      state: state,
      country: country,
      latiLong: latiLong,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

AddressStruct? updateAddressStruct(
  AddressStruct? address, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    address
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addAddressStructData(
  Map<String, dynamic> firestoreData,
  AddressStruct? address,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (address == null) {
    return;
  }
  if (address.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && address.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final addressData = getAddressFirestoreData(address, forFieldValue);
  final nestedData = addressData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = address.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getAddressFirestoreData(
  AddressStruct? address, [
  bool forFieldValue = false,
]) {
  if (address == null) {
    return {};
  }
  final firestoreData = mapToFirestore(address.toMap());

  // Add any Firestore field values
  address.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAddressListFirestoreData(
  List<AddressStruct>? addresss,
) =>
    addresss?.map((e) => getAddressFirestoreData(e, true)).toList() ?? [];
