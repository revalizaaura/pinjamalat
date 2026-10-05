import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'main.dart';
import 'model/user.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final namaController = TextEditingController();
  final emailController = TextEditingController();
  final hpController = TextEditingController();
  final passwordController = TextEditingController();
  final konfirmasiController = TextEditingController();

  Future<void> register() async {
    if (namaController.text.trim().isEmpty ||
        emailController.text.trim().isEmpty ||
        hpController.text.trim().isEmpty ||
        passwordController.text.isEmpty ||
        konfirmasiController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Semua data harus diisi!'),
        ),
      );
      return;
    }

    if (passwordController.text != konfirmasiController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Konfirmasi password tidak sama!'),
        ),
      );
      return;
    }

    // Membuat object User
    final user = User(
      nama: namaController.text.trim(),
      email: emailController.text.trim(),
      nomorHp: hpController.text.trim(),
      password: passwordController.text,
    );

    // Menyimpan object User ke variabel global
    registeredUser = user;

    // Mengambil penyimpanan lokal
    final prefs = await SharedPreferences.getInstance();

    // Menyimpan data akun
    await prefs.setString('nama', user.nama);
    await prefs.setString('email', user.email);
    await prefs.setString('nomorHp', user.nomorHp);
    await prefs.setString('password', user.password);

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Pendaftaran berhasil! Silakan login.'),
      ),
    );

    // Kembali ke halaman Login
    Navigator.pop(context);
  }

  InputDecoration inputDecoration(String label, IconData icon) {
    return InputDecoration(
      labelText: label,
      prefixIcon: Icon(icon),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  @override
  void dispose() {
    namaController.dispose();
    emailController.dispose();
    hpController.dispose();
    passwordController.dispose();
    konfirmasiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Akun'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(30),
          child: SizedBox(
            width: 500,
            child: Column(
              children: [
                const Text(
                  'Buat Akun Baru',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 30),

                TextField(
                  controller: namaController,
                  decoration: inputDecoration(
                    'Nama Lengkap',
                    Icons.person_outline,
                  ),
                ),

                const SizedBox(height: 15),

                TextField(
                  controller: emailController,
                  decoration: inputDecoration(
                    'Email',
                    Icons.email_outlined,
                  ),
                ),

                const SizedBox(height: 15),

                TextField(
                  controller: hpController,
                  decoration: inputDecoration(
                    'No. WhatsApp / HP',
                    Icons.phone_outlined,
                  ),
                ),

                const SizedBox(height: 15),

                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: inputDecoration(
                    'Password',
                    Icons.lock_outline,
                  ),
                ),

                const SizedBox(height: 15),

                TextField(
                  controller: konfirmasiController,
                  obscureText: true,
                  decoration: inputDecoration(
                    'Konfirmasi Password',
                    Icons.lock_outline,
                  ),
                ),

                const SizedBox(height: 25),

                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: register,
                    child: const Text('Daftar'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
