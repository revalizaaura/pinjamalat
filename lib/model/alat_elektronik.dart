class AlatElektronik {
  String _nama;
  String _kategori;
  int _harga;
  String _gambar;

  AlatElektronik({
    required String nama,
    required String kategori,
    required int harga,
    required String gambar,
  })  : _nama = nama,
        _kategori = kategori,
        _harga = harga,
        _gambar = gambar;

  // Getter
  String get nama => _nama;
  String get kategori => _kategori;
  int get harga => _harga;
  String get gambar => _gambar;

  // Setter
  set nama(String value) {
    _nama = value;
  }

  set kategori(String value) {
    _kategori = value;
  }

  set harga(int value) {
    if (value >= 0) {
      _harga = value;
    }
  }

  set gambar(String value) {
    _gambar = value;
  }

  // Function menghitung total harga
  int hitungTotalHarga(int jumlahHari) {
    return _harga * jumlahHari;
  }

  // Function format harga
  String formatHarga() {
    return _harga
        .toString()
        .replaceAllMapped(
          RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
          (match) => '${match[1]}.',
        );
  }

  // Function informasi alat
  String get informasiAlat {
    return '$_nama - $_kategori - Rp${formatHarga()} / hari';
  }
}
