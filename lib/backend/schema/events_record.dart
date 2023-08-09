import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EventsRecord extends FirestoreRecord {
  EventsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "event_id" field.
  String? _eventId;
  String get eventId => _eventId ?? '';
  bool hasEventId() => _eventId != null;

  // "establishment_id" field.
  DocumentReference? _establishmentId;
  DocumentReference? get establishmentId => _establishmentId;
  bool hasEstablishmentId() => _establishmentId != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "schedule" field.
  DateTime? _schedule;
  DateTime? get schedule => _schedule;
  bool hasSchedule() => _schedule != null;

  // "site_web" field.
  String? _siteWeb;
  String get siteWeb => _siteWeb ?? '';
  bool hasSiteWeb() => _siteWeb != null;

  // "music_sytle" field.
  List<String>? _musicSytle;
  List<String> get musicSytle => _musicSytle ?? const [];
  bool hasMusicSytle() => _musicSytle != null;

  // "entrance" field.
  double? _entrance;
  double get entrance => _entrance ?? 0.0;
  bool hasEntrance() => _entrance != null;

  // "promo" field.
  String? _promo;
  String get promo => _promo ?? '';
  bool hasPromo() => _promo != null;

  // "artist" field.
  List<String>? _artist;
  List<String> get artist => _artist ?? const [];
  bool hasArtist() => _artist != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  void _initializeFields() {
    _eventId = snapshotData['event_id'] as String?;
    _establishmentId = snapshotData['establishment_id'] as DocumentReference?;
    _name = snapshotData['name'] as String?;
    _title = snapshotData['title'] as String?;
    _description = snapshotData['description'] as String?;
    _date = snapshotData['date'] as DateTime?;
    _schedule = snapshotData['schedule'] as DateTime?;
    _siteWeb = snapshotData['site_web'] as String?;
    _musicSytle = getDataList(snapshotData['music_sytle']);
    _entrance = castToType<double>(snapshotData['entrance']);
    _promo = snapshotData['promo'] as String?;
    _artist = getDataList(snapshotData['artist']);
    _image = snapshotData['image'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('events');

  static Stream<EventsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EventsRecord.fromSnapshot(s));

  static Future<EventsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EventsRecord.fromSnapshot(s));

  static EventsRecord fromSnapshot(DocumentSnapshot snapshot) => EventsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EventsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EventsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EventsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EventsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEventsRecordData({
  String? eventId,
  DocumentReference? establishmentId,
  String? name,
  String? title,
  String? description,
  DateTime? date,
  DateTime? schedule,
  String? siteWeb,
  double? entrance,
  String? promo,
  String? image,
  DateTime? createdTime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'event_id': eventId,
      'establishment_id': establishmentId,
      'name': name,
      'title': title,
      'description': description,
      'date': date,
      'schedule': schedule,
      'site_web': siteWeb,
      'entrance': entrance,
      'promo': promo,
      'image': image,
      'created_time': createdTime,
    }.withoutNulls,
  );

  return firestoreData;
}

class EventsRecordDocumentEquality implements Equality<EventsRecord> {
  const EventsRecordDocumentEquality();

  @override
  bool equals(EventsRecord? e1, EventsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.eventId == e2?.eventId &&
        e1?.establishmentId == e2?.establishmentId &&
        e1?.name == e2?.name &&
        e1?.title == e2?.title &&
        e1?.description == e2?.description &&
        e1?.date == e2?.date &&
        e1?.schedule == e2?.schedule &&
        e1?.siteWeb == e2?.siteWeb &&
        listEquality.equals(e1?.musicSytle, e2?.musicSytle) &&
        e1?.entrance == e2?.entrance &&
        e1?.promo == e2?.promo &&
        listEquality.equals(e1?.artist, e2?.artist) &&
        e1?.image == e2?.image &&
        e1?.createdTime == e2?.createdTime;
  }

  @override
  int hash(EventsRecord? e) => const ListEquality().hash([
        e?.eventId,
        e?.establishmentId,
        e?.name,
        e?.title,
        e?.description,
        e?.date,
        e?.schedule,
        e?.siteWeb,
        e?.musicSytle,
        e?.entrance,
        e?.promo,
        e?.artist,
        e?.image,
        e?.createdTime
      ]);

  @override
  bool isValidKey(Object? o) => o is EventsRecord;
}
