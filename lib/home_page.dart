import 'package:flutter/material.dart';
import 'detail_alat_page.dart';
import 'login_page.dart';
import 'about_me.dart';
import 'model/alat_elektronik.dart';
import 'model/peminjaman.dart';

class HomePage extends StatefulWidget {
final String namaUser;

const HomePage({
super.key,
required this.namaUser,
});

@override
State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
int selectedMenu = 0;

// RIWAYAT PEMINJAMAN
final List<Peminjaman> riwayatPeminjaman = [];

// DATA ALAT ELEKTRONIK
final List<AlatElektronik> alat = [
AlatElektronik(
nama: 'Laptop',
kategori: 'Komputer',
harga: 50000,
gambar: 'assets/fotolaptop.jpeg',
),
AlatElektronik(
nama: 'Kamera',
kategori: 'Fotografi',
harga: 75000,
gambar: 'assets/fotokamera.jpeg',
),
AlatElektronik(
nama: 'Earphone',
kategori: 'Audio',
harga: 20000,
gambar: 'assets/fotoearphone.jpeg',
),
AlatElektronik(
nama: 'Speaker',
kategori: 'Audio',
harga: 30000,
gambar: 'assets/fotospeaker.jpeg',
),
AlatElektronik(
nama: 'Proyektor',
kategori: 'Presentasi',
harga: 40000,
gambar: 'assets/fotoproyektor.jpeg',
),
];

// MEMBUKA DETAIL ALAT
Future<void> bukaDetail(AlatElektronik item) async {
final hasil = await Navigator.push(
context,
MaterialPageRoute(
builder: (context) => DetailAlatPage(
nama: item.nama,
kategori: item.kategori,
harga: item.harga,
gambar: item.gambar,
),
),
);

// Jika reservasi berhasil, data masuk ke riwayat
if (hasil != null && hasil is Peminjaman) {
  setState(() {
    riwayatPeminjaman.add(hasil);
    selectedMenu = 1;
  });
}
}

@override
Widget build(BuildContext context) {
return Scaffold(
backgroundColor: const Color(0xFFF5F7FB),
body: Row(
children: [
// ================= SIDEBAR =================
Container(
width: 230,
color: const Color(0xFF3045ED),
child: Column(
children: [
const SizedBox(height: 45),

            const Text(
              'PinjamAlat',
              style: TextStyle(
                color: Colors.white,
                fontSize: 27,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 50),

            _menuItem(
              icon: Icons.home_outlined,
              title: 'Home',
              index: 0,
            ),

            _menuItem(
              icon: Icons.inventory_2_outlined,
              title: 'Peminjaman',
              index: 1,
            ),

            _menuItem(
              icon: Icons.person_outline,
              title: 'Profil',
              index: 2,
            ),

            ListTile(
              leading: const Icon(
                Icons.info_outline,
                color: Colors.white,
              ),
              title: const Text(
                'About Me',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AboutMePage(),
                  ),
                );
              },
            ),

            const Spacer(),

            ListTile(
              leading: const Icon(
                Icons.logout,
                color: Colors.white,
              ),
              title: const Text(
                'Logout',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginPage(),
                  ),
                );
              },
            ),

            const SizedBox(height: 25),
          ],
        ),
      ),

      // ================= CONTENT =================
      Expanded(
        child: _buildContent(),
      ),
    ],
  ),
);
}

// ================= MENU =================

Widget _menuItem({
required IconData icon,
required String title,
required int index,
}) {
final aktif = selectedMenu == index;

return Container(
  margin: const EdgeInsets.symmetric(
    horizontal: 12,
    vertical: 5,
  ),
  decoration: BoxDecoration(
    color: aktif
        ? Colors.white.withOpacity(0.18)
        : Colors.transparent,
    borderRadius: BorderRadius.circular(12),
  ),
  child: ListTile(
    leading: Icon(
      icon,
      color: Colors.white,
    ),
    title: Text(
      title,
      style: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w500,
      ),
    ),
    onTap: () {
      setState(() {
        selectedMenu = index;
      });
    },
  ),
);
}

// ================= CONTENT =================

Widget _buildContent() {
if (selectedMenu == 1) {
return _buildPeminjaman();
}

if (selectedMenu == 2) {
  return _buildProfil();
}

return _buildHome();
}

// ================= HOME =================

Widget _buildHome() {
return SingleChildScrollView(
padding: const EdgeInsets.all(30),
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
children: [
Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Text(
'Halo, ${widget.namaUser}! 👋',
style: const TextStyle(
fontSize: 28,
fontWeight: FontWeight.bold,
),
),
const SizedBox(height: 5),
const Text(
'Mau pinjam alat elektronik apa hari ini?',
style: TextStyle(
color: Colors.grey,
fontSize: 15,
),
),
],
),
CircleAvatar(
radius: 25,
backgroundColor: const Color(0xFF3045ED),
child: Text(
widget.namaUser.isNotEmpty
? widget.namaUser[0].toUpperCase()
: 'U',
style: const TextStyle(
color: Colors.white,
fontWeight: FontWeight.bold,
),
),
),
],
),

      const SizedBox(height: 25),

      TextField(
        decoration: InputDecoration(
          hintText: 'Cari alat elektronik...',
          prefixIcon: const Icon(Icons.search),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
        ),
      ),

      const SizedBox(height: 25),

      // BANNER
      Container(
        width: double.infinity,
        padding: const EdgeInsets.all(30),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              Color(0xFF3045ED),
              Color(0xFF6675FF),
            ],
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Butuh alat elektronik?',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Temukan berbagai alat yang bisa kamu pinjam dengan mudah.',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.devices_other,
              color: Colors.white,
              size: 75,
            ),
          ],
        ),
      ),

      const SizedBox(height: 30),

      // KATEGORI
      const Text(
        'Kategori',
        style: TextStyle(
          fontSize: 21,
          fontWeight: FontWeight.bold,
        ),
      ),

      const SizedBox(height: 15),

      Row(
        children: [
          _kategori(Icons.computer, 'Komputer'),
          _kategori(Icons.camera_alt, 'Fotografi'),
          _kategori(Icons.headphones, 'Audio'),
          _kategori(Icons.present_to_all, 'Presentasi'),
        ],
      ),

      const SizedBox(height: 35),

      // REKOMENDASI
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Rekomendasi Alat',
            style: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '${alat.length} alat tersedia',
            style: const TextStyle(
              color: Colors.grey,
            ),
          ),
        ],
      ),

      const SizedBox(height: 15),

      SizedBox(
        height: 285,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: alat.length,
          itemBuilder: (context, index) {
            final item = alat[index];

            return GestureDetector(
              onTap: () => bukaDetail(item),
              child: Container(
                width: 250,
                margin: const EdgeInsets.only(right: 18),
                child: Card(
                  elevation: 4,
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 145,
                        width: double.infinity,
                        child: Image.asset(
                          item.gambar,
                          fit: BoxFit.cover,
                          errorBuilder:
                              (context, error, stackTrace) {
                            return Container(
                              color: Colors.grey.shade200,
                              child: const Icon(
                                Icons.devices,
                                size: 55,
                                color: Colors.grey,
                              ),
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(13),
                        child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.nama,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 3),
                            Text(
                              item.kategori,
                              style: const TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              'Rp${item.formatHarga()} / hari',
                              style: const TextStyle(
                                color: Color(0xFF3045ED),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),

      const SizedBox(height: 35),

      // SEMUA ALAT
      const Text(
        'Semua Alat',
        style: TextStyle(
          fontSize: 21,
          fontWeight: FontWeight.bold,
        ),
      ),

      const SizedBox(height: 15),

      GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: alat.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 18,
          mainAxisSpacing: 18,
          childAspectRatio: 0.85,
        ),
        itemBuilder: (context, index) {
          final item = alat[index];

          return GestureDetector(
            onTap: () => bukaDetail(item),
            child: Card(
              elevation: 3,
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: SizedBox(
                      width: double.infinity,
                      child: Image.asset(
                        item.gambar,
                        fit: BoxFit.cover,
                        errorBuilder:
                            (context, error, stackTrace) {
                          return Container(
                            color: Colors.grey.shade200,
                            child: const Icon(
                              Icons.devices,
                              size: 50,
                              color: Colors.grey,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(13),
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.nama,
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          item.kategori,
                          style: const TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'Rp${item.formatHarga()}/hari',
                          style: const TextStyle(
                            color: Color(0xFF3045ED),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    ],
  ),
);
}

// ================= KATEGORI =================

Widget _kategori(
IconData icon,
String nama,
) {
return Expanded(
child: Container(
margin: const EdgeInsets.only(right: 12),
padding: const EdgeInsets.symmetric(vertical: 15),
decoration: BoxDecoration(
color: Colors.white,
borderRadius: BorderRadius.circular(14),
),
child: Column(
children: [
Icon(
icon,
color: const Color(0xFF3045ED),
size: 28,
),
const SizedBox(height: 7),
Text(
nama,
style: const TextStyle(
fontWeight: FontWeight.w500,
),
),
],
),
),
);
}

// ================= PEMINJAMAN =================

Widget _buildPeminjaman() {
if (riwayatPeminjaman.isEmpty) {
return const Center(
child: Column(
mainAxisSize: MainAxisSize.min,
children: [
Icon(
Icons.inventory_2_outlined,
size: 70,
color: Colors.grey,
),
SizedBox(height: 15),
Text(
'Belum ada data peminjaman.',
style: TextStyle(
fontSize: 20,
color: Colors.grey,
),
),
SizedBox(height: 5),
Text(
'Data reservasi akan muncul di sini.',
style: TextStyle(
color: Colors.grey,
),
),
],
),
);
}

return SingleChildScrollView(
  padding: const EdgeInsets.all(30),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        'Riwayat Peminjaman',
        style: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
        ),
      ),

      const SizedBox(height: 8),

      Text(
        '${riwayatPeminjaman.length} peminjaman',
        style: const TextStyle(
          color: Colors.grey,
          fontSize: 15,
        ),
      ),

      const SizedBox(height: 25),

      ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: riwayatPeminjaman.length,
        itemBuilder: (context, index) {
          final peminjaman = riwayatPeminjaman[index];

          return Card(
            margin: const EdgeInsets.only(bottom: 18),
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(14),
                    child: Image.asset(
                      peminjaman.alat.gambar,
                      width: 130,
                      height: 110,
                      fit: BoxFit.cover,
                      errorBuilder:
                          (context, error, stackTrace) {
                        return Container(
                          width: 130,
                          height: 110,
                          color: Colors.grey.shade200,
                          child: const Icon(
                            Icons.devices,
                            size: 45,
                            color: Colors.grey,
                          ),
                        );
                      },
                    ),
                  ),

                  const SizedBox(width: 20),

                  Expanded(
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        Text(
                          peminjaman.alat.nama,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 5),

                        Text(
                          peminjaman.alat.kategori,
                          style: const TextStyle(
                            color: Colors.grey,
                          ),
                        ),

                        const SizedBox(height: 15),

                        Text(
                          'Peminjam: ${peminjaman.user.nama}',
                        ),

                        const SizedBox(height: 5),

                        Text(
                          'Durasi: ${peminjaman.jumlahHari} hari',
                        ),

                        const SizedBox(height: 5),

                        Text(
                          'WhatsApp: ${peminjaman.nomorWhatsApp}',
                        ),

                        const SizedBox(height: 10),

                        Text(
                          'Total: Rp${peminjaman.totalHarga}',
                          style: const TextStyle(
                            color: Color(0xFF3045ED),
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 7,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.orange.shade50,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      'Menunggu',
                      style: TextStyle(
                        color: Colors.orange.shade800,
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    ],
  ),
);
}

// ================= PROFIL =================

Widget _buildProfil() {
return Center(
child: Card(
elevation: 3,
child: Padding(
padding: const EdgeInsets.all(30),
child: Column(
mainAxisSize: MainAxisSize.min,
children: [
const CircleAvatar(
radius: 45,
backgroundColor: Color(0xFF3045ED),
child: Icon(
Icons.person,
size: 50,
color: Colors.white,
),
),

          const SizedBox(height: 15),

          Text(
            widget.namaUser,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 5),

          const Text(
            'Pengguna PinjamAlat',
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
        ],
      ),
    ),
  ),
);
}
}
