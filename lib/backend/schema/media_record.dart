import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class MediaRecord extends FirestoreRecord {
  MediaRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "Image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "Video" field.
  String? _video;
  String get video => _video ?? '';
  bool hasVideo() => _video != null;

  // "updatedTime" field.
  DateTime? _updatedTime;
  DateTime? get updatedTime => _updatedTime;
  bool hasUpdatedTime() => _updatedTime != null;

  // "eventRef" field.
  DocumentReference? _eventRef;
  DocumentReference? get eventRef => _eventRef;
  bool hasEventRef() => _eventRef != null;

  // "createdTime" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _image = snapshotData['Image'] as String?;
    _video = snapshotData['Video'] as String?;
    _updatedTime = snapshotData['updatedTime'] as DateTime?;
    _eventRef = snapshotData['eventRef'] as DocumentReference?;
    _createdTime = snapshotData['createdTime'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Media')
          : FirebaseFirestore.instance.collectionGroup('Media');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('Media').doc();

  static Stream<MediaRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MediaRecord.fromSnapshot(s));

  static Future<MediaRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MediaRecord.fromSnapshot(s));

  static MediaRecord fromSnapshot(DocumentSnapshot snapshot) => MediaRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MediaRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MediaRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MediaRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MediaRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMediaRecordData({
  String? image,
  String? video,
  DateTime? updatedTime,
  DocumentReference? eventRef,
  DateTime? createdTime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Image': image,
      'Video': video,
      'updatedTime': updatedTime,
      'eventRef': eventRef,
      'createdTime': createdTime,
    }.withoutNulls,
  );

  return firestoreData;
}

class MediaRecordDocumentEquality implements Equality<MediaRecord> {
  const MediaRecordDocumentEquality();

  @override
  bool equals(MediaRecord? e1, MediaRecord? e2) {
    return e1?.image == e2?.image &&
        e1?.video == e2?.video &&
        e1?.updatedTime == e2?.updatedTime &&
        e1?.eventRef == e2?.eventRef &&
        e1?.createdTime == e2?.createdTime;
  }

  @override
  int hash(MediaRecord? e) => const ListEquality()
      .hash([e?.image, e?.video, e?.updatedTime, e?.eventRef, e?.createdTime]);

  @override
  bool isValidKey(Object? o) => o is MediaRecord;
}
