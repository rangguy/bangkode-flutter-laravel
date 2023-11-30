import 'package:bangkode/bloc/materi_bloc.dart';
import 'package:bangkode/model/materi.dart';
import 'package:bangkode/model/topik.dart';
import 'package:bangkode/ui/materi_player.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MateriPage extends StatefulWidget {
  Topik? topik;
  MateriPage({Key? key, required this.topik}) : super(key: key);

  @override
  _MateriPageState createState() => _MateriPageState();
}

class _MateriPageState extends State<MateriPage> {
  late Future<List<Materi>> _materisFuture;
  int dataLength = 0;

  @override
  void initState() {
    super.initState();
    _materisFuture = MateriBloc.getMateris(
        id_kategori: widget.topik!.id_kategori,
        id_topik: widget.topik!.id_topik);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Topik"),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Materi>>(
        future: _materisFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('Tidak ada data materi'));
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return Stack(
              children: [
                Positioned(
                  top: 10,
                  left: 10,
                  right: 10,
                  child: Image.network(
                    'localhost/backend-bangkode/public/storage/topik/${widget.topik!.logo_topik}',
                    fit: BoxFit.cover,
                    height: 200, // Sesuaikan tinggi gambar sesuai kebutuhan
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: 180), // Sesuaikan posisi list di bawah gambar
                  child: ListMateri(list: snapshot.data),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}

class ListMateri extends StatelessWidget {
  final List<Materi>? list;

  ListMateri({Key? key, this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list?.length ?? 0,
      itemBuilder: (context, i) {
        return ItemMateri(materi: list![i]);
      },
    );
  }
}

class ItemMateri extends StatelessWidget {
  final Materi materi;

  const ItemMateri({Key? key, required this.materi}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text("${materi.id_materi}"),
        subtitle: Text("${materi.judul_materi}"),
        onTap: () {
          Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MateriVideoPlayer(
              materi: materi,
            ),
          ),
        );
        },
      ),
    );
  }
}
