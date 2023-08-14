class SubjectRepository {
  static final SubjectRepository _instance = SubjectRepository._internal();

  factory SubjectRepository() {
    return _instance;
  }

  SubjectRepository._internal();

  String _currentSubject = '';

  String get currentSubject => _currentSubject;

  void updateSubject(String subject) {
    _currentSubject = subject;
  }

  void resetSubject() {
    _currentSubject = '';
  }
}