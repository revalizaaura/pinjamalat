import 'package:flutter/material.dart';

import 'login_page.dart';
import 'model/user.dart';

// Diisi saat user berhasil login (dipakai di DetailAlatPage dan halaman lain).
User? registeredUser;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
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