import 'package:bangkode/bloc/topik_bloc.dart';
import 'package:bangkode/model/kategori.dart';
import 'package:bangkode/model/topik.dart';
import 'package:bangkode/ui/materi_page.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AllTopik extends StatefulWidget {
  AllTopik({Key? key}) : super(key: key);

  @override
  _AllTopikState createState() => _AllTopikState();
}

class _AllTopikState extends State<AllTopik> {
  late Future<List<Topik>> _topiksFuture;
  int dataLength = 0;

  @override
  void initState() {
    super.initState();
    _topiksFuture =
        TopikBloc.getAllTopiks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List Semua Topik"),
        centerTitle: true,
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
      color: Colors.white,
      shape: RoundedRectangleBorder(
        side: BorderSide(
            color: Colors.black, width: 0.5), // Border berwarna hitam
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: ListTile(
        leading: Image.network(
            'http://10.0.2.2:8000/storage/topik/${topik.logo_topik!}', width: 60,),
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
