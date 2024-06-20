import 'package:flutter/material.dart';

class NewsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // Mengizinkan konten di belakang AppBar
      appBar: AppBar(
        title: const Text(
          'News Tournament',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.transparent, // Membuat AppBar transparan
        elevation: 0, // Menghilangkan bayangan AppBar
      ),
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/home_background2.png'), // Ganti dengan path gambar Anda
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Konten tetap di atas latar belakang
          Padding(
            padding: const EdgeInsets.only(
                top: kToolbarHeight, // Menyediakan ruang untuk AppBar
                left: 8.0,
                right: 8.0),
            child: SingleChildScrollView(
              child: Column(
                children: tournaments.map((tournament) {
                  return Card(
                    elevation: 4,
                    margin: const EdgeInsets.symmetric(vertical: 10.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Menambahkan ClipRRect untuk border radius gambar
                        Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  topRight: Radius.circular(15)),
                              child: Image.asset(
                                tournament['image']!,
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: 200, // Meningkatkan tinggi gambar
                              ),
                            ),
                            Positioned(
                              top: 10,
                              right: 10,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 10),
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Text(
                                  'Pendaftaran Dibuka',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                tournament['title']!,
                                style: const TextStyle(
                                  fontSize: 18, // Ukuran font judul lebih kecil
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 5),
                              // Menambahkan informasi dengan ikon dan mengurangi ukuran font
                              _buildInfoRow(Icons.calendar_today,
                                  '${tournament['registration']}'),
                              const SizedBox(height: 5),
                              _buildInfoRow(Icons.money, '${tournament['fee']}'),
                              const SizedBox(height: 5),
                              _buildInfoRow(Icons.category,
                                  '${tournament['system']}'),
                              const SizedBox(height: 5),
                              _buildInfoRow(Icons.card_giftcard,
                                  '${tournament['prizes']}'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  final List<Map<String, String>> tournaments = [
    {
      'image': 'assets/futsal_component/poster1.png', // Sesuaikan dengan nama file gambar Anda
      'title': 'Futsal Championship 2024',
      'registration': '1 June 2024 - 30 June 2024',
      'fee': 'Rp 500,000',
      'system': 'Knockout',
      'prizes': ' Rp 10.000.000'
    },
    {
      'image': 'assets/futsal_component/poster2.png',
      'title': 'Regional Futsal Cup',
      'registration': '15 July 2024 - 15 August 2024',
      'fee': 'Rp 750,000',
      'system': 'Group Stage + Knockout',
      'prizes': 'Rp 15.000.000'
    },
    {
      'image': 'assets/futsal_component/poster3.png',
      'title': 'Intercity Futsal League',
      'registration': '1 September 2024 - 30 September 2024',
      'fee': 'Rp 400,000',
      'system': 'Group Stage',
      'prizes': 'Rp. 8.000.000'
    },
  ];

  // Fungsi untuk membuat baris informasi dengan ikon dan teks dengan ukuran font yang lebih kecil
  Widget _buildInfoRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, color: Colors.blueAccent),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(fontSize: 12), // Mengurangi ukuran font deskripsi menjadi 12
          ),
        ),
      ],
    );
  }
}
