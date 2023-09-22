import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ManagerRecord extends FirestoreRecord {
  ManagerRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "establishmentRef" field.
  DocumentReference? _establishmentRef;
  DocumentReference? get establishmentRef => _establishmentRef;
  bool hasEstablishmentRef() => _establishmentRef != null;

  // "createdTime" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "eventsRef" field.
  DocumentReference? _eventsRef;
  DocumentReference? get eventsRef => _eventsRef;
  bool hasEventsRef() => _eventsRef != null;

  // "FirstName" field.
  String? _firstName;
  String get firstName => _firstName ?? '';
  bool hasFirstName() => _firstName != null;

  // "LastName" field.
  String? _lastName;
  String get lastName => _lastName ?? '';
  bool hasLastName() => _lastName != null;

  // "Phone" field.
  String? _phone;
  String get phone => _phone ?? '';
  bool hasPhone() => _phone != null;

  // "EstName" field.
  String? _estName;
  String get estName => _estName ?? '';
  bool hasEstName() => _estName != null;

  void _initializeFields() {
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _establishmentRef = snapshotData['establishmentRef'] as DocumentReference?;
    _createdTime = snapshotData['createdTime'] as DateTime?;
    _eventsRef = snapshotData['eventsRef'] as DocumentReference?;
    _firstName = snapshotData['FirstName'] as String?;
    _lastName = snapshotData['LastName'] as String?;
    _phone = snapshotData['Phone'] as String?;
    _estName = snapshotData['EstName'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Manager');

  static Stream<ManagerRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ManagerRecord.fromSnapshot(s));

  static Future<ManagerRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ManagerRecord.fromSnapshot(s));

  static ManagerRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ManagerRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ManagerRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ManagerRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ManagerRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ManagerRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createManagerRecordData({
  DocumentReference? userRef,
  DocumentReference? establishmentRef,
  DateTime? createdTime,
  DocumentReference? eventsRef,
  String? firstName,
  String? lastName,
  String? phone,
  String? estName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userRef': userRef,
      'establishmentRef': establishmentRef,
      'createdTime': createdTime,
      'eventsRef': eventsRef,
      'FirstName': firstName,
      'LastName': lastName,
      'Phone': phone,
      'EstName': estName,
    }.withoutNulls,
  );

  return firestoreData;
}

class ManagerRecordDocumentEquality implements Equality<ManagerRecord> {
  const ManagerRecordDocumentEquality();

  @override
  bool equals(ManagerRecord? e1, ManagerRecord? e2) {
    return e1?.userRef == e2?.userRef &&
        e1?.establishmentRef == e2?.establishmentRef &&
        e1?.createdTime == e2?.createdTime &&
        e1?.eventsRef == e2?.eventsRef &&
        e1?.firstName == e2?.firstName &&
        e1?.lastName == e2?.lastName &&
        e1?.phone == e2?.phone &&
        e1?.estName == e2?.estName;
  }

  @override
  int hash(ManagerRecord? e) => const ListEquality().hash([
        e?.userRef,
        e?.establishmentRef,
        e?.createdTime,
        e?.eventsRef,
        e?.firstName,
        e?.lastName,
        e?.phone,
        e?.estName
      ]);

  @override
  bool isValidKey(Object? o) => o is ManagerRecord;
}
