import 'package:flutter/material.dart';

import 'login_page.dart';
import 'model/user.dart';

User? registeredUser;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // AKUN DEFAULT (biar bisa langsung login tanpa daftar dulu).
  registeredUser = User(
    nama: 'Revaliza',
    email: 'admin@gmail.com',
    nomorHp: '081234567890',
    password: '123456',
  );

  runApp(const PinjamAlatApp());
}

class PinjamAlatApp extends StatelessWidget {
  const PinjamAlatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PinjamAlat',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF3045ED),
        ),
      ),
      home: const LoginPage(),
    );
  }
}
