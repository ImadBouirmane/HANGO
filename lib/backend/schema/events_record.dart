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

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "site_web" field.
  String? _siteWeb;
  String get siteWeb => _siteWeb ?? '';
  bool hasSiteWeb() => _siteWeb != null;

  // "music_sytle" field.
  List<String>? _musicSytle;
  List<String> get musicSytle => _musicSytle ?? const [];
  bool hasMusicSytle() => _musicSytle != null;

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

  // "updatedAt" field.
  DateTime? _updatedAt;
  DateTime? get updatedAt => _updatedAt;
  bool hasUpdatedAt() => _updatedAt != null;

  // "dateEvent" field.
  DateTime? _dateEvent;
  DateTime? get dateEvent => _dateEvent;
  bool hasDateEvent() => _dateEvent != null;

  // "typeEvent" field.
  List<String>? _typeEvent;
  List<String> get typeEvent => _typeEvent ?? const [];
  bool hasTypeEvent() => _typeEvent != null;

  // "eventEntrancePrice" field.
  String? _eventEntrancePrice;
  String get eventEntrancePrice => _eventEntrancePrice ?? '';
  bool hasEventEntrancePrice() => _eventEntrancePrice != null;

  // "entrancePrice" field.
  String? _entrancePrice;
  String get entrancePrice => _entrancePrice ?? '';
  bool hasEntrancePrice() => _entrancePrice != null;

  void _initializeFields() {
    _eventId = snapshotData['event_id'] as String?;
    _establishmentId = snapshotData['establishment_id'] as DocumentReference?;
    _title = snapshotData['title'] as String?;
    _description = snapshotData['description'] as String?;
    _siteWeb = snapshotData['site_web'] as String?;
    _musicSytle = getDataList(snapshotData['music_sytle']);
    _artist = getDataList(snapshotData['artist']);
    _createdTime = snapshotData['created_time'] as DateTime?;
    _location = snapshotData['Location'] as LatLng?;
    _eventRef = snapshotData['eventRef'] as DocumentReference?;
    _updatedAt = snapshotData['updatedAt'] as DateTime?;
    _dateEvent = snapshotData['dateEvent'] as DateTime?;
    _typeEvent = getDataList(snapshotData['typeEvent']);
    _eventEntrancePrice = snapshotData['eventEntrancePrice'] as String?;
    _entrancePrice = snapshotData['entrancePrice'] as String?;
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
  String? title,
  String? description,
  String? siteWeb,
  DateTime? createdTime,
  LatLng? location,
  DocumentReference? eventRef,
  DateTime? updatedAt,
  DateTime? dateEvent,
  String? eventEntrancePrice,
  String? entrancePrice,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'event_id': eventId,
      'establishment_id': establishmentId,
      'title': title,
      'description': description,
      'site_web': siteWeb,
      'created_time': createdTime,
      'Location': location,
      'eventRef': eventRef,
      'updatedAt': updatedAt,
      'dateEvent': dateEvent,
      'eventEntrancePrice': eventEntrancePrice,
      'entrancePrice': entrancePrice,
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
        e1?.title == e2?.title &&
        e1?.description == e2?.description &&
        e1?.siteWeb == e2?.siteWeb &&
        listEquality.equals(e1?.musicSytle, e2?.musicSytle) &&
        listEquality.equals(e1?.artist, e2?.artist) &&
        e1?.createdTime == e2?.createdTime &&
        e1?.location == e2?.location &&
        e1?.eventRef == e2?.eventRef &&
        e1?.updatedAt == e2?.updatedAt &&
        e1?.dateEvent == e2?.dateEvent &&
        listEquality.equals(e1?.typeEvent, e2?.typeEvent) &&
        e1?.eventEntrancePrice == e2?.eventEntrancePrice &&
        e1?.entrancePrice == e2?.entrancePrice;
  }

  @override
  int hash(EventsRecord? e) => const ListEquality().hash([
        e?.eventId,
        e?.establishmentId,
        e?.title,
        e?.description,
        e?.siteWeb,
        e?.musicSytle,
        e?.artist,
        e?.createdTime,
        e?.location,
        e?.eventRef,
        e?.updatedAt,
        e?.dateEvent,
        e?.typeEvent,
        e?.eventEntrancePrice,
        e?.entrancePrice
      ]);

  @override
  bool isValidKey(Object? o) => o is EventsRecord;
}
