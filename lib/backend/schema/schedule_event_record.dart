import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ScheduleEventRecord extends FirestoreRecord {
  ScheduleEventRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "scheduleStart" field.
  DateTime? _scheduleStart;
  DateTime? get scheduleStart => _scheduleStart;
  bool hasScheduleStart() => _scheduleStart != null;

  // "scheduleEnd" field.
  DateTime? _scheduleEnd;
  DateTime? get scheduleEnd => _scheduleEnd;
  bool hasScheduleEnd() => _scheduleEnd != null;

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

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _date = snapshotData['date'] as DateTime?;
    _scheduleStart = snapshotData['scheduleStart'] as DateTime?;
    _scheduleEnd = snapshotData['scheduleEnd'] as DateTime?;
    _eventRef = snapshotData['eventRef'] as DocumentReference?;
    _createdTime = snapshotData['createdTime'] as DateTime?;
    _updatedTime = snapshotData['updatedTime'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('scheduleEvent')
          : FirebaseFirestore.instance.collectionGroup('scheduleEvent');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('scheduleEvent').doc();

  static Stream<ScheduleEventRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ScheduleEventRecord.fromSnapshot(s));

  static Future<ScheduleEventRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ScheduleEventRecord.fromSnapshot(s));

  static ScheduleEventRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ScheduleEventRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ScheduleEventRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ScheduleEventRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ScheduleEventRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ScheduleEventRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createScheduleEventRecordData({
  DateTime? date,
  DateTime? scheduleStart,
  DateTime? scheduleEnd,
  DocumentReference? eventRef,
  DateTime? createdTime,
  DateTime? updatedTime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'date': date,
      'scheduleStart': scheduleStart,
      'scheduleEnd': scheduleEnd,
      'eventRef': eventRef,
      'createdTime': createdTime,
      'updatedTime': updatedTime,
    }.withoutNulls,
  );

  return firestoreData;
}

class ScheduleEventRecordDocumentEquality
    implements Equality<ScheduleEventRecord> {
  const ScheduleEventRecordDocumentEquality();

  @override
  bool equals(ScheduleEventRecord? e1, ScheduleEventRecord? e2) {
    return e1?.date == e2?.date &&
        e1?.scheduleStart == e2?.scheduleStart &&
        e1?.scheduleEnd == e2?.scheduleEnd &&
        e1?.eventRef == e2?.eventRef &&
        e1?.createdTime == e2?.createdTime &&
        e1?.updatedTime == e2?.updatedTime;
  }

  @override
  int hash(ScheduleEventRecord? e) => const ListEquality().hash([
        e?.date,
        e?.scheduleStart,
        e?.scheduleEnd,
        e?.eventRef,
        e?.createdTime,
        e?.updatedTime
      ]);

  @override
  bool isValidKey(Object? o) => o is ScheduleEventRecord;
}
