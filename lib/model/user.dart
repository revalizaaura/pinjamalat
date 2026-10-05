class User {
  String _nama;
  String _email;
  String _nomorHp;
  String _password;

  User({
    required String nama,
    required String email,
    required String nomorHp,
    required String password,
  })  : _nama = nama,
        _email = email,
        _nomorHp = nomorHp,
        _password = password;

  // Getter
  String get nama => _nama;
  String get email => _email;
  String get nomorHp => _nomorHp;
  String get password => _password;

  // Setter
  set nama(String value) {
    _nama = value;
  }

  set email(String value) {
    _email = value;
  }

  set nomorHp(String value) {
    _nomorHp = value;
  }

  set password(String value) {
    _password = value;
  }

  // Function untuk login
  bool login(String email, String password) {
    return _email == email && _password == password;
  }

  // Function mengambil nama dari email
  String getNamaDariEmail() {
    return _email.split('@').first.replaceAll('.', ' ');
  }
}
