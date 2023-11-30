import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Bahasa Pemrograman',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: InkWell(
              onTap: () {
                // Implementasi navigasi ke halaman lain di sini
                // Misalnya, Navigator.push ke halaman yang dituju
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Lihat Semua'),
                  Icon(Icons.arrow_forward),
                ],
              ),
            ),
          ),
          Container(
            height: 150,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Image.network('https://via.placeholder.com/150'),
                Image.network('https://via.placeholder.com/150'),
                Image.network('https://via.placeholder.com/150'),
                Image.network('https://via.placeholder.com/150'),
                Image.network('https://via.placeholder.com/150'),
                Image.network('https://via.placeholder.com/150'),
                // Tambahkan gambar-gambar lain sesuai kebutuhan
              ],
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Topik',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: InkWell(
              onTap: () {
                // Implementasi navigasi ke halaman lain di sini
                // Misalnya, Navigator.push ke halaman yang dituju
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Lihat Semua'),
                  Icon(Icons.arrow_forward),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: Image.network('https://via.placeholder.com/50'),
                    title: Text('Item $index'),
                    subtitle: Text('Deskripsi item $index'),
                    // Tambahkan widget lainnya sesuai kebutuhan
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
