import 'dart:math';

class RandomCycle<T> {
  final List<T> _originalList;
  final Random _random = Random();
  List<T> _shuffledList = [];
  int _currentIndex = 0;

  RandomCycle(this._originalList) {
    _reshuffle();
  }

  void _reshuffle() {
    _shuffledList = List<T>.from(_originalList)..shuffle(_random);
    _currentIndex = 0;
  }

  T next() {
    if (_currentIndex >= _shuffledList.length) {
      _reshuffle();
    }
    return _shuffledList[_currentIndex++];
  }
}