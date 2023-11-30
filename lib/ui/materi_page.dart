import 'package:bangkode/bloc/materi_bloc.dart';
import 'package:bangkode/model/materi.dart';
import 'package:bangkode/model/topik.dart';
import 'package:bangkode/ui/materi_player.dart';
import 'package:flutter/material.dart';

class MateriPage extends StatefulWidget {
  final Topik? topik;

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
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.4,
                  decoration: ShapeDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          "http://10.0.2.2:8000/storage/topik/${widget.topik!.logo_topik}"),
                      fit: BoxFit.fill,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListMateri(list: snapshot.data),
                  ),
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
      color: Colors.white, // Warna latar belakang putih
      shape: RoundedRectangleBorder(
        side: BorderSide(
            color: Colors.black, width: 0.5), // Border berwarna hitam
        borderRadius: BorderRadius.circular(10.0),
      ),
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
        trailing: Icon(Icons.arrow_forward), // Icon di bagian ujung kanan
      ),
    );
  }
}
