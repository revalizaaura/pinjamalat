import 'package:flutter/material.dart';

class AboutMePage extends StatelessWidget {
  const AboutMePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FB),

      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: const Color(0xFF171B2D),
        title: const Text(
          'About Me',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 10,
        ),

        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 900,
            ),

            child: Column(
              children: [

                // =================================================
                // HEADER PROFILE
                // =================================================

                Container(
                  width: double.infinity,

                  padding: const EdgeInsets.all(35),

                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFF183BFF),
                        Color(0xFF6538F5),
                      ],

                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),

                    borderRadius: BorderRadius.circular(28),

                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.10),
                        blurRadius: 25,
                        offset: const Offset(0, 12),
                      ),
                    ],
                  ),

                  child: Row(
                    children: [

                      // FOTO / AVATAR
                      Container(
                        width: 125,
                        height: 125,

                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.18),
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white,
                            width: 4,
                          ),
                        ),

                        child: ClipOval (
                          child: Image.asset(
                            'assets/foto_about_me.jpeg',
                            width: 75,
                            height: 75,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      const SizedBox(width: 30),

                      // NAMA
                      Expanded(
                        child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.start,

                          children: [

                            const Text(
                              'HELLO, I\'M',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 2,
                              ),
                            ),

                            const SizedBox(height: 8),

                            const Text(
                              'Revaliza Aura Nabila',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.w800,
                              ),
                            ),

                            const SizedBox(height: 8),

                            const Text(
                              'Mahasiswa • UI & App Development',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 15,
                              ),
                            ),

                            const SizedBox(height: 18),

                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 15,
                                vertical: 8,
                              ),

                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.15),
                                borderRadius:
                                    BorderRadius.circular(30),
                              ),

                              child: const Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [

                                  Icon(
                                    Icons.school_outlined,
                                    color: Colors.white,
                                    size: 17,
                                  ),

                                  SizedBox(width: 7),

                                  Text(
                                    'Student Project',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 25),

                // =================================================
                // TENTANG SAYA
                // =================================================

                _sectionCard(
                  icon: Icons.person_outline,
                  title: 'Tentang Saya',

                  child: const Text(
                    'Halo! Saya Revaliza Aura Nabila. '
                    'Saya sedang mengembangkan aplikasi PinjamAlat, '
                    'sebuah sistem peminjaman alat elektronik yang '
                    'dirancang agar pengguna dapat menemukan, '
                    'memilih, dan melakukan reservasi alat dengan '
                    'lebih mudah dan praktis.',
                    style: TextStyle(
                      color: Color(0xFF687086),
                      fontSize: 15,
                      height: 1.7,
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // =================================================
                // PROJECT
                // =================================================

                _sectionCard(
                  icon: Icons.devices_other,
                  title: 'Tentang Project',

                  child: Container(
                    padding: const EdgeInsets.all(20),

                    decoration: BoxDecoration(
                      color: const Color(0xFFF4F6FF),
                      borderRadius: BorderRadius.circular(18),
                    ),

                    child: Row(
                      children: [

                        Container(
                          width: 60,
                          height: 60,

                          decoration: BoxDecoration(
                            color: const Color(0xFF3045ED),
                            borderRadius:
                                BorderRadius.circular(16),
                          ),

                          child: const Icon(
                            Icons.electrical_services,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),

                        const SizedBox(width: 18),

                        const Expanded(
                          child: Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,

                            children: [

                              Text(
                                'PinjamAlat',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF171B2D),
                                ),
                              ),

                              SizedBox(height: 6),

                              Text(
                                'Sistem Peminjaman Alat Elektronik',
                                style: TextStyle(
                                  color: Color(0xFF687086),
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // =================================================
                // FITUR YANG DIKERJAKAN
                // =================================================

                _sectionCard(
                  icon: Icons.auto_awesome_outlined,
                  title: 'Fitur Aplikasi',

                  child: Wrap(
                    spacing: 10,
                    runSpacing: 10,

                    children: const [

                      _FeatureChip(
                        icon: Icons.login,
                        text: 'Login',
                      ),

                      _FeatureChip(
                        icon: Icons.home_outlined,
                        text: 'Home',
                      ),

                      _FeatureChip(
                        icon: Icons.devices,
                        text: 'Daftar Alat',
                      ),

                      _FeatureChip(
                        icon: Icons.calendar_month,
                        text: 'Reservasi',
                      ),

                      _FeatureChip(
                        icon: Icons.person_outline,
                        text: 'Profil',
                      ),

                      _FeatureChip(
                        icon: Icons.info_outline,
                        text: 'About Me',
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // =================================================
                // TEKNOLOGI
                // =================================================

                _sectionCard(
                  icon: Icons.code,
                  title: 'Teknologi',

                  child: Row(
                    children: [

                      _technology(
                        Icons.flutter_dash,
                        'Flutter',
                      ),

                      const SizedBox(width: 12),

                      _technology(
                        Icons.code,
                        'Dart',
                      ),

                      const SizedBox(width: 12),

                      _technology(
                        Icons.web,
                        'Web',
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),

                // =================================================
                // FOOTER
                // =================================================

                const Text(
                  'PinjamAlat • Student Project',
                  style: TextStyle(
                    color: Color(0xFF9AA1B2),
                    fontSize: 12,
                  ),
                ),

                const SizedBox(height: 8),

                const Text(
                  '© 2026 Revaliza Aura Nabila',
                  style: TextStyle(
                    color: Color(0xFFB0B5C2),
                    fontSize: 11,
                  ),
                ),

                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // =============================================================
  // SECTION CARD
  // =============================================================

  static Widget _sectionCard({
    required IconData icon,
    required String title,
    required Widget child,
  }) {
    return Container(
      width: double.infinity,

      padding: const EdgeInsets.all(25),

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.circular(22),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [

          Row(
            children: [

              Container(
                width: 42,
                height: 42,

                decoration: BoxDecoration(
                  color: const Color(0xFFE9EDFF),
                  borderRadius: BorderRadius.circular(12),
                ),

                child: Icon(
                  icon,
                  color: const Color(0xFF3045ED),
                  size: 21,
                ),
              ),

              const SizedBox(width: 13),

              Text(
                title,
                style: const TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF171B2D),
                ),
              ),
            ],
          ),

          const SizedBox(height: 18),

          child,
        ],
      ),
    );
  }

  // =============================================================
  // TECHNOLOGY
  // =============================================================

  static Widget _technology(
    IconData icon,
    String text,
  ) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 16,
        ),

        decoration: BoxDecoration(
          color: const Color(0xFFF7F8FC),
          borderRadius: BorderRadius.circular(15),
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
              text,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: Color(0xFF4F5668),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// =============================================================
// FEATURE CHIP
// =============================================================

class _FeatureChip extends StatelessWidget {
  final IconData icon;
  final String text;

  const _FeatureChip({
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 10,
      ),

      decoration: BoxDecoration(
        color: const Color(0xFFF4F6FF),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: const Color(0xFFE1E5FF),
        ),
      ),

      child: Row(
        mainAxisSize: MainAxisSize.min,

        children: [

          const Icon(
            Icons.check_circle_outline,
            color: Color(0xFF3045ED),
            size: 17,
          ),

          const SizedBox(width: 7),

          Text(
            text,
            style: const TextStyle(
              color: Color(0xFF4F5668),
              fontWeight: FontWeight.w600,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
