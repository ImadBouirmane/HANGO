import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ByManagersRecord extends FirestoreRecord {
  ByManagersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "managerRef" field.
  DocumentReference? _managerRef;
  DocumentReference? get managerRef => _managerRef;
  bool hasManagerRef() => _managerRef != null;

  // "isConfirmed" field.
  bool? _isConfirmed;
  bool get isConfirmed => _isConfirmed ?? false;
  bool hasIsConfirmed() => _isConfirmed != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _managerRef = snapshotData['managerRef'] as DocumentReference?;
    _isConfirmed = snapshotData['isConfirmed'] as bool?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('byManagers')
          : FirebaseFirestore.instance.collectionGroup('byManagers');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('byManagers').doc();

  static Stream<ByManagersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ByManagersRecord.fromSnapshot(s));

  static Future<ByManagersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ByManagersRecord.fromSnapshot(s));

  static ByManagersRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ByManagersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ByManagersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ByManagersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ByManagersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ByManagersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createByManagersRecordData({
  DocumentReference? managerRef,
  bool? isConfirmed,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'managerRef': managerRef,
      'isConfirmed': isConfirmed,
    }.withoutNulls,
  );

  return firestoreData;
}

class ByManagersRecordDocumentEquality implements Equality<ByManagersRecord> {
  const ByManagersRecordDocumentEquality();

  @override
  bool equals(ByManagersRecord? e1, ByManagersRecord? e2) {
    return e1?.managerRef == e2?.managerRef &&
        e1?.isConfirmed == e2?.isConfirmed;
  }

  @override
  int hash(ByManagersRecord? e) =>
      const ListEquality().hash([e?.managerRef, e?.isConfirmed]);

  @override
  bool isValidKey(Object? o) => o is ByManagersRecord;
}
