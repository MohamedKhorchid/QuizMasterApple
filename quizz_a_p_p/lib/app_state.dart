import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _lastTimeNoteQuiz = prefs.containsKey('ff_lastTimeNoteQuiz')
          ? DateTime.fromMillisecondsSinceEpoch(
              prefs.getInt('ff_lastTimeNoteQuiz')!)
          : _lastTimeNoteQuiz;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  int _currentpage = 1;
  int get currentpage => _currentpage;
  set currentpage(int value) {
    _currentpage = value;
  }

  List<String> _selectedanswer = [];
  List<String> get selectedanswer => _selectedanswer;
  set selectedanswer(List<String> value) {
    _selectedanswer = value;
  }

  void addToSelectedanswer(String value) {
    selectedanswer.add(value);
  }

  void removeFromSelectedanswer(String value) {
    selectedanswer.remove(value);
  }

  void removeAtIndexFromSelectedanswer(int index) {
    selectedanswer.removeAt(index);
  }

  void updateSelectedanswerAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    selectedanswer[index] = updateFn(_selectedanswer[index]);
  }

  void insertAtIndexInSelectedanswer(int index, String value) {
    selectedanswer.insert(index, value);
  }

  int _userscore = 0;
  int get userscore => _userscore;
  set userscore(int value) {
    _userscore = value;
  }

  String _iscorrect = '';
  String get iscorrect => _iscorrect;
  set iscorrect(String value) {
    _iscorrect = value;
  }

  int _selectedindex = -1;
  int get selectedindex => _selectedindex;
  set selectedindex(int value) {
    _selectedindex = value;
  }

  int _randomnumber = 0;
  int get randomnumber => _randomnumber;
  set randomnumber(int value) {
    _randomnumber = value;
  }

  bool _isanswered = false;
  bool get isanswered => _isanswered;
  set isanswered(bool value) {
    _isanswered = value;
  }

  String _correctanswer = '';
  String get correctanswer => _correctanswer;
  set correctanswer(String value) {
    _correctanswer = value;
  }

  DateTime? _lastTimeNoteQuiz;
  DateTime? get lastTimeNoteQuiz => _lastTimeNoteQuiz;
  set lastTimeNoteQuiz(DateTime? value) {
    _lastTimeNoteQuiz = value;
    value != null
        ? prefs.setInt('ff_lastTimeNoteQuiz', value.millisecondsSinceEpoch)
        : prefs.remove('ff_lastTimeNoteQuiz');
  }
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
