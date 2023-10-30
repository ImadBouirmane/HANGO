import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'backend/api_requests/api_manager.dart';
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
    secureStorage = FlutterSecureStorage();
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
  set MusicStyle(List<String> _value) {
    _MusicStyle = _value;
    secureStorage.setStringList('ff_MusicStyle', _value);
  }

  void deleteMusicStyle() {
    secureStorage.delete(key: 'ff_MusicStyle');
  }

  void addToMusicStyle(String _value) {
    _MusicStyle.add(_value);
    secureStorage.setStringList('ff_MusicStyle', _MusicStyle);
  }

  void removeFromMusicStyle(String _value) {
    _MusicStyle.remove(_value);
    secureStorage.setStringList('ff_MusicStyle', _MusicStyle);
  }

  void removeAtIndexFromMusicStyle(int _index) {
    _MusicStyle.removeAt(_index);
    secureStorage.setStringList('ff_MusicStyle', _MusicStyle);
  }

  void updateMusicStyleAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _MusicStyle[_index] = updateFn(_MusicStyle[_index]);
    secureStorage.setStringList('ff_MusicStyle', _MusicStyle);
  }

  void insertAtIndexInMusicStyle(int _index, String _value) {
    _MusicStyle.insert(_index, _value);
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
  set TypeOfEstablishment(List<String> _value) {
    _TypeOfEstablishment = _value;
    secureStorage.setStringList('ff_TypeOfEstablishment', _value);
  }

  void deleteTypeOfEstablishment() {
    secureStorage.delete(key: 'ff_TypeOfEstablishment');
  }

  void addToTypeOfEstablishment(String _value) {
    _TypeOfEstablishment.add(_value);
    secureStorage.setStringList('ff_TypeOfEstablishment', _TypeOfEstablishment);
  }

  void removeFromTypeOfEstablishment(String _value) {
    _TypeOfEstablishment.remove(_value);
    secureStorage.setStringList('ff_TypeOfEstablishment', _TypeOfEstablishment);
  }

  void removeAtIndexFromTypeOfEstablishment(int _index) {
    _TypeOfEstablishment.removeAt(_index);
    secureStorage.setStringList('ff_TypeOfEstablishment', _TypeOfEstablishment);
  }

  void updateTypeOfEstablishmentAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _TypeOfEstablishment[_index] = updateFn(_TypeOfEstablishment[_index]);
    secureStorage.setStringList('ff_TypeOfEstablishment', _TypeOfEstablishment);
  }

  void insertAtIndexInTypeOfEstablishment(int _index, String _value) {
    _TypeOfEstablishment.insert(_index, _value);
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
  set TypeOfEvent(List<String> _value) {
    _TypeOfEvent = _value;
    secureStorage.setStringList('ff_TypeOfEvent', _value);
  }

  void deleteTypeOfEvent() {
    secureStorage.delete(key: 'ff_TypeOfEvent');
  }

  void addToTypeOfEvent(String _value) {
    _TypeOfEvent.add(_value);
    secureStorage.setStringList('ff_TypeOfEvent', _TypeOfEvent);
  }

  void removeFromTypeOfEvent(String _value) {
    _TypeOfEvent.remove(_value);
    secureStorage.setStringList('ff_TypeOfEvent', _TypeOfEvent);
  }

  void removeAtIndexFromTypeOfEvent(int _index) {
    _TypeOfEvent.removeAt(_index);
    secureStorage.setStringList('ff_TypeOfEvent', _TypeOfEvent);
  }

  void updateTypeOfEventAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _TypeOfEvent[_index] = updateFn(_TypeOfEvent[_index]);
    secureStorage.setStringList('ff_TypeOfEvent', _TypeOfEvent);
  }

  void insertAtIndexInTypeOfEvent(int _index, String _value) {
    _TypeOfEvent.insert(_index, _value);
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
  set Food(List<String> _value) {
    _Food = _value;
    secureStorage.setStringList('ff_Food', _value);
  }

  void deleteFood() {
    secureStorage.delete(key: 'ff_Food');
  }

  void addToFood(String _value) {
    _Food.add(_value);
    secureStorage.setStringList('ff_Food', _Food);
  }

  void removeFromFood(String _value) {
    _Food.remove(_value);
    secureStorage.setStringList('ff_Food', _Food);
  }

  void removeAtIndexFromFood(int _index) {
    _Food.removeAt(_index);
    secureStorage.setStringList('ff_Food', _Food);
  }

  void updateFoodAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _Food[_index] = updateFn(_Food[_index]);
    secureStorage.setStringList('ff_Food', _Food);
  }

  void insertAtIndexInFood(int _index, String _value) {
    _Food.insert(_index, _value);
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
  set Game(List<String> _value) {
    _Game = _value;
    secureStorage.setStringList('ff_Game', _value);
  }

  void deleteGame() {
    secureStorage.delete(key: 'ff_Game');
  }

  void addToGame(String _value) {
    _Game.add(_value);
    secureStorage.setStringList('ff_Game', _Game);
  }

  void removeFromGame(String _value) {
    _Game.remove(_value);
    secureStorage.setStringList('ff_Game', _Game);
  }

  void removeAtIndexFromGame(int _index) {
    _Game.removeAt(_index);
    secureStorage.setStringList('ff_Game', _Game);
  }

  void updateGameAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _Game[_index] = updateFn(_Game[_index]);
    secureStorage.setStringList('ff_Game', _Game);
  }

  void insertAtIndexInGame(int _index, String _value) {
    _Game.insert(_index, _value);
    secureStorage.setStringList('ff_Game', _Game);
  }

  DateTime? _selectedDate = DateTime.fromMillisecondsSinceEpoch(1684949400000);
  DateTime? get selectedDate => _selectedDate;
  set selectedDate(DateTime? _value) {
    _selectedDate = _value;
  }

  List<DocumentReference> _filterEvenResults = [];
  List<DocumentReference> get filterEvenResults => _filterEvenResults;
  set filterEvenResults(List<DocumentReference> _value) {
    _filterEvenResults = _value;
  }

  void addToFilterEvenResults(DocumentReference _value) {
    _filterEvenResults.add(_value);
  }

  void removeFromFilterEvenResults(DocumentReference _value) {
    _filterEvenResults.remove(_value);
  }

  void removeAtIndexFromFilterEvenResults(int _index) {
    _filterEvenResults.removeAt(_index);
  }

  void updateFilterEvenResultsAtIndex(
    int _index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    _filterEvenResults[_index] = updateFn(_filterEvenResults[_index]);
  }

  void insertAtIndexInFilterEvenResults(int _index, DocumentReference _value) {
    _filterEvenResults.insert(_index, _value);
  }

  bool _searchChange = false;
  bool get searchChange => _searchChange;
  set searchChange(bool _value) {
    _searchChange = _value;
  }

  List<String> _Artistes = [];
  List<String> get Artistes => _Artistes;
  set Artistes(List<String> _value) {
    _Artistes = _value;
    secureStorage.setStringList('ff_Artistes', _value);
  }

  void deleteArtistes() {
    secureStorage.delete(key: 'ff_Artistes');
  }

  void addToArtistes(String _value) {
    _Artistes.add(_value);
    secureStorage.setStringList('ff_Artistes', _Artistes);
  }

  void removeFromArtistes(String _value) {
    _Artistes.remove(_value);
    secureStorage.setStringList('ff_Artistes', _Artistes);
  }

  void removeAtIndexFromArtistes(int _index) {
    _Artistes.removeAt(_index);
    secureStorage.setStringList('ff_Artistes', _Artistes);
  }

  void updateArtistesAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _Artistes[_index] = updateFn(_Artistes[_index]);
    secureStorage.setStringList('ff_Artistes', _Artistes);
  }

  void insertAtIndexInArtistes(int _index, String _value) {
    _Artistes.insert(_index, _value);
    secureStorage.setStringList('ff_Artistes', _Artistes);
  }

  String _clickState = '';
  String get clickState => _clickState;
  set clickState(String _value) {
    _clickState = _value;
  }

  bool _isClose = true;
  bool get isClose => _isClose;
  set isClose(bool _value) {
    _isClose = _value;
  }

  bool _visibleStateScheduleMonday = true;
  bool get visibleStateScheduleMonday => _visibleStateScheduleMonday;
  set visibleStateScheduleMonday(bool _value) {
    _visibleStateScheduleMonday = _value;
    secureStorage.setBool('ff_visibleStateScheduleMonday', _value);
  }

  void deleteVisibleStateScheduleMonday() {
    secureStorage.delete(key: 'ff_visibleStateScheduleMonday');
  }

  bool _visibleStateScheduleTuesday = true;
  bool get visibleStateScheduleTuesday => _visibleStateScheduleTuesday;
  set visibleStateScheduleTuesday(bool _value) {
    _visibleStateScheduleTuesday = _value;
    secureStorage.setBool('ff_visibleStateScheduleTuesday', _value);
  }

  void deleteVisibleStateScheduleTuesday() {
    secureStorage.delete(key: 'ff_visibleStateScheduleTuesday');
  }

  bool _visibleStateScheduleWednesday = true;
  bool get visibleStateScheduleWednesday => _visibleStateScheduleWednesday;
  set visibleStateScheduleWednesday(bool _value) {
    _visibleStateScheduleWednesday = _value;
    secureStorage.setBool('ff_visibleStateScheduleWednesday', _value);
  }

  void deleteVisibleStateScheduleWednesday() {
    secureStorage.delete(key: 'ff_visibleStateScheduleWednesday');
  }

  bool _visibleStateScheduleThursday = true;
  bool get visibleStateScheduleThursday => _visibleStateScheduleThursday;
  set visibleStateScheduleThursday(bool _value) {
    _visibleStateScheduleThursday = _value;
    secureStorage.setBool('ff_visibleStateScheduleThursday', _value);
  }

  void deleteVisibleStateScheduleThursday() {
    secureStorage.delete(key: 'ff_visibleStateScheduleThursday');
  }

  bool _visibleStateScheduleFriday = true;
  bool get visibleStateScheduleFriday => _visibleStateScheduleFriday;
  set visibleStateScheduleFriday(bool _value) {
    _visibleStateScheduleFriday = _value;
    secureStorage.setBool('ff_visibleStateScheduleFriday', _value);
  }

  void deleteVisibleStateScheduleFriday() {
    secureStorage.delete(key: 'ff_visibleStateScheduleFriday');
  }

  bool _visibleStateScheduleSaturday = true;
  bool get visibleStateScheduleSaturday => _visibleStateScheduleSaturday;
  set visibleStateScheduleSaturday(bool _value) {
    _visibleStateScheduleSaturday = _value;
    secureStorage.setBool('ff_visibleStateScheduleSaturday', _value);
  }

  void deleteVisibleStateScheduleSaturday() {
    secureStorage.delete(key: 'ff_visibleStateScheduleSaturday');
  }

  bool _visibleStateScheduleSunday = true;
  bool get visibleStateScheduleSunday => _visibleStateScheduleSunday;
  set visibleStateScheduleSunday(bool _value) {
    _visibleStateScheduleSunday = _value;
    secureStorage.setBool('ff_visibleStateScheduleSunday', _value);
  }

  void deleteVisibleStateScheduleSunday() {
    secureStorage.delete(key: 'ff_visibleStateScheduleSunday');
  }

  String _themeEvent = '';
  String get themeEvent => _themeEvent;
  set themeEvent(String _value) {
    _themeEvent = _value;
  }

  String _musicType = '';
  String get musicType => _musicType;
  set musicType(String _value) {
    _musicType = _value;
  }

  bool _weekend = false;
  bool get weekend => _weekend;
  set weekend(bool _value) {
    _weekend = _value;
  }

  bool _jeudredi = false;
  bool get jeudredi => _jeudredi;
  set jeudredi(bool _value) {
    _jeudredi = _value;
  }

  bool _freeEnter = false;
  bool get freeEnter => _freeEnter;
  set freeEnter(bool _value) {
    _freeEnter = _value;
  }

  bool _booked = false;
  bool get booked => _booked;
  set booked(bool _value) {
    _booked = _value;
  }

  List<int> _clickCount = [];
  List<int> get clickCount => _clickCount;
  set clickCount(List<int> _value) {
    _clickCount = _value;
  }

  void addToClickCount(int _value) {
    _clickCount.add(_value);
  }

  void removeFromClickCount(int _value) {
    _clickCount.remove(_value);
  }

  void removeAtIndexFromClickCount(int _index) {
    _clickCount.removeAt(_index);
  }

  void updateClickCountAtIndex(
    int _index,
    int Function(int) updateFn,
  ) {
    _clickCount[_index] = updateFn(_clickCount[_index]);
  }

  void insertAtIndexInClickCount(int _index, int _value) {
    _clickCount.insert(_index, _value);
  }

  bool _isUploaded = false;
  bool get isUploaded => _isUploaded;
  set isUploaded(bool _value) {
    _isUploaded = _value;
  }

  List<String> _uploadedNewEstImages = [];
  List<String> get uploadedNewEstImages => _uploadedNewEstImages;
  set uploadedNewEstImages(List<String> _value) {
    _uploadedNewEstImages = _value;
    secureStorage.setStringList('ff_uploadedNewEstImages', _value);
  }

  void deleteUploadedNewEstImages() {
    secureStorage.delete(key: 'ff_uploadedNewEstImages');
  }

  void addToUploadedNewEstImages(String _value) {
    _uploadedNewEstImages.add(_value);
    secureStorage.setStringList(
        'ff_uploadedNewEstImages', _uploadedNewEstImages);
  }

  void removeFromUploadedNewEstImages(String _value) {
    _uploadedNewEstImages.remove(_value);
    secureStorage.setStringList(
        'ff_uploadedNewEstImages', _uploadedNewEstImages);
  }

  void removeAtIndexFromUploadedNewEstImages(int _index) {
    _uploadedNewEstImages.removeAt(_index);
    secureStorage.setStringList(
        'ff_uploadedNewEstImages', _uploadedNewEstImages);
  }

  void updateUploadedNewEstImagesAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _uploadedNewEstImages[_index] = updateFn(_uploadedNewEstImages[_index]);
    secureStorage.setStringList(
        'ff_uploadedNewEstImages', _uploadedNewEstImages);
  }

  void insertAtIndexInUploadedNewEstImages(int _index, String _value) {
    _uploadedNewEstImages.insert(_index, _value);
    secureStorage.setStringList(
        'ff_uploadedNewEstImages', _uploadedNewEstImages);
  }

  bool _isOpen = false;
  bool get isOpen => _isOpen;
  set isOpen(bool _value) {
    _isOpen = _value;
    secureStorage.setBool('ff_isOpen', _value);
  }

  void deleteIsOpen() {
    secureStorage.delete(key: 'ff_isOpen');
  }

  String _artistName = '';
  String get artistName => _artistName;
  set artistName(String _value) {
    _artistName = _value;
  }

  DateTime? _artistScheduleStart;
  DateTime? get artistScheduleStart => _artistScheduleStart;
  set artistScheduleStart(DateTime? _value) {
    _artistScheduleStart = _value;
    _value != null
        ? secureStorage.setInt(
            'ff_artistScheduleStart', _value.millisecondsSinceEpoch)
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
        return CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: ListToCsvConverter().convert([value]));
}
