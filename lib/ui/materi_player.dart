import 'package:bangkode/model/materi.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MateriVideoPlayer extends StatefulWidget {
  final Materi? materi;

  MateriVideoPlayer({Key? key, required this.materi}) : super(key: key);

  @override
  _MateriVideoPlayerState createState() => _MateriVideoPlayerState();
}

class _MateriVideoPlayerState extends State<MateriVideoPlayer> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: '${widget.materi!.url_materi}',
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.materi!.judul_materi}'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          YoutubePlayer(
            controller: _controller,
            showVideoProgressIndicator: true,
            progressIndicatorColor: Colors.blueAccent,
            progressColors: ProgressBarColors(
              playedColor: Colors.blue,
              handleColor: Colors.blueAccent,
            ),
          ),
          SizedBox(height: 20), // Spacer antara video dan judul/deskripsi
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              widget.materi!.judul_materi ?? '', // Tampilkan judul video
              // textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 25, fontWeight:FontWeight.bold),
            ),
          ),
          SizedBox(height: 10), // Spacer antara judul dan deskripsi
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              widget.materi!.deskripsi_materi ?? '', // Tampilkan deskripsi video
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
