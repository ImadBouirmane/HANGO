import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PromotionEventRecord extends FirestoreRecord {
  PromotionEventRecord._(
    super.reference,
    super.data,
  ) {
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

  // "Title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "subTitle" field.
  String? _subTitle;
  String get subTitle => _subTitle ?? '';
  bool hasSubTitle() => _subTitle != null;

  // "usersJoined" field.
  List<DocumentReference>? _usersJoined;
  List<DocumentReference> get usersJoined => _usersJoined ?? const [];
  bool hasUsersJoined() => _usersJoined != null;

  // "startTrack" field.
  DateTime? _startTrack;
  DateTime? get startTrack => _startTrack;
  bool hasStartTrack() => _startTrack != null;

  // "endTrack" field.
  DateTime? _endTrack;
  DateTime? get endTrack => _endTrack;
  bool hasEndTrack() => _endTrack != null;

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
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _message = snapshotData['message'] as String?;
    _entranceValue = castToType<double>(snapshotData['entranceValue']);
    _entranceCheck = snapshotData['entranceCheck'] as bool?;
    _trackTime = snapshotData['trackTime'] as DateTime?;
    _eventRef = snapshotData['eventRef'] as DocumentReference?;
    _title = snapshotData['Title'] as String?;
    _subTitle = snapshotData['subTitle'] as String?;
    _usersJoined = getDataList(snapshotData['usersJoined']);
    _startTrack = snapshotData['startTrack'] as DateTime?;
    _endTrack = snapshotData['endTrack'] as DateTime?;
    _createdTime = snapshotData['createdTime'] as DateTime?;
    _updatedTime = snapshotData['updatedTime'] as DateTime?;
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
  String? title,
  String? subTitle,
  DateTime? startTrack,
  DateTime? endTrack,
  DateTime? createdTime,
  DateTime? updatedTime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userRef': userRef,
      'message': message,
      'entranceValue': entranceValue,
      'entranceCheck': entranceCheck,
      'trackTime': trackTime,
      'eventRef': eventRef,
      'Title': title,
      'subTitle': subTitle,
      'startTrack': startTrack,
      'endTrack': endTrack,
      'createdTime': createdTime,
      'updatedTime': updatedTime,
    }.withoutNulls,
  );

  return firestoreData;
}

class PromotionEventRecordDocumentEquality
    implements Equality<PromotionEventRecord> {
  const PromotionEventRecordDocumentEquality();

  @override
  bool equals(PromotionEventRecord? e1, PromotionEventRecord? e2) {
    const listEquality = ListEquality();
    return e1?.userRef == e2?.userRef &&
        e1?.message == e2?.message &&
        e1?.entranceValue == e2?.entranceValue &&
        e1?.entranceCheck == e2?.entranceCheck &&
        e1?.trackTime == e2?.trackTime &&
        e1?.eventRef == e2?.eventRef &&
        e1?.title == e2?.title &&
        e1?.subTitle == e2?.subTitle &&
        listEquality.equals(e1?.usersJoined, e2?.usersJoined) &&
        e1?.startTrack == e2?.startTrack &&
        e1?.endTrack == e2?.endTrack &&
        e1?.createdTime == e2?.createdTime &&
        e1?.updatedTime == e2?.updatedTime;
  }

  @override
  int hash(PromotionEventRecord? e) => const ListEquality().hash([
        e?.userRef,
        e?.message,
        e?.entranceValue,
        e?.entranceCheck,
        e?.trackTime,
        e?.eventRef,
        e?.title,
        e?.subTitle,
        e?.usersJoined,
        e?.startTrack,
        e?.endTrack,
        e?.createdTime,
        e?.updatedTime
      ]);

  @override
  bool isValidKey(Object? o) => o is PromotionEventRecord;
}
