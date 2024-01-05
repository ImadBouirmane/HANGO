import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class ImagesRecord extends FirestoreRecord {
  ImagesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "Image1" field.
  String? _image1;
  String get image1 => _image1 ?? '';
  bool hasImage1() => _image1 != null;

  // "Image2" field.
  String? _image2;
  String get image2 => _image2 ?? '';
  bool hasImage2() => _image2 != null;

  // "Image3" field.
  String? _image3;
  String get image3 => _image3 ?? '';
  bool hasImage3() => _image3 != null;

  // "Image4" field.
  String? _image4;
  String get image4 => _image4 ?? '';
  bool hasImage4() => _image4 != null;

  // "Image5" field.
  String? _image5;
  String get image5 => _image5 ?? '';
  bool hasImage5() => _image5 != null;

  // "Video" field.
  String? _video;
  String get video => _video ?? '';
  bool hasVideo() => _video != null;

  // "establishmentRef" field.
  DocumentReference? _establishmentRef;
  DocumentReference? get establishmentRef => _establishmentRef;
  bool hasEstablishmentRef() => _establishmentRef != null;

  // "UpdatedTime" field.
  DateTime? _updatedTime;
  DateTime? get updatedTime => _updatedTime;
  bool hasUpdatedTime() => _updatedTime != null;

  // "creaatedTime" field.
  DateTime? _creaatedTime;
  DateTime? get creaatedTime => _creaatedTime;
  bool hasCreaatedTime() => _creaatedTime != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _image1 = snapshotData['Image1'] as String?;
    _image2 = snapshotData['Image2'] as String?;
    _image3 = snapshotData['Image3'] as String?;
    _image4 = snapshotData['Image4'] as String?;
    _image5 = snapshotData['Image5'] as String?;
    _video = snapshotData['Video'] as String?;
    _establishmentRef = snapshotData['establishmentRef'] as DocumentReference?;
    _updatedTime = snapshotData['UpdatedTime'] as DateTime?;
    _creaatedTime = snapshotData['creaatedTime'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Images')
          : FirebaseFirestore.instance.collectionGroup('Images');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('Images').doc();

  static Stream<ImagesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ImagesRecord.fromSnapshot(s));

  static Future<ImagesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ImagesRecord.fromSnapshot(s));

  static ImagesRecord fromSnapshot(DocumentSnapshot snapshot) => ImagesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ImagesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ImagesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ImagesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ImagesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createImagesRecordData({
  String? image1,
  String? image2,
  String? image3,
  String? image4,
  String? image5,
  String? video,
  DocumentReference? establishmentRef,
  DateTime? updatedTime,
  DateTime? creaatedTime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Image1': image1,
      'Image2': image2,
      'Image3': image3,
      'Image4': image4,
      'Image5': image5,
      'Video': video,
      'establishmentRef': establishmentRef,
      'UpdatedTime': updatedTime,
      'creaatedTime': creaatedTime,
    }.withoutNulls,
  );

  return firestoreData;
}

class ImagesRecordDocumentEquality implements Equality<ImagesRecord> {
  const ImagesRecordDocumentEquality();

  @override
  bool equals(ImagesRecord? e1, ImagesRecord? e2) {
    return e1?.image1 == e2?.image1 &&
        e1?.image2 == e2?.image2 &&
        e1?.image3 == e2?.image3 &&
        e1?.image4 == e2?.image4 &&
        e1?.image5 == e2?.image5 &&
        e1?.video == e2?.video &&
        e1?.establishmentRef == e2?.establishmentRef &&
        e1?.updatedTime == e2?.updatedTime &&
        e1?.creaatedTime == e2?.creaatedTime;
  }

  @override
  int hash(ImagesRecord? e) => const ListEquality().hash([
        e?.image1,
        e?.image2,
        e?.image3,
        e?.image4,
        e?.image5,
        e?.video,
        e?.establishmentRef,
        e?.updatedTime,
        e?.creaatedTime
      ]);

  @override
  bool isValidKey(Object? o) => o is ImagesRecord;
}
