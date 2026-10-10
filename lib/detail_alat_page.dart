import 'package:flutter/material.dart';
import 'main.dart';
import 'model/alat_elektronik.dart';
import 'model/peminjaman.dart';

class DetailAlatPage extends StatefulWidget {
  final String nama;
  final String kategori;
  final int harga;
  final String gambar;

  const DetailAlatPage({
    super.key,
    required this.nama,
    required this.kategori,
    required this.harga,
    required this.gambar,
  });

  @override
  State<DetailAlatPage> createState() => _DetailAlatPageState();
}

class _DetailAlatPageState extends State<DetailAlatPage> {
  int jumlahHari = 1;

  final namaController = TextEditingController();
  final whatsappController = TextEditingController();

  late AlatElektronik alat;

  int get totalHarga => alat.hitungTotalHarga(jumlahHari);

  @override
  void initState() {
    super.initState();

    alat = AlatElektronik(
      nama: widget.nama,
      kategori: widget.kategori,
      harga: widget.harga,
      gambar: widget.gambar,
    );

    if (registeredUser != null) {
      namaController.text = registeredUser!.nama;
    }
  }

  @override
  void dispose() {
    namaController.dispose();
    whatsappController.dispose();
    super.dispose();
  }

  void tambahHari() {
    setState(() {
      if (jumlahHari < 30) {
        jumlahHari++;
      }
    });
  }

  void kurangHari() {
    setState(() {
      if (jumlahHari > 1) {
        jumlahHari--;
      }
    });
  }

  void reservasi() {
    if (namaController.text.trim().isEmpty ||
        whatsappController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Nama dan nomor WhatsApp wajib diisi!',
          ),
        ),
      );
      return;
    }

    if (registeredUser == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Silakan login terlebih dahulu.',
          ),
        ),
      );
      return;
    }

    final peminjaman = Peminjaman(
      user: registeredUser!,
      alat: alat,
      jumlahHari: jumlahHari,
      nomorWhatsApp: whatsappController.text.trim(),
    );

    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text(
            'Reservasi Berhasil! 🎉',
          ),
          content: Text(
            '${peminjaman.ringkasanPeminjaman()}\n\n'
            'Nama: ${namaController.text}\n'
            'Nomor WhatsApp: ${peminjaman.nomorWhatsApp}\n\n'
            'Data peminjaman sudah masuk ke riwayat.',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext);
                Navigator.pop(context, peminjaman);
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void hubungiPemilik() {
    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text(
            'Hubungi Pemilik',
          ),
          content: const Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Untuk melakukan konfirmasi peminjaman, silakan hubungi pemilik alat melalui WhatsApp.',
              ),
              SizedBox(height: 15),
              Text(
                'WhatsApp Pemilik:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5),
              Text(
                '08xxxxxxxxxx',
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFF3045ED),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Nomor di atas masih berupa contoh dan dapat diganti dengan nomor pemilik sebenarnya.',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext);
              },
              child: const Text('Tutup'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FB),
      appBar: AppBar(
        title: Text(
          'Detail ${alat.nama}',
        ),
        backgroundColor: const Color(0xFF3045ED),
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(30),
          child: Container(
            constraints: const BoxConstraints(
              maxWidth: 900,
            ),
            child: Card(
              elevation: 4,
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 300,
                    child: Image.asset(
                      alat.gambar,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.grey.shade200,
                          child: const Icon(
                            Icons.devices,
                            size: 100,
                            color: Colors.grey,
                          ),
                        );
                      },
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          alat.nama,
                          style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 5),

                        Text(
                          alat.kategori,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                        ),

                        const SizedBox(height: 10),

                        Text(
                          'Rp${alat.formatHarga()} / hari',
                          style: const TextStyle(
                            color: Color(0xFF3045ED),
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 30),

                        const Divider(),

                        const SizedBox(height: 20),

                        const Text(
                          'Durasi Peminjaman',
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 15),

                        Row(
                          children: [
                            IconButton(
                              onPressed: kurangHari,
                              style: IconButton.styleFrom(
                                backgroundColor:
                                    const Color(0xFFE8EBFF),
                              ),
                              icon: const Icon(Icons.remove),
                            ),

                            Container(
                              width: 100,
                              padding: const EdgeInsets.symmetric(
                                vertical: 12,
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                '$jumlahHari hari',
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),

                            IconButton(
                              onPressed: tambahHari,
                              style: IconButton.styleFrom(
                                backgroundColor:
                                    const Color(0xFFE8EBFF),
                              ),
                              icon: const Icon(Icons.add),
                            ),
                          ],
                        ),

                        const SizedBox(height: 20),

                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF0F2FF),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Row(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Total Harga',
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Rp${alat.formatHarga()} × $jumlahHari',
                                style: const TextStyle(
                                  color: Color(0xFF3045ED),
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 30),

                        const Text(
                          'Data Reservasi',
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 15),

                        TextField(
                          controller: namaController,
                          decoration: InputDecoration(
                            labelText: 'Nama Lengkap',
                            hintText: 'Masukkan nama kamu',
                            prefixIcon:
                                const Icon(Icons.person_outline),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),

                        const SizedBox(height: 15),

                        TextField(
                          controller: whatsappController,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            labelText: 'No. WhatsApp',
                            hintText: 'Masukkan nomor WhatsApp',
                            prefixIcon:
                                const Icon(Icons.phone_outlined),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),

                        const SizedBox(height: 25),

                        SizedBox(
                          width: double.infinity,
                          height: 52,
                          child: ElevatedButton.icon(
                            onPressed: reservasi,
                            icon: const Icon(
                              Icons.check_circle_outline,
                            ),
                            label: const Text(
                              'Reservasi',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color(0xFF3045ED),
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 12),

                        SizedBox(
                          width: double.infinity,
                          height: 52,
                          child: OutlinedButton.icon(
                            onPressed: hubungiPemilik,
                            icon: const Icon(Icons.chat),
                            label: const Text(
                              'Hubungi Pemilik',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            style: OutlinedButton.styleFrom(
                              foregroundColor:
                                  const Color(0xFF3045ED),
                              side: const BorderSide(
                                color: Color(0xFF3045ED),
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
