import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EstablishmentsRecord extends FirestoreRecord {
  EstablishmentsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "adresse" field.
  AddressStruct? _adresse;
  AddressStruct get adresse => _adresse ?? AddressStruct();
  bool hasAdresse() => _adresse != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "web_site" field.
  String? _webSite;
  String get webSite => _webSite ?? '';
  bool hasWebSite() => _webSite != null;

  // "type" field.
  List<String>? _type;
  List<String> get type => _type ?? const [];
  bool hasType() => _type != null;

  // "music_style" field.
  List<String>? _musicStyle;
  List<String> get musicStyle => _musicStyle ?? const [];
  bool hasMusicStyle() => _musicStyle != null;

  // "speciality" field.
  String? _speciality;
  String get speciality => _speciality ?? '';
  bool hasSpeciality() => _speciality != null;

  // "terrasse" field.
  bool? _terrasse;
  bool get terrasse => _terrasse ?? false;
  bool hasTerrasse() => _terrasse != null;

  // "reservation" field.
  bool? _reservation;
  bool get reservation => _reservation ?? false;
  bool hasReservation() => _reservation != null;

  // "food" field.
  List<String>? _food;
  List<String> get food => _food ?? const [];
  bool hasFood() => _food != null;

  // "cigarette_machine" field.
  bool? _cigaretteMachine;
  bool get cigaretteMachine => _cigaretteMachine ?? false;
  bool hasCigaretteMachine() => _cigaretteMachine != null;

  // "game" field.
  List<String>? _game;
  List<String> get game => _game ?? const [];
  bool hasGame() => _game != null;

  // "events_references" field.
  List<DocumentReference>? _eventsReferences;
  List<DocumentReference> get eventsReferences => _eventsReferences ?? const [];
  bool hasEventsReferences() => _eventsReferences != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "Location" field.
  LatLng? _location;
  LatLng? get location => _location;
  bool hasLocation() => _location != null;

  // "updatedAt" field.
  DateTime? _updatedAt;
  DateTime? get updatedAt => _updatedAt;
  bool hasUpdatedAt() => _updatedAt != null;

  // "eventRef" field.
  DocumentReference? _eventRef;
  DocumentReference? get eventRef => _eventRef;
  bool hasEventRef() => _eventRef != null;

  // "scheduleEstablishment" field.
  DocumentReference? _scheduleEstablishment;
  DocumentReference? get scheduleEstablishment => _scheduleEstablishment;
  bool hasScheduleEstablishment() => _scheduleEstablishment != null;

  // "isManager" field.
  bool? _isManager;
  bool get isManager => _isManager ?? false;
  bool hasIsManager() => _isManager != null;

  // "isAdmin" field.
  bool? _isAdmin;
  bool get isAdmin => _isAdmin ?? false;
  bool hasIsAdmin() => _isAdmin != null;

  void _initializeFields() {
    _createdTime = snapshotData['created_time'] as DateTime?;
    _name = snapshotData['name'] as String?;
    _adresse = AddressStruct.maybeFromMap(snapshotData['adresse']);
    _email = snapshotData['email'] as String?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _webSite = snapshotData['web_site'] as String?;
    _type = getDataList(snapshotData['type']);
    _musicStyle = getDataList(snapshotData['music_style']);
    _speciality = snapshotData['speciality'] as String?;
    _terrasse = snapshotData['terrasse'] as bool?;
    _reservation = snapshotData['reservation'] as bool?;
    _food = getDataList(snapshotData['food']);
    _cigaretteMachine = snapshotData['cigarette_machine'] as bool?;
    _game = getDataList(snapshotData['game']);
    _eventsReferences = getDataList(snapshotData['events_references']);
    _description = snapshotData['description'] as String?;
    _location = snapshotData['Location'] as LatLng?;
    _updatedAt = snapshotData['updatedAt'] as DateTime?;
    _eventRef = snapshotData['eventRef'] as DocumentReference?;
    _scheduleEstablishment =
        snapshotData['scheduleEstablishment'] as DocumentReference?;
    _isManager = snapshotData['isManager'] as bool?;
    _isAdmin = snapshotData['isAdmin'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('establishments');

  static Stream<EstablishmentsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EstablishmentsRecord.fromSnapshot(s));

  static Future<EstablishmentsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EstablishmentsRecord.fromSnapshot(s));

  static EstablishmentsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      EstablishmentsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EstablishmentsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EstablishmentsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EstablishmentsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EstablishmentsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEstablishmentsRecordData({
  DateTime? createdTime,
  String? name,
  AddressStruct? adresse,
  String? email,
  String? phoneNumber,
  String? webSite,
  String? speciality,
  bool? terrasse,
  bool? reservation,
  bool? cigaretteMachine,
  String? description,
  LatLng? location,
  DateTime? updatedAt,
  DocumentReference? eventRef,
  DocumentReference? scheduleEstablishment,
  bool? isManager,
  bool? isAdmin,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_time': createdTime,
      'name': name,
      'adresse': AddressStruct().toMap(),
      'email': email,
      'phone_number': phoneNumber,
      'web_site': webSite,
      'speciality': speciality,
      'terrasse': terrasse,
      'reservation': reservation,
      'cigarette_machine': cigaretteMachine,
      'description': description,
      'Location': location,
      'updatedAt': updatedAt,
      'eventRef': eventRef,
      'scheduleEstablishment': scheduleEstablishment,
      'isManager': isManager,
      'isAdmin': isAdmin,
    }.withoutNulls,
  );

  // Handle nested data for "adresse" field.
  addAddressStructData(firestoreData, adresse, 'adresse');

  return firestoreData;
}

class EstablishmentsRecordDocumentEquality
    implements Equality<EstablishmentsRecord> {
  const EstablishmentsRecordDocumentEquality();

  @override
  bool equals(EstablishmentsRecord? e1, EstablishmentsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.createdTime == e2?.createdTime &&
        e1?.name == e2?.name &&
        e1?.adresse == e2?.adresse &&
        e1?.email == e2?.email &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.webSite == e2?.webSite &&
        listEquality.equals(e1?.type, e2?.type) &&
        listEquality.equals(e1?.musicStyle, e2?.musicStyle) &&
        e1?.speciality == e2?.speciality &&
        e1?.terrasse == e2?.terrasse &&
        e1?.reservation == e2?.reservation &&
        listEquality.equals(e1?.food, e2?.food) &&
        e1?.cigaretteMachine == e2?.cigaretteMachine &&
        listEquality.equals(e1?.game, e2?.game) &&
        listEquality.equals(e1?.eventsReferences, e2?.eventsReferences) &&
        e1?.description == e2?.description &&
        e1?.location == e2?.location &&
        e1?.updatedAt == e2?.updatedAt &&
        e1?.eventRef == e2?.eventRef &&
        e1?.scheduleEstablishment == e2?.scheduleEstablishment &&
        e1?.isManager == e2?.isManager &&
        e1?.isAdmin == e2?.isAdmin;
  }

  @override
  int hash(EstablishmentsRecord? e) => const ListEquality().hash([
        e?.createdTime,
        e?.name,
        e?.adresse,
        e?.email,
        e?.phoneNumber,
        e?.webSite,
        e?.type,
        e?.musicStyle,
        e?.speciality,
        e?.terrasse,
        e?.reservation,
        e?.food,
        e?.cigaretteMachine,
        e?.game,
        e?.eventsReferences,
        e?.description,
        e?.location,
        e?.updatedAt,
        e?.eventRef,
        e?.scheduleEstablishment,
        e?.isManager,
        e?.isAdmin
      ]);

  @override
  bool isValidKey(Object? o) => o is EstablishmentsRecord;
}
