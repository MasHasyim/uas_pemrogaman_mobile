import 'package:flutter/material.dart';
import 'news_screen.dart';
import 'profile_screen.dart';
import 'create_club_screen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Club App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
      routes: {
        '/create-club': (context) => CreateClubScreen(),
      },
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    NewsScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.white),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event, color: Colors.white),
            label: 'Events',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.white),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromARGB(255, 33, 40, 243),
        backgroundColor: const Color.fromARGB(
            221, 0, 0, 0), // Ubah warna background sesuai keinginan Anda
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background image
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/home_background2.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: AppBar(
            title: const Text(
              'Home',
              style: TextStyle(
                color: Colors.white, // Mengubah warna teks menjadi putih
                fontWeight:
                    FontWeight.bold, // Membuat teks menjadi tebal (bold)
              ),
            ),
            backgroundColor: Colors.transparent, // Membuat AppBar transparan
            elevation: 0, // Menghilangkan bayangan AppBar
          ),
        ),

        // Konten tetap di atas latar belakang
        Column(
          children: [
            SizedBox(height: 65), // Spasi antara AppBar dan konten
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 160, // Ukuran baru yang lebih kecil untuk kartu
                      child: Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: InkWell(
                          onTap: () {
                            _showSearchDialog(context);
                          },
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.asset(
                                  'assets/join_club.png',
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  height: double.infinity,
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  padding: const EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.6),
                                    borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(15),
                                      bottomRight: Radius.circular(15),
                                    ),
                                  ),
                                  child: const Text(
                                    'Join Club',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 160, // Ukuran baru yang lebih kecil untuk kartu
                      child: Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, '/create-club');
                          },
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.asset(
                                  'assets/create_club.jpg',
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  height: double.infinity,
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  padding: const EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.6),
                                    borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(15),
                                      bottomRight: Radius.circular(15),
                                    ),
                                  ),
                                  child: const Text(
                                    'Create Club',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 35), // Spasi antara bagian atas dan daftar klub
          ],
        ),

        SizedBox(
          height: 20,
        ),
        // Teks "Displaying Futsal Clubs" tetap di atas dan tidak ikut scroll
        Positioned(
          top: 280,
          left: 16,
          right: 16,
          child: Container(
            color:
                Colors.transparent, // Membuat background benar-benar transparan
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: const Text(
              'Futsal Clubs Display',
              style: TextStyle(
                color: Color.fromARGB(255, 235, 235, 235),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        // List club yang dapat di-scroll di bawah teks
        Positioned(
          top:
              320, // Menempatkan daftar tepat di bawah teks "Displaying Futsal Clubs"
          left: 0,
          right: 0,
          bottom:
              0, // Membuat daftar memenuhi seluruh layar dari bawah teks "Displaying Futsal Clubs"
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:
                    _buildDisplayClubs(), // Memanggil metode untuk membuat daftar klub yang ditampilkan
              ),
            ),
          ),
        ),
      ],
    );
  }

  List<Widget> _buildDisplayClubs() {
    // Daftar dummy klub untuk ditampilkan
    final displayClubs = [
      {
        'logo': 'assets/futsal_component/club1_logo.png',
        'name': 'JACKTEAM FC',
        'origin': 'Jakarta Timur'
      },
      {
        'logo': 'assets/futsal_component/club2_logo.png',
        'name': 'BlackMafia',
        'origin': 'Jakarta Selatan'
      },
      {
        'logo': 'assets/futsal_component/club3_logo.png',
        'name': 'JANGKAR FC',
        'origin': 'Surabaya'
      },
      {
        'logo': 'assets/futsal_component/club4_logo.png',
        'name': 'Boltz',
        'origin': 'Bandung'
      },
      {
        'logo': 'assets/futsal_component/club5_logo.png',
        'name': 'Tiger Roar',
        'origin': 'Yogyakarta'
      },
      // Tambahkan klub lainnya sesuai kebutuhan
    ];

    return displayClubs.map((club) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(club['logo'] ?? ""),
              radius:
                  25, // Sesuaikan ukuran radius avatar sesuai kebutuhan Anda
            ),
            SizedBox(width: 10), // Memberikan jarak antara logo dan teks
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  club['name'] ?? "",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                Text(
                  club['origin'] ?? "",
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }).toList();
  }

  void _showSearchDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Search Club'),
          content: TextField(
            decoration: const InputDecoration(
              hintText: 'Enter club name...',
            ),
            onSubmitted: (value) {
              // Implement search logic here
              print('Searching for: $value');
              Navigator.of(context).pop();
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }
}
