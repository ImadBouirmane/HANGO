import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "last_name" field.
  String? _lastName;
  String get lastName => _lastName ?? '';
  bool hasLastName() => _lastName != null;

  // "administrator_role" field.
  bool? _administratorRole;
  bool get administratorRole => _administratorRole ?? false;
  bool hasAdministratorRole() => _administratorRole != null;

  // "user_role" field.
  bool? _userRole;
  bool get userRole => _userRole ?? false;
  bool hasUserRole() => _userRole != null;

  // "age" field.
  int? _age;
  int get age => _age ?? 0;
  bool hasAge() => _age != null;

  // "birthday" field.
  DateTime? _birthday;
  DateTime? get birthday => _birthday;
  bool hasBirthday() => _birthday != null;

  // "gender" field.
  String? _gender;
  String get gender => _gender ?? '';
  bool hasGender() => _gender != null;

  // "first_name" field.
  String? _firstName;
  String get firstName => _firstName ?? '';
  bool hasFirstName() => _firstName != null;

  // "updatedTime" field.
  DateTime? _updatedTime;
  DateTime? get updatedTime => _updatedTime;
  bool hasUpdatedTime() => _updatedTime != null;

  // "promotionEvents" field.
  List<DocumentReference>? _promotionEvents;
  List<DocumentReference> get promotionEvents => _promotionEvents ?? const [];
  bool hasPromotionEvents() => _promotionEvents != null;

  // "managerRole" field.
  bool? _managerRole;
  bool get managerRole => _managerRole ?? false;
  bool hasManagerRole() => _managerRole != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _lastName = snapshotData['last_name'] as String?;
    _administratorRole = snapshotData['administrator_role'] as bool?;
    _userRole = snapshotData['user_role'] as bool?;
    _age = castToType<int>(snapshotData['age']);
    _birthday = snapshotData['birthday'] as DateTime?;
    _gender = snapshotData['gender'] as String?;
    _firstName = snapshotData['first_name'] as String?;
    _updatedTime = snapshotData['updatedTime'] as DateTime?;
    _promotionEvents = getDataList(snapshotData['promotionEvents']);
    _managerRole = snapshotData['managerRole'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? lastName,
  bool? administratorRole,
  bool? userRole,
  int? age,
  DateTime? birthday,
  String? gender,
  String? firstName,
  DateTime? updatedTime,
  bool? managerRole,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'last_name': lastName,
      'administrator_role': administratorRole,
      'user_role': userRole,
      'age': age,
      'birthday': birthday,
      'gender': gender,
      'first_name': firstName,
      'updatedTime': updatedTime,
      'managerRole': managerRole,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.lastName == e2?.lastName &&
        e1?.administratorRole == e2?.administratorRole &&
        e1?.userRole == e2?.userRole &&
        e1?.age == e2?.age &&
        e1?.birthday == e2?.birthday &&
        e1?.gender == e2?.gender &&
        e1?.firstName == e2?.firstName &&
        e1?.updatedTime == e2?.updatedTime &&
        listEquality.equals(e1?.promotionEvents, e2?.promotionEvents) &&
        e1?.managerRole == e2?.managerRole;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.lastName,
        e?.administratorRole,
        e?.userRole,
        e?.age,
        e?.birthday,
        e?.gender,
        e?.firstName,
        e?.updatedTime,
        e?.promotionEvents,
        e?.managerRole
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
