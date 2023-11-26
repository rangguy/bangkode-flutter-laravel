import 'package:bangkode/bloc/kategori_bloc.dart';
import 'package:bangkode/model/kategori.dart';
import 'package:flutter/material.dart';

class KategoriPage extends StatefulWidget {
  const KategoriPage({Key? key}) : super(key: key);

  @override
  _KategoriPageState createState() => _KategoriPageState();
}

class _KategoriPageState extends State<KategoriPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Kategori'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              child: const Icon(Icons.add, size: 26.0),
              onTap: () async {
                // Navigator.push(context, MaterialPageRoute(builder: (context) => ProdukForm()));
              },
            ),
          ),
        ],
      ),
      body: FutureBuilder<List>(
        future: KategoriBloc.getKategoris(),
        builder: (context, snapshot) {
          // return ListKategori();
          if (snapshot.hasError) print(snapshot.error);
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

  const ListKategori({Key? key, this.list}) : super(key: key);

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
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => ProdukDetail(
        //       produk: produk,
        //     ),
        //   ),
        // );
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
