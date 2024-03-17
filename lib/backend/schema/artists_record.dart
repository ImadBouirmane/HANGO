import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class ArtistsRecord extends FirestoreRecord {
  ArtistsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "Name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "scheduleStart" field.
  DateTime? _scheduleStart;
  DateTime? get scheduleStart => _scheduleStart;
  bool hasScheduleStart() => _scheduleStart != null;

  // "eventRef" field.
  DocumentReference? _eventRef;
  DocumentReference? get eventRef => _eventRef;
  bool hasEventRef() => _eventRef != null;

  // "createdTime" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "updatedTime" field.
  DateTime? _updatedTime;
  DateTime? get updatedTime => _updatedTime;
  bool hasUpdatedTime() => _updatedTime != null;

  // "scheduleEnd" field.
  DateTime? _scheduleEnd;
  DateTime? get scheduleEnd => _scheduleEnd;
  bool hasScheduleEnd() => _scheduleEnd != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _name = snapshotData['Name'] as String?;
    _scheduleStart = snapshotData['scheduleStart'] as DateTime?;
    _eventRef = snapshotData['eventRef'] as DocumentReference?;
    _createdTime = snapshotData['createdTime'] as DateTime?;
    _updatedTime = snapshotData['updatedTime'] as DateTime?;
    _scheduleEnd = snapshotData['scheduleEnd'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Artists')
          : FirebaseFirestore.instance.collectionGroup('Artists');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('Artists').doc(id);

  static Stream<ArtistsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ArtistsRecord.fromSnapshot(s));

  static Future<ArtistsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ArtistsRecord.fromSnapshot(s));

  static ArtistsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ArtistsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ArtistsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ArtistsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ArtistsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ArtistsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createArtistsRecordData({
  String? name,
  DateTime? scheduleStart,
  DocumentReference? eventRef,
  DateTime? createdTime,
  DateTime? updatedTime,
  DateTime? scheduleEnd,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Name': name,
      'scheduleStart': scheduleStart,
      'eventRef': eventRef,
      'createdTime': createdTime,
      'updatedTime': updatedTime,
      'scheduleEnd': scheduleEnd,
    }.withoutNulls,
  );

  return firestoreData;
}

class ArtistsRecordDocumentEquality implements Equality<ArtistsRecord> {
  const ArtistsRecordDocumentEquality();

  @override
  bool equals(ArtistsRecord? e1, ArtistsRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.scheduleStart == e2?.scheduleStart &&
        e1?.eventRef == e2?.eventRef &&
        e1?.createdTime == e2?.createdTime &&
        e1?.updatedTime == e2?.updatedTime &&
        e1?.scheduleEnd == e2?.scheduleEnd;
  }

  @override
  int hash(ArtistsRecord? e) => const ListEquality().hash([
        e?.name,
        e?.scheduleStart,
        e?.eventRef,
        e?.createdTime,
        e?.updatedTime,
        e?.scheduleEnd
      ]);

  @override
  bool isValidKey(Object? o) => o is ArtistsRecord;
}
