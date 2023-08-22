import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ScheduleRecord extends FirestoreRecord {
  ScheduleRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "mondayIsClose" field.
  bool? _mondayIsClose;
  bool get mondayIsClose => _mondayIsClose ?? false;
  bool hasMondayIsClose() => _mondayIsClose != null;

  // "tuesdayIsClose" field.
  bool? _tuesdayIsClose;
  bool get tuesdayIsClose => _tuesdayIsClose ?? false;
  bool hasTuesdayIsClose() => _tuesdayIsClose != null;

  // "wednesdayIsClose" field.
  bool? _wednesdayIsClose;
  bool get wednesdayIsClose => _wednesdayIsClose ?? false;
  bool hasWednesdayIsClose() => _wednesdayIsClose != null;

  // "thursdayIsClose" field.
  bool? _thursdayIsClose;
  bool get thursdayIsClose => _thursdayIsClose ?? false;
  bool hasThursdayIsClose() => _thursdayIsClose != null;

  // "fridayIsClose" field.
  bool? _fridayIsClose;
  bool get fridayIsClose => _fridayIsClose ?? false;
  bool hasFridayIsClose() => _fridayIsClose != null;

  // "saturdayIsClose" field.
  bool? _saturdayIsClose;
  bool get saturdayIsClose => _saturdayIsClose ?? false;
  bool hasSaturdayIsClose() => _saturdayIsClose != null;

  // "sundayIsClose" field.
  bool? _sundayIsClose;
  bool get sundayIsClose => _sundayIsClose ?? false;
  bool hasSundayIsClose() => _sundayIsClose != null;

  // "mondayOpening" field.
  String? _mondayOpening;
  String get mondayOpening => _mondayOpening ?? '';
  bool hasMondayOpening() => _mondayOpening != null;

  // "mondayClosing" field.
  String? _mondayClosing;
  String get mondayClosing => _mondayClosing ?? '';
  bool hasMondayClosing() => _mondayClosing != null;

  // "tuesdayOpening" field.
  String? _tuesdayOpening;
  String get tuesdayOpening => _tuesdayOpening ?? '';
  bool hasTuesdayOpening() => _tuesdayOpening != null;

  // "tuesdayClosing" field.
  String? _tuesdayClosing;
  String get tuesdayClosing => _tuesdayClosing ?? '';
  bool hasTuesdayClosing() => _tuesdayClosing != null;

  // "wednesdayOpening" field.
  String? _wednesdayOpening;
  String get wednesdayOpening => _wednesdayOpening ?? '';
  bool hasWednesdayOpening() => _wednesdayOpening != null;

  // "wednesdayClosing" field.
  String? _wednesdayClosing;
  String get wednesdayClosing => _wednesdayClosing ?? '';
  bool hasWednesdayClosing() => _wednesdayClosing != null;

  // "thursdayOpening" field.
  String? _thursdayOpening;
  String get thursdayOpening => _thursdayOpening ?? '';
  bool hasThursdayOpening() => _thursdayOpening != null;

  // "thursdayClosing" field.
  String? _thursdayClosing;
  String get thursdayClosing => _thursdayClosing ?? '';
  bool hasThursdayClosing() => _thursdayClosing != null;

  // "fridayOpening" field.
  String? _fridayOpening;
  String get fridayOpening => _fridayOpening ?? '';
  bool hasFridayOpening() => _fridayOpening != null;

  // "fridayClosing" field.
  String? _fridayClosing;
  String get fridayClosing => _fridayClosing ?? '';
  bool hasFridayClosing() => _fridayClosing != null;

  // "saturdayOpening" field.
  String? _saturdayOpening;
  String get saturdayOpening => _saturdayOpening ?? '';
  bool hasSaturdayOpening() => _saturdayOpening != null;

  // "saturdayClosing" field.
  String? _saturdayClosing;
  String get saturdayClosing => _saturdayClosing ?? '';
  bool hasSaturdayClosing() => _saturdayClosing != null;

  // "sundayOpening" field.
  String? _sundayOpening;
  String get sundayOpening => _sundayOpening ?? '';
  bool hasSundayOpening() => _sundayOpening != null;

  // "sundayClosing" field.
  String? _sundayClosing;
  String get sundayClosing => _sundayClosing ?? '';
  bool hasSundayClosing() => _sundayClosing != null;

  // "estblishmentRef" field.
  DocumentReference? _estblishmentRef;
  DocumentReference? get estblishmentRef => _estblishmentRef;
  bool hasEstblishmentRef() => _estblishmentRef != null;

  // "updatedAt" field.
  DateTime? _updatedAt;
  DateTime? get updatedAt => _updatedAt;
  bool hasUpdatedAt() => _updatedAt != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _mondayIsClose = snapshotData['mondayIsClose'] as bool?;
    _tuesdayIsClose = snapshotData['tuesdayIsClose'] as bool?;
    _wednesdayIsClose = snapshotData['wednesdayIsClose'] as bool?;
    _thursdayIsClose = snapshotData['thursdayIsClose'] as bool?;
    _fridayIsClose = snapshotData['fridayIsClose'] as bool?;
    _saturdayIsClose = snapshotData['saturdayIsClose'] as bool?;
    _sundayIsClose = snapshotData['sundayIsClose'] as bool?;
    _mondayOpening = snapshotData['mondayOpening'] as String?;
    _mondayClosing = snapshotData['mondayClosing'] as String?;
    _tuesdayOpening = snapshotData['tuesdayOpening'] as String?;
    _tuesdayClosing = snapshotData['tuesdayClosing'] as String?;
    _wednesdayOpening = snapshotData['wednesdayOpening'] as String?;
    _wednesdayClosing = snapshotData['wednesdayClosing'] as String?;
    _thursdayOpening = snapshotData['thursdayOpening'] as String?;
    _thursdayClosing = snapshotData['thursdayClosing'] as String?;
    _fridayOpening = snapshotData['fridayOpening'] as String?;
    _fridayClosing = snapshotData['fridayClosing'] as String?;
    _saturdayOpening = snapshotData['saturdayOpening'] as String?;
    _saturdayClosing = snapshotData['saturdayClosing'] as String?;
    _sundayOpening = snapshotData['sundayOpening'] as String?;
    _sundayClosing = snapshotData['sundayClosing'] as String?;
    _estblishmentRef = snapshotData['estblishmentRef'] as DocumentReference?;
    _updatedAt = snapshotData['updatedAt'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('schedule')
          : FirebaseFirestore.instance.collectionGroup('schedule');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('schedule').doc();

  static Stream<ScheduleRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ScheduleRecord.fromSnapshot(s));

  static Future<ScheduleRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ScheduleRecord.fromSnapshot(s));

  static ScheduleRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ScheduleRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ScheduleRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ScheduleRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ScheduleRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ScheduleRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createScheduleRecordData({
  bool? mondayIsClose,
  bool? tuesdayIsClose,
  bool? wednesdayIsClose,
  bool? thursdayIsClose,
  bool? fridayIsClose,
  bool? saturdayIsClose,
  bool? sundayIsClose,
  String? mondayOpening,
  String? mondayClosing,
  String? tuesdayOpening,
  String? tuesdayClosing,
  String? wednesdayOpening,
  String? wednesdayClosing,
  String? thursdayOpening,
  String? thursdayClosing,
  String? fridayOpening,
  String? fridayClosing,
  String? saturdayOpening,
  String? saturdayClosing,
  String? sundayOpening,
  String? sundayClosing,
  DocumentReference? estblishmentRef,
  DateTime? updatedAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'mondayIsClose': mondayIsClose,
      'tuesdayIsClose': tuesdayIsClose,
      'wednesdayIsClose': wednesdayIsClose,
      'thursdayIsClose': thursdayIsClose,
      'fridayIsClose': fridayIsClose,
      'saturdayIsClose': saturdayIsClose,
      'sundayIsClose': sundayIsClose,
      'mondayOpening': mondayOpening,
      'mondayClosing': mondayClosing,
      'tuesdayOpening': tuesdayOpening,
      'tuesdayClosing': tuesdayClosing,
      'wednesdayOpening': wednesdayOpening,
      'wednesdayClosing': wednesdayClosing,
      'thursdayOpening': thursdayOpening,
      'thursdayClosing': thursdayClosing,
      'fridayOpening': fridayOpening,
      'fridayClosing': fridayClosing,
      'saturdayOpening': saturdayOpening,
      'saturdayClosing': saturdayClosing,
      'sundayOpening': sundayOpening,
      'sundayClosing': sundayClosing,
      'estblishmentRef': estblishmentRef,
      'updatedAt': updatedAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class ScheduleRecordDocumentEquality implements Equality<ScheduleRecord> {
  const ScheduleRecordDocumentEquality();

  @override
  bool equals(ScheduleRecord? e1, ScheduleRecord? e2) {
    return e1?.mondayIsClose == e2?.mondayIsClose &&
        e1?.tuesdayIsClose == e2?.tuesdayIsClose &&
        e1?.wednesdayIsClose == e2?.wednesdayIsClose &&
        e1?.thursdayIsClose == e2?.thursdayIsClose &&
        e1?.fridayIsClose == e2?.fridayIsClose &&
        e1?.saturdayIsClose == e2?.saturdayIsClose &&
        e1?.sundayIsClose == e2?.sundayIsClose &&
        e1?.mondayOpening == e2?.mondayOpening &&
        e1?.mondayClosing == e2?.mondayClosing &&
        e1?.tuesdayOpening == e2?.tuesdayOpening &&
        e1?.tuesdayClosing == e2?.tuesdayClosing &&
        e1?.wednesdayOpening == e2?.wednesdayOpening &&
        e1?.wednesdayClosing == e2?.wednesdayClosing &&
        e1?.thursdayOpening == e2?.thursdayOpening &&
        e1?.thursdayClosing == e2?.thursdayClosing &&
        e1?.fridayOpening == e2?.fridayOpening &&
        e1?.fridayClosing == e2?.fridayClosing &&
        e1?.saturdayOpening == e2?.saturdayOpening &&
        e1?.saturdayClosing == e2?.saturdayClosing &&
        e1?.sundayOpening == e2?.sundayOpening &&
        e1?.sundayClosing == e2?.sundayClosing &&
        e1?.estblishmentRef == e2?.estblishmentRef &&
        e1?.updatedAt == e2?.updatedAt;
  }

  @override
  int hash(ScheduleRecord? e) => const ListEquality().hash([
        e?.mondayIsClose,
        e?.tuesdayIsClose,
        e?.wednesdayIsClose,
        e?.thursdayIsClose,
        e?.fridayIsClose,
        e?.saturdayIsClose,
        e?.sundayIsClose,
        e?.mondayOpening,
        e?.mondayClosing,
        e?.tuesdayOpening,
        e?.tuesdayClosing,
        e?.wednesdayOpening,
        e?.wednesdayClosing,
        e?.thursdayOpening,
        e?.thursdayClosing,
        e?.fridayOpening,
        e?.fridayClosing,
        e?.saturdayOpening,
        e?.saturdayClosing,
        e?.sundayOpening,
        e?.sundayClosing,
        e?.estblishmentRef,
        e?.updatedAt
      ]);

  @override
  bool isValidKey(Object? o) => o is ScheduleRecord;
}
