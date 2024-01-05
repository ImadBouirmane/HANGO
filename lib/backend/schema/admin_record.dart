import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class AdminRecord extends FirestoreRecord {
  AdminRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  void _initializeFields() {
    _userRef = snapshotData['userRef'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Admin');

  static Stream<AdminRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AdminRecord.fromSnapshot(s));

  static Future<AdminRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AdminRecord.fromSnapshot(s));

  static AdminRecord fromSnapshot(DocumentSnapshot snapshot) => AdminRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AdminRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AdminRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AdminRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AdminRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAdminRecordData({
  DocumentReference? userRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userRef': userRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class AdminRecordDocumentEquality implements Equality<AdminRecord> {
  const AdminRecordDocumentEquality();

  @override
  bool equals(AdminRecord? e1, AdminRecord? e2) {
    return e1?.userRef == e2?.userRef;
  }

  @override
  int hash(AdminRecord? e) => const ListEquality().hash([e?.userRef]);

  @override
  bool isValidKey(Object? o) => o is AdminRecord;
}
