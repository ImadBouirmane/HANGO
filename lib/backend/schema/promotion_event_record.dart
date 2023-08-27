import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PromotionEventRecord extends FirestoreRecord {
  PromotionEventRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "message" field.
  String? _message;
  String get message => _message ?? '';
  bool hasMessage() => _message != null;

  // "entranceValue" field.
  double? _entranceValue;
  double get entranceValue => _entranceValue ?? 0.0;
  bool hasEntranceValue() => _entranceValue != null;

  // "entranceCheck" field.
  bool? _entranceCheck;
  bool get entranceCheck => _entranceCheck ?? false;
  bool hasEntranceCheck() => _entranceCheck != null;

  // "trackTime" field.
  DateTime? _trackTime;
  DateTime? get trackTime => _trackTime;
  bool hasTrackTime() => _trackTime != null;

  // "eventRef" field.
  DocumentReference? _eventRef;
  DocumentReference? get eventRef => _eventRef;
  bool hasEventRef() => _eventRef != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _message = snapshotData['message'] as String?;
    _entranceValue = castToType<double>(snapshotData['entranceValue']);
    _entranceCheck = snapshotData['entranceCheck'] as bool?;
    _trackTime = snapshotData['trackTime'] as DateTime?;
    _eventRef = snapshotData['eventRef'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('PromotionEvent')
          : FirebaseFirestore.instance.collectionGroup('PromotionEvent');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('PromotionEvent').doc();

  static Stream<PromotionEventRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PromotionEventRecord.fromSnapshot(s));

  static Future<PromotionEventRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PromotionEventRecord.fromSnapshot(s));

  static PromotionEventRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PromotionEventRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PromotionEventRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PromotionEventRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PromotionEventRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PromotionEventRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPromotionEventRecordData({
  DocumentReference? userRef,
  String? message,
  double? entranceValue,
  bool? entranceCheck,
  DateTime? trackTime,
  DocumentReference? eventRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userRef': userRef,
      'message': message,
      'entranceValue': entranceValue,
      'entranceCheck': entranceCheck,
      'trackTime': trackTime,
      'eventRef': eventRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class PromotionEventRecordDocumentEquality
    implements Equality<PromotionEventRecord> {
  const PromotionEventRecordDocumentEquality();

  @override
  bool equals(PromotionEventRecord? e1, PromotionEventRecord? e2) {
    return e1?.userRef == e2?.userRef &&
        e1?.message == e2?.message &&
        e1?.entranceValue == e2?.entranceValue &&
        e1?.entranceCheck == e2?.entranceCheck &&
        e1?.trackTime == e2?.trackTime &&
        e1?.eventRef == e2?.eventRef;
  }

  @override
  int hash(PromotionEventRecord? e) => const ListEquality().hash([
        e?.userRef,
        e?.message,
        e?.entranceValue,
        e?.entranceCheck,
        e?.trackTime,
        e?.eventRef
      ]);

  @override
  bool isValidKey(Object? o) => o is PromotionEventRecord;
}
