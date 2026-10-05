import 'alat_elektronik.dart';
import 'user.dart';

class Peminjaman {
  User _user;
  AlatElektronik _alat;
  int _jumlahHari;
  String _nomorWhatsApp;

  Peminjaman({
    required User user,
    required AlatElektronik alat,
    required int jumlahHari,
    required String nomorWhatsApp,
  })  : _user = user,
        _alat = alat,
        _jumlahHari = jumlahHari,
        _nomorWhatsApp = nomorWhatsApp;

  // Getter
  User get user => _user;
  AlatElektronik get alat => _alat;
  int get jumlahHari => _jumlahHari;
  String get nomorWhatsApp => _nomorWhatsApp;

  // Getter total harga
  int get totalHarga => _alat.hitungTotalHarga(_jumlahHari);

  // Setter
  set user(User value) {
    _user = value;
  }

  set alat(AlatElektronik value) {
    _alat = value;
  }

  set jumlahHari(int value) {
    if (value >= 1 && value <= 30) {
      _jumlahHari = value;
    }
  }

  set nomorWhatsApp(String value) {
    _nomorWhatsApp = value;
  }

  // Function menambah hari
  void tambahHari() {
    if (_jumlahHari < 30) {
      _jumlahHari++;
    }
  }

  // Function mengurangi hari
  void kurangHari() {
    if (_jumlahHari > 1) {
      _jumlahHari--;
    }
  }

  // Function mengecek kelengkapan data
  bool dataLengkap() {
    return _user.nama.isNotEmpty &&
        _user.email.isNotEmpty &&
        _nomorWhatsApp.isNotEmpty;
  }

  // Function membuat ringkasan peminjaman
  String ringkasanPeminjaman() {
    return 'Peminjaman ${_alat.nama} oleh ${_user.nama} '
        'selama $_jumlahHari hari '
        'dengan total Rp$totalHarga';
  }
}
