import 'package:bangkode/bloc/topik_bloc.dart';
import 'package:bangkode/model/kategori.dart';
import 'package:bangkode/model/topik.dart';
import 'package:bangkode/ui/materi_page.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TopikPage extends StatefulWidget {
  Kategori? kategori;
  TopikPage({Key? key, required this.kategori}) : super(key: key);

  @override
  _TopikPageState createState() => _TopikPageState();
}

class _TopikPageState extends State<TopikPage> {
  late Future<List<Topik>> _topiksFuture;
  int dataLength = 0;

  @override
  void initState() {
    super.initState();
    _topiksFuture =
        TopikBloc.getTopiks(id_kategori: widget.kategori!.id_kategori);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.kategori!.nama_kategori}"),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize:
              const Size.fromHeight(10.0), // Sesuaikan tinggi sesuai kebutuhan
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              '$dataLength Topik',
              style: const TextStyle(
                fontSize: 14.0,
                fontStyle: FontStyle.normal,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
      body: FutureBuilder<List<Topik>>(
        future: _topiksFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('Tidak ada data topik'));
          } else {
            return ListTopik(list: snapshot.data);
          }
        },
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
      itemCount: list?.length ?? 0,
      itemBuilder: (context, i) {
        return ItemTopik(topik: list![i]);
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
      child: ListTile(
        title: Text("${topik.id_topik}"),
        subtitle: Text("${topik.nama_topik}"),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  MateriPage(topik: topik),
            ),
          );
        },
      ),
    );
  }
}
