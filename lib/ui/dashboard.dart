import 'package:bangkode/bloc/kategori_bloc.dart';
import 'package:bangkode/bloc/topik_bloc.dart';
import 'package:bangkode/model/kategori.dart';
import 'package:bangkode/model/materi.dart';
import 'package:bangkode/model/topik.dart';
import 'package:bangkode/nav.dart';
import 'package:bangkode/ui/alltopik.dart';
import 'package:bangkode/ui/kategori_page.dart';
import 'package:bangkode/ui/materi_page.dart';
import 'package:bangkode/ui/topik_page.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class ListKategori extends StatelessWidget {
  final List? list;

  ListKategori({Key? key, this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (context, i) {
          return ItemKategori(
            kategori: list![i],
          );
        },
      ),
    );
  }
}

class ItemKategori extends StatelessWidget {
  final Kategori kategori;

  const ItemKategori({Key? key, required this.kategori}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TopikPage(
              kategori: kategori,
            ),
          ),
        );
      },
      child: Card(
        color: Colors.white,
        child: SizedBox(
          child: Column(
            children: [
              Image.network(
                'http://10.0.2.2:8000/storage/kategori/${kategori.foto!}',
                width: 100, // Sesuaikan lebar gambar sesuai kebutuhan
                height: 100, // Sesuaikan tinggi gambar sesuai kebutuhan
              ),
              SizedBox(height: 8),
              Text(kategori.nama_kategori!), // Nama kategori di bawah gambar
            ],
          ),
        ),
      ),
    );
  }
}

class ListTopik extends StatelessWidget {
  final List<Topik>? list;

  ListTopik({Key? key, this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, i) {
        return ItemTopik(
          topik: list![i],
        );
      },
    );
  }
}

class ItemTopik extends StatelessWidget {
  final Topik topik;

  const ItemTopik({Key? key, required this.topik}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        side: BorderSide(
            color: Colors.black, width: 0.5), // Border berwarna hitam
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: ListTile(
        leading: Image.network(
          'http://10.0.2.2:8000/storage/topik/${topik.logo_topik!}',
          width: 60,
        ),
        title: Text("${topik.id_topik}"),
        subtitle: Text("${topik.nama_topik}"),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MateriPage(topik: topik),
            ),
          );
        },
        trailing: Icon(Icons.arrow_forward), // Icon di bagian ujung kanan
      ),
    );
  }
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text('Selamat Datang', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        automaticallyImplyLeading: false,
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height * 0.8,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(7.0),
              child: Text(
                'Bahasa Pemrograman',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => KategoriPage(),
                    ),
                  );
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
            SizedBox(
              height: 10,
            ),
            Container(
              child: FutureBuilder<List>(
                future: KategoriBloc.getKategoris(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (snapshot.hasData) {
                    return ListKategori(
                      list: snapshot.data,
                    );
                  } else {
                    return const Center(child: Text('Tidak ada data kategori'));
                  }
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(7.0),
              child: Text(
                'Topik',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AllTopik(),
                    ),
                  );
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
              child: FutureBuilder<List<Topik>>(
                future: TopikBloc.getAllTopiks(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (snapshot.hasData) {
                    return ListTopik(
                      list: snapshot.data,
                    );
                  } else {
                    return const Center(child: Text('Tidak ada data topik'));
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
