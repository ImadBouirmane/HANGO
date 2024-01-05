import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    secureStorage = const FlutterSecureStorage();
    await _safeInitAsync(() async {
      _MusicStyle =
          await secureStorage.getStringList('ff_MusicStyle') ?? _MusicStyle;
    });
    await _safeInitAsync(() async {
      _TypeOfEstablishment =
          await secureStorage.getStringList('ff_TypeOfEstablishment') ??
              _TypeOfEstablishment;
    });
    await _safeInitAsync(() async {
      _TypeOfEvent =
          await secureStorage.getStringList('ff_TypeOfEvent') ?? _TypeOfEvent;
    });
    await _safeInitAsync(() async {
      _Food = await secureStorage.getStringList('ff_Food') ?? _Food;
    });
    await _safeInitAsync(() async {
      _Game = await secureStorage.getStringList('ff_Game') ?? _Game;
    });
    await _safeInitAsync(() async {
      _Artistes = await secureStorage.getStringList('ff_Artistes') ?? _Artistes;
    });
    await _safeInitAsync(() async {
      _visibleStateScheduleMonday =
          await secureStorage.getBool('ff_visibleStateScheduleMonday') ??
              _visibleStateScheduleMonday;
    });
    await _safeInitAsync(() async {
      _visibleStateScheduleTuesday =
          await secureStorage.getBool('ff_visibleStateScheduleTuesday') ??
              _visibleStateScheduleTuesday;
    });
    await _safeInitAsync(() async {
      _visibleStateScheduleWednesday =
          await secureStorage.getBool('ff_visibleStateScheduleWednesday') ??
              _visibleStateScheduleWednesday;
    });
    await _safeInitAsync(() async {
      _visibleStateScheduleThursday =
          await secureStorage.getBool('ff_visibleStateScheduleThursday') ??
              _visibleStateScheduleThursday;
    });
    await _safeInitAsync(() async {
      _visibleStateScheduleFriday =
          await secureStorage.getBool('ff_visibleStateScheduleFriday') ??
              _visibleStateScheduleFriday;
    });
    await _safeInitAsync(() async {
      _visibleStateScheduleSaturday =
          await secureStorage.getBool('ff_visibleStateScheduleSaturday') ??
              _visibleStateScheduleSaturday;
    });
    await _safeInitAsync(() async {
      _visibleStateScheduleSunday =
          await secureStorage.getBool('ff_visibleStateScheduleSunday') ??
              _visibleStateScheduleSunday;
    });
    await _safeInitAsync(() async {
      _uploadedNewEstImages =
          (await secureStorage.getStringList('ff_uploadedNewEstImages')) ??
              _uploadedNewEstImages;
    });
    await _safeInitAsync(() async {
      _isOpen = await secureStorage.getBool('ff_isOpen') ?? _isOpen;
    });
    await _safeInitAsync(() async {
      _artistScheduleStart =
          await secureStorage.read(key: 'ff_artistScheduleStart') != null
              ? DateTime.fromMillisecondsSinceEpoch(
                  (await secureStorage.getInt('ff_artistScheduleStart'))!)
              : _artistScheduleStart;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  List<String> _MusicStyle = [
    'Hip Hop',
    'Urban',
    'Commercial',
    'Latino',
    'Reggaeton',
    'Reggae',
    'Rnb',
    'Afro',
    'Année 90',
    'Année 80',
    'Année 70',
    'Jazz',
    'Blues',
    'Chill',
    'Metal',
    'Rock',
    'Electro',
    'Techno',
    'DJ',
    'Musique live',
    'Pas de musique',
    'Varié'
  ];
  List<String> get MusicStyle => _MusicStyle;
  set MusicStyle(List<String> value) {
    _MusicStyle = value;
    secureStorage.setStringList('ff_MusicStyle', value);
  }

  void deleteMusicStyle() {
    secureStorage.delete(key: 'ff_MusicStyle');
  }

  void addToMusicStyle(String value) {
    _MusicStyle.add(value);
    secureStorage.setStringList('ff_MusicStyle', _MusicStyle);
  }

  void removeFromMusicStyle(String value) {
    _MusicStyle.remove(value);
    secureStorage.setStringList('ff_MusicStyle', _MusicStyle);
  }

  void removeAtIndexFromMusicStyle(int index) {
    _MusicStyle.removeAt(index);
    secureStorage.setStringList('ff_MusicStyle', _MusicStyle);
  }

  void updateMusicStyleAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _MusicStyle[index] = updateFn(_MusicStyle[index]);
    secureStorage.setStringList('ff_MusicStyle', _MusicStyle);
  }

  void insertAtIndexInMusicStyle(int index, String value) {
    _MusicStyle.insert(index, value);
    secureStorage.setStringList('ff_MusicStyle', _MusicStyle);
  }

  List<String> _TypeOfEstablishment = [
    'Bar',
    'Pub',
    'Discothèque',
    'Lounge',
    'Bar restaurant',
    'Buvette',
    'Salle de concert',
    'Rooftop',
    'Terrasse'
  ];
  List<String> get TypeOfEstablishment => _TypeOfEstablishment;
  set TypeOfEstablishment(List<String> value) {
    _TypeOfEstablishment = value;
    secureStorage.setStringList('ff_TypeOfEstablishment', value);
  }

  void deleteTypeOfEstablishment() {
    secureStorage.delete(key: 'ff_TypeOfEstablishment');
  }

  void addToTypeOfEstablishment(String value) {
    _TypeOfEstablishment.add(value);
    secureStorage.setStringList('ff_TypeOfEstablishment', _TypeOfEstablishment);
  }

  void removeFromTypeOfEstablishment(String value) {
    _TypeOfEstablishment.remove(value);
    secureStorage.setStringList('ff_TypeOfEstablishment', _TypeOfEstablishment);
  }

  void removeAtIndexFromTypeOfEstablishment(int index) {
    _TypeOfEstablishment.removeAt(index);
    secureStorage.setStringList('ff_TypeOfEstablishment', _TypeOfEstablishment);
  }

  void updateTypeOfEstablishmentAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _TypeOfEstablishment[index] = updateFn(_TypeOfEstablishment[index]);
    secureStorage.setStringList('ff_TypeOfEstablishment', _TypeOfEstablishment);
  }

  void insertAtIndexInTypeOfEstablishment(int index, String value) {
    _TypeOfEstablishment.insert(index, value);
    secureStorage.setStringList('ff_TypeOfEstablishment', _TypeOfEstablishment);
  }

  List<String> _TypeOfEvent = [
    'Sport',
    'Football',
    'Hockey',
    'Basket',
    'Rugby',
    'Music Live',
    'Concert',
    'DJ',
    'Blind test',
    'Karaoké',
    'Soirée à thème',
    'Show case'
  ];
  List<String> get TypeOfEvent => _TypeOfEvent;
  set TypeOfEvent(List<String> value) {
    _TypeOfEvent = value;
    secureStorage.setStringList('ff_TypeOfEvent', value);
  }

  void deleteTypeOfEvent() {
    secureStorage.delete(key: 'ff_TypeOfEvent');
  }

  void addToTypeOfEvent(String value) {
    _TypeOfEvent.add(value);
    secureStorage.setStringList('ff_TypeOfEvent', _TypeOfEvent);
  }

  void removeFromTypeOfEvent(String value) {
    _TypeOfEvent.remove(value);
    secureStorage.setStringList('ff_TypeOfEvent', _TypeOfEvent);
  }

  void removeAtIndexFromTypeOfEvent(int index) {
    _TypeOfEvent.removeAt(index);
    secureStorage.setStringList('ff_TypeOfEvent', _TypeOfEvent);
  }

  void updateTypeOfEventAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _TypeOfEvent[index] = updateFn(_TypeOfEvent[index]);
    secureStorage.setStringList('ff_TypeOfEvent', _TypeOfEvent);
  }

  void insertAtIndexInTypeOfEvent(int index, String value) {
    _TypeOfEvent.insert(index, value);
    secureStorage.setStringList('ff_TypeOfEvent', _TypeOfEvent);
  }

  List<String> _Food = [
    'Snack',
    'Burger',
    'Sandwich',
    'Tapas',
    'Pizza',
    'Divers',
    'Planchette',
    'Restauration',
    'Aucune'
  ];
  List<String> get Food => _Food;
  set Food(List<String> value) {
    _Food = value;
    secureStorage.setStringList('ff_Food', value);
  }

  void deleteFood() {
    secureStorage.delete(key: 'ff_Food');
  }

  void addToFood(String value) {
    _Food.add(value);
    secureStorage.setStringList('ff_Food', _Food);
  }

  void removeFromFood(String value) {
    _Food.remove(value);
    secureStorage.setStringList('ff_Food', _Food);
  }

  void removeAtIndexFromFood(int index) {
    _Food.removeAt(index);
    secureStorage.setStringList('ff_Food', _Food);
  }

  void updateFoodAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _Food[index] = updateFn(_Food[index]);
    secureStorage.setStringList('ff_Food', _Food);
  }

  void insertAtIndexInFood(int index, String value) {
    _Food.insert(index, value);
    secureStorage.setStringList('ff_Food', _Food);
  }

  List<String> _Game = [
    'Fléchettes',
    'Billard',
    'Baby-foot',
    'Jeux de société',
    'Cartes',
    'Flipper',
    'Borne arcade',
    'Aucun'
  ];
  List<String> get Game => _Game;
  set Game(List<String> value) {
    _Game = value;
    secureStorage.setStringList('ff_Game', value);
  }

  void deleteGame() {
    secureStorage.delete(key: 'ff_Game');
  }

  void addToGame(String value) {
    _Game.add(value);
    secureStorage.setStringList('ff_Game', _Game);
  }

  void removeFromGame(String value) {
    _Game.remove(value);
    secureStorage.setStringList('ff_Game', _Game);
  }

  void removeAtIndexFromGame(int index) {
    _Game.removeAt(index);
    secureStorage.setStringList('ff_Game', _Game);
  }

  void updateGameAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _Game[index] = updateFn(_Game[index]);
    secureStorage.setStringList('ff_Game', _Game);
  }

  void insertAtIndexInGame(int index, String value) {
    _Game.insert(index, value);
    secureStorage.setStringList('ff_Game', _Game);
  }

  DateTime? _selectedDate = DateTime.fromMillisecondsSinceEpoch(1684949400000);
  DateTime? get selectedDate => _selectedDate;
  set selectedDate(DateTime? value) {
    _selectedDate = value;
  }

  List<DocumentReference> _filterEvenResults = [];
  List<DocumentReference> get filterEvenResults => _filterEvenResults;
  set filterEvenResults(List<DocumentReference> value) {
    _filterEvenResults = value;
  }

  void addToFilterEvenResults(DocumentReference value) {
    _filterEvenResults.add(value);
  }

  void removeFromFilterEvenResults(DocumentReference value) {
    _filterEvenResults.remove(value);
  }

  void removeAtIndexFromFilterEvenResults(int index) {
    _filterEvenResults.removeAt(index);
  }

  void updateFilterEvenResultsAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    _filterEvenResults[index] = updateFn(_filterEvenResults[index]);
  }

  void insertAtIndexInFilterEvenResults(int index, DocumentReference value) {
    _filterEvenResults.insert(index, value);
  }

  bool _searchChange = false;
  bool get searchChange => _searchChange;
  set searchChange(bool value) {
    _searchChange = value;
  }

  List<String> _Artistes = [];
  List<String> get Artistes => _Artistes;
  set Artistes(List<String> value) {
    _Artistes = value;
    secureStorage.setStringList('ff_Artistes', value);
  }

  void deleteArtistes() {
    secureStorage.delete(key: 'ff_Artistes');
  }

  void addToArtistes(String value) {
    _Artistes.add(value);
    secureStorage.setStringList('ff_Artistes', _Artistes);
  }

  void removeFromArtistes(String value) {
    _Artistes.remove(value);
    secureStorage.setStringList('ff_Artistes', _Artistes);
  }

  void removeAtIndexFromArtistes(int index) {
    _Artistes.removeAt(index);
    secureStorage.setStringList('ff_Artistes', _Artistes);
  }

  void updateArtistesAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _Artistes[index] = updateFn(_Artistes[index]);
    secureStorage.setStringList('ff_Artistes', _Artistes);
  }

  void insertAtIndexInArtistes(int index, String value) {
    _Artistes.insert(index, value);
    secureStorage.setStringList('ff_Artistes', _Artistes);
  }

  String _clickState = '';
  String get clickState => _clickState;
  set clickState(String value) {
    _clickState = value;
  }

  bool _isClose = true;
  bool get isClose => _isClose;
  set isClose(bool value) {
    _isClose = value;
  }

  bool _visibleStateScheduleMonday = true;
  bool get visibleStateScheduleMonday => _visibleStateScheduleMonday;
  set visibleStateScheduleMonday(bool value) {
    _visibleStateScheduleMonday = value;
    secureStorage.setBool('ff_visibleStateScheduleMonday', value);
  }

  void deleteVisibleStateScheduleMonday() {
    secureStorage.delete(key: 'ff_visibleStateScheduleMonday');
  }

  bool _visibleStateScheduleTuesday = true;
  bool get visibleStateScheduleTuesday => _visibleStateScheduleTuesday;
  set visibleStateScheduleTuesday(bool value) {
    _visibleStateScheduleTuesday = value;
    secureStorage.setBool('ff_visibleStateScheduleTuesday', value);
  }

  void deleteVisibleStateScheduleTuesday() {
    secureStorage.delete(key: 'ff_visibleStateScheduleTuesday');
  }

  bool _visibleStateScheduleWednesday = true;
  bool get visibleStateScheduleWednesday => _visibleStateScheduleWednesday;
  set visibleStateScheduleWednesday(bool value) {
    _visibleStateScheduleWednesday = value;
    secureStorage.setBool('ff_visibleStateScheduleWednesday', value);
  }

  void deleteVisibleStateScheduleWednesday() {
    secureStorage.delete(key: 'ff_visibleStateScheduleWednesday');
  }

  bool _visibleStateScheduleThursday = true;
  bool get visibleStateScheduleThursday => _visibleStateScheduleThursday;
  set visibleStateScheduleThursday(bool value) {
    _visibleStateScheduleThursday = value;
    secureStorage.setBool('ff_visibleStateScheduleThursday', value);
  }

  void deleteVisibleStateScheduleThursday() {
    secureStorage.delete(key: 'ff_visibleStateScheduleThursday');
  }

  bool _visibleStateScheduleFriday = true;
  bool get visibleStateScheduleFriday => _visibleStateScheduleFriday;
  set visibleStateScheduleFriday(bool value) {
    _visibleStateScheduleFriday = value;
    secureStorage.setBool('ff_visibleStateScheduleFriday', value);
  }

  void deleteVisibleStateScheduleFriday() {
    secureStorage.delete(key: 'ff_visibleStateScheduleFriday');
  }

  bool _visibleStateScheduleSaturday = true;
  bool get visibleStateScheduleSaturday => _visibleStateScheduleSaturday;
  set visibleStateScheduleSaturday(bool value) {
    _visibleStateScheduleSaturday = value;
    secureStorage.setBool('ff_visibleStateScheduleSaturday', value);
  }

  void deleteVisibleStateScheduleSaturday() {
    secureStorage.delete(key: 'ff_visibleStateScheduleSaturday');
  }

  bool _visibleStateScheduleSunday = true;
  bool get visibleStateScheduleSunday => _visibleStateScheduleSunday;
  set visibleStateScheduleSunday(bool value) {
    _visibleStateScheduleSunday = value;
    secureStorage.setBool('ff_visibleStateScheduleSunday', value);
  }

  void deleteVisibleStateScheduleSunday() {
    secureStorage.delete(key: 'ff_visibleStateScheduleSunday');
  }

  String _themeEvent = '';
  String get themeEvent => _themeEvent;
  set themeEvent(String value) {
    _themeEvent = value;
  }

  String _musicType = '';
  String get musicType => _musicType;
  set musicType(String value) {
    _musicType = value;
  }

  bool _weekend = false;
  bool get weekend => _weekend;
  set weekend(bool value) {
    _weekend = value;
  }

  bool _jeudredi = false;
  bool get jeudredi => _jeudredi;
  set jeudredi(bool value) {
    _jeudredi = value;
  }

  bool _freeEnter = false;
  bool get freeEnter => _freeEnter;
  set freeEnter(bool value) {
    _freeEnter = value;
  }

  bool _booked = false;
  bool get booked => _booked;
  set booked(bool value) {
    _booked = value;
  }

  List<int> _clickCount = [];
  List<int> get clickCount => _clickCount;
  set clickCount(List<int> value) {
    _clickCount = value;
  }

  void addToClickCount(int value) {
    _clickCount.add(value);
  }

  void removeFromClickCount(int value) {
    _clickCount.remove(value);
  }

  void removeAtIndexFromClickCount(int index) {
    _clickCount.removeAt(index);
  }

  void updateClickCountAtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    _clickCount[index] = updateFn(_clickCount[index]);
  }

  void insertAtIndexInClickCount(int index, int value) {
    _clickCount.insert(index, value);
  }

  bool _isUploaded = false;
  bool get isUploaded => _isUploaded;
  set isUploaded(bool value) {
    _isUploaded = value;
  }

  List<String> _uploadedNewEstImages = [];
  List<String> get uploadedNewEstImages => _uploadedNewEstImages;
  set uploadedNewEstImages(List<String> value) {
    _uploadedNewEstImages = value;
    secureStorage.setStringList('ff_uploadedNewEstImages', value);
  }

  void deleteUploadedNewEstImages() {
    secureStorage.delete(key: 'ff_uploadedNewEstImages');
  }

  void addToUploadedNewEstImages(String value) {
    _uploadedNewEstImages.add(value);
    secureStorage.setStringList(
        'ff_uploadedNewEstImages', _uploadedNewEstImages);
  }

  void removeFromUploadedNewEstImages(String value) {
    _uploadedNewEstImages.remove(value);
    secureStorage.setStringList(
        'ff_uploadedNewEstImages', _uploadedNewEstImages);
  }

  void removeAtIndexFromUploadedNewEstImages(int index) {
    _uploadedNewEstImages.removeAt(index);
    secureStorage.setStringList(
        'ff_uploadedNewEstImages', _uploadedNewEstImages);
  }

  void updateUploadedNewEstImagesAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _uploadedNewEstImages[index] = updateFn(_uploadedNewEstImages[index]);
    secureStorage.setStringList(
        'ff_uploadedNewEstImages', _uploadedNewEstImages);
  }

  void insertAtIndexInUploadedNewEstImages(int index, String value) {
    _uploadedNewEstImages.insert(index, value);
    secureStorage.setStringList(
        'ff_uploadedNewEstImages', _uploadedNewEstImages);
  }

  bool _isOpen = false;
  bool get isOpen => _isOpen;
  set isOpen(bool value) {
    _isOpen = value;
    secureStorage.setBool('ff_isOpen', value);
  }

  void deleteIsOpen() {
    secureStorage.delete(key: 'ff_isOpen');
  }

  String _artistName = '';
  String get artistName => _artistName;
  set artistName(String value) {
    _artistName = value;
  }

  DateTime? _artistScheduleStart;
  DateTime? get artistScheduleStart => _artistScheduleStart;
  set artistScheduleStart(DateTime? value) {
    _artistScheduleStart = value;
    value != null
        ? secureStorage.setInt(
            'ff_artistScheduleStart', value.millisecondsSinceEpoch)
        : secureStorage.remove('ff_artistScheduleStart');
  }

  void deleteArtistScheduleStart() {
    secureStorage.delete(key: 'ff_artistScheduleStart');
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return const CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: const ListToCsvConverter().convert([value]));
}
