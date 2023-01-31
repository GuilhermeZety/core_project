import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

/// Stateful widget to fetch and then display video content.
/// 
/// 
/// 


class VideoPlayer extends StatefulWidget {
  const VideoPlayer({super.key, required this.url});

  final String url;

  @override
  State<VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  late YoutubePlayerController _controller;

   @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(widget.url)!,
        flags: YoutubePlayerFlags(
            autoPlay: true
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
    return YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
        onReady: () {
            _controller.addListener(() => setState(() {
              
            }));
        },
    );
  }
}
