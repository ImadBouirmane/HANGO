import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

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
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  List<String> _MusicStyle = [
    'DJ',
    'Music live',
    'Commercial',
    'Latino',
    'Techno',
    'Urban',
    'Rock',
    'Hip Hop',
    'Lounge',
    'Année 90',
    'Année 80',
    'Année 70',
    'Jazz',
    'Reggae',
    'Electro',
    'Métal',
    'Punk',
    'Mix'
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

  List<String> _TypeOfEstablishment = [
    'Bar',
    'Pub',
    'Discothèque',
    'Lounge',
    'Bar restaurant',
    'Buvette',
    'Salle de concert'
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

  List<String> _TypeOfEvent = [
    'Music Live',
    'Football',
    'Hockey',
    'Sport',
    'Rugby',
    'Basket',
    'Concert',
    'DJ',
    'Blind test',
    'Karaoké'
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

  List<String> _Food = [
    'Snack',
    'Burger',
    'Finger food',
    'Sandwich',
    'Tapas',
    'Fast food'
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

  List<String> _Game = [
    'Fléchettes',
    'Billard',
    'Baby-foot',
    'Jeux de société',
    'Cartes',
    'Flipper',
    'Borne arcade'
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
