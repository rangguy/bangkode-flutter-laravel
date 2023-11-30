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
          // Bagian gambar-gambar yang dapat discroll ke samping
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
          // Bagian list beserta gambar yang dapat discroll ke bawah
          Expanded(
            child: ListView.builder(
              itemCount: 20, // Ganti dengan jumlah item yang ingin ditampilkan
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
