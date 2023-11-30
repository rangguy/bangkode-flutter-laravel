import 'package:bangkode/bloc/kategori_bloc.dart';
import 'package:bangkode/model/kategori.dart';
import 'package:bangkode/ui/topik_page.dart';
import 'package:flutter/material.dart';

class KategoriPage extends StatefulWidget {
  const KategoriPage({Key? key}) : super(key: key);

  @override
  _KategoriPageState createState() => _KategoriPageState();
}

class _KategoriPageState extends State<KategoriPage> {
  int dataLength = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Kategori'),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize:
              const Size.fromHeight(10.0), // Sesuaikan tinggi sesuai kebutuhan
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              '$dataLength Bahasa',
              style: const TextStyle(
                fontSize: 14.0,
                fontStyle: FontStyle.normal,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
      body: FutureBuilder<List>(
        future: KategoriBloc.getKategoris(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          if (snapshot.hasData) {
            dataLength = snapshot.data!.length; // Mengambil panjang data list
          }
          return snapshot.hasData
              ? ListKategori(
                  list: snapshot.data,
                )
              : const Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}

class ListKategori extends StatelessWidget {
  final List? list;

  ListKategori({Key? key, this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list == null ? 0 : list!.length,
      itemBuilder: (context, i) {
        return ItemKategori(
          kategori: list![i],
        );
      },
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
        child: ListTile(
          title: Text(kategori.nama_kategori!),
          subtitle: Text(kategori.foto!),
        ),
      ),
    );
  }
}
