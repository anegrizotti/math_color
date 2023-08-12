class LevelsRepository {
  static final LevelsRepository _instance = LevelsRepository._internal();

  factory LevelsRepository() {
    return _instance;
  }

  LevelsRepository._internal();

  int _currentLevel = 1;

  int get currentLevel => _currentLevel;

  void completeLevel() {
    if (_currentLevel < 6) {
      _currentLevel++;
    }
  }

  void resetCurrentLevel() {
    _currentLevel = 1;
  }
}