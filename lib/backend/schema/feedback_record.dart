import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FeedbackRecord extends FirestoreRecord {
  FeedbackRecord._(
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

  // "createdTime" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "isSuggestion" field.
  bool? _isSuggestion;
  bool get isSuggestion => _isSuggestion ?? false;
  bool hasIsSuggestion() => _isSuggestion != null;

  // "isReport" field.
  bool? _isReport;
  bool get isReport => _isReport ?? false;
  bool hasIsReport() => _isReport != null;

  void _initializeFields() {
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _message = snapshotData['message'] as String?;
    _createdTime = snapshotData['createdTime'] as DateTime?;
    _isSuggestion = snapshotData['isSuggestion'] as bool?;
    _isReport = snapshotData['isReport'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Feedback');

  static Stream<FeedbackRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FeedbackRecord.fromSnapshot(s));

  static Future<FeedbackRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FeedbackRecord.fromSnapshot(s));

  static FeedbackRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FeedbackRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FeedbackRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FeedbackRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FeedbackRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FeedbackRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFeedbackRecordData({
  DocumentReference? userRef,
  String? message,
  DateTime? createdTime,
  bool? isSuggestion,
  bool? isReport,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userRef': userRef,
      'message': message,
      'createdTime': createdTime,
      'isSuggestion': isSuggestion,
      'isReport': isReport,
    }.withoutNulls,
  );

  return firestoreData;
}

class FeedbackRecordDocumentEquality implements Equality<FeedbackRecord> {
  const FeedbackRecordDocumentEquality();

  @override
  bool equals(FeedbackRecord? e1, FeedbackRecord? e2) {
    return e1?.userRef == e2?.userRef &&
        e1?.message == e2?.message &&
        e1?.createdTime == e2?.createdTime &&
        e1?.isSuggestion == e2?.isSuggestion &&
        e1?.isReport == e2?.isReport;
  }

  @override
  int hash(FeedbackRecord? e) => const ListEquality().hash(
      [e?.userRef, e?.message, e?.createdTime, e?.isSuggestion, e?.isReport]);

  @override
  bool isValidKey(Object? o) => o is FeedbackRecord;
}
