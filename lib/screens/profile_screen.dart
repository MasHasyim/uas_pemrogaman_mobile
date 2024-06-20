import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true, // Membuat body di belakang AppBar
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/home_background2.png', // Ganti dengan path gambar background kamu
              fit: BoxFit.cover,
            ),
          ),
          // Konten Scrollable
          SingleChildScrollView(
            child: Column(
              children: [
                // Memberikan ruang untuk menghindari konten di bawah AppBar
                SizedBox(height: 100),
                // Avatar, Nama dan Tombol
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Column(
                    children: [
                      // Avatar
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage(
                            'assets/profile_picture.png'), // Ganti dengan path foto profil kamu
                      ),
                      const SizedBox(height: 10),
                      // Nama
                      const Text(
                        'Fikri hasyim',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      // Username
                      const Text(
                        '@hasyimganteng',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 10),
                      // Tombol Edit dan Share
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              // Aksi untuk Edit Profile
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: const Text('Edit Profile'),
                          ),
                          const SizedBox(width: 10),
                          ElevatedButton(
                            onPressed: () {
                              // Aksi untuk Share Profile
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: const Text('Share Profile'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // About Me Card
                Card(
                  margin: const EdgeInsets.all(10.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'About Me',
                          style: TextStyle(
                            fontSize: 18, // Ukuran teks sedikit lebih kecil
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        _buildInfoRow(Icons.sports_soccer, 'As a Striker'),
                        _buildInfoRow(Icons.email, 'hasyim@gmail.com'),
                        _buildInfoRow(Icons.phone, '+62 812-3456-7890'),
                        _buildInfoRow(
                            Icons.home, 'Jl. Pandugo No.20, Surabaya'),
                        _buildInfoRow(Icons.cake, '12 December 2000'),
                      ],
                    ),
                  ),
                ),
                // Your Communities Section
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Your Communities',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: ListTile(
                          leading: Icon(Icons.shield,
                              color: Colors.grey), // Icon komunitas
                          title: Text('Jangkar FC'),
                          subtitle: Text('Kota Surabaya'),
                          onTap: () {
                            // Aksi saat komunitas di-tap
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                // Memberikan sedikit ruang di bawah agar konten tidak terlalu mepet ke bawah
                SizedBox(height: 30),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Fungsi untuk membuat baris informasi dengan ikon dan teks
  Widget _buildInfoRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.blueAccent),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 14), // Ukuran teks lebih kecil
            ),
          ),
        ],
      ),
    );
  }
}
