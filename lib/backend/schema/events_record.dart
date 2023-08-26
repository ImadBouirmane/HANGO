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

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "Location" field.
  LatLng? _location;
  LatLng? get location => _location;
  bool hasLocation() => _location != null;

  // "eventRef" field.
  DocumentReference? _eventRef;
  DocumentReference? get eventRef => _eventRef;
  bool hasEventRef() => _eventRef != null;

  // "entranceCheck" field.
  bool? _entranceCheck;
  bool get entranceCheck => _entranceCheck ?? false;
  bool hasEntranceCheck() => _entranceCheck != null;

  // "updatedAt" field.
  DateTime? _updatedAt;
  DateTime? get updatedAt => _updatedAt;
  bool hasUpdatedAt() => _updatedAt != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "schedule" field.
  String? _schedule;
  String get schedule => _schedule ?? '';
  bool hasSchedule() => _schedule != null;

  // "artistSchedule" field.
  DateTime? _artistSchedule;
  DateTime? get artistSchedule => _artistSchedule;
  bool hasArtistSchedule() => _artistSchedule != null;

  void _initializeFields() {
    _eventId = snapshotData['event_id'] as String?;
    _establishmentId = snapshotData['establishment_id'] as DocumentReference?;
    _name = snapshotData['name'] as String?;
    _title = snapshotData['title'] as String?;
    _description = snapshotData['description'] as String?;
    _date = snapshotData['date'] as DateTime?;
    _siteWeb = snapshotData['site_web'] as String?;
    _musicSytle = getDataList(snapshotData['music_sytle']);
    _entrance = castToType<double>(snapshotData['entrance']);
    _promo = snapshotData['promo'] as String?;
    _artist = getDataList(snapshotData['artist']);
    _createdTime = snapshotData['created_time'] as DateTime?;
    _location = snapshotData['Location'] as LatLng?;
    _eventRef = snapshotData['eventRef'] as DocumentReference?;
    _entranceCheck = snapshotData['entranceCheck'] as bool?;
    _updatedAt = snapshotData['updatedAt'] as DateTime?;
    _type = snapshotData['type'] as String?;
    _schedule = snapshotData['schedule'] as String?;
    _artistSchedule = snapshotData['artistSchedule'] as DateTime?;
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
  String? siteWeb,
  double? entrance,
  String? promo,
  DateTime? createdTime,
  LatLng? location,
  DocumentReference? eventRef,
  bool? entranceCheck,
  DateTime? updatedAt,
  String? type,
  String? schedule,
  DateTime? artistSchedule,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'event_id': eventId,
      'establishment_id': establishmentId,
      'name': name,
      'title': title,
      'description': description,
      'date': date,
      'site_web': siteWeb,
      'entrance': entrance,
      'promo': promo,
      'created_time': createdTime,
      'Location': location,
      'eventRef': eventRef,
      'entranceCheck': entranceCheck,
      'updatedAt': updatedAt,
      'type': type,
      'schedule': schedule,
      'artistSchedule': artistSchedule,
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
        e1?.siteWeb == e2?.siteWeb &&
        listEquality.equals(e1?.musicSytle, e2?.musicSytle) &&
        e1?.entrance == e2?.entrance &&
        e1?.promo == e2?.promo &&
        listEquality.equals(e1?.artist, e2?.artist) &&
        e1?.createdTime == e2?.createdTime &&
        e1?.location == e2?.location &&
        e1?.eventRef == e2?.eventRef &&
        e1?.entranceCheck == e2?.entranceCheck &&
        e1?.updatedAt == e2?.updatedAt &&
        e1?.type == e2?.type &&
        e1?.schedule == e2?.schedule &&
        e1?.artistSchedule == e2?.artistSchedule;
  }

  @override
  int hash(EventsRecord? e) => const ListEquality().hash([
        e?.eventId,
        e?.establishmentId,
        e?.name,
        e?.title,
        e?.description,
        e?.date,
        e?.siteWeb,
        e?.musicSytle,
        e?.entrance,
        e?.promo,
        e?.artist,
        e?.createdTime,
        e?.location,
        e?.eventRef,
        e?.entranceCheck,
        e?.updatedAt,
        e?.type,
        e?.schedule,
        e?.artistSchedule
      ]);

  @override
  bool isValidKey(Object? o) => o is EventsRecord;
}
