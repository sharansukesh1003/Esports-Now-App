import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
import 'package:esports_now/constants/constants.dart';

class VideoPlayer extends StatefulWidget {
  final VideoPlayerController videoPlayerController;

  VideoPlayer({@required this.videoPlayerController});

  @override
  _VideoPlayerState createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  ChewieController chewieController;

  @override
  void initState() {
    chewieController = ChewieController(
      videoPlayerController: widget.videoPlayerController,
      autoInitialize: true,
      aspectRatio: 16 / 9,
      errorBuilder: (context, errorMessage) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: Text(
              'Oops something went wrong',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        );
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    chewieController.dispose();
    chewieController.pause();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Chewie(controller: chewieController),
    );
  }
}

class VideoDisplay extends StatefulWidget {
  final String videoUrl;
  VideoDisplay({@required this.videoUrl});

  @override
  _VideoDisplayState createState() => _VideoDisplayState();
}

class _VideoDisplayState extends State<VideoDisplay> {
  final ConstantColors constantColors = ConstantColors();
  ChewieController chewieController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: constantColors.backGroundColor,
      appBar: AppBar(
        backgroundColor: constantColors.backGroundColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: constantColors.whiteColor,
            size: 25,
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'ESPORTS',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                  fontStyle: FontStyle.italic),
            ),
            Text('NOW',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 36,
                    fontStyle: FontStyle.italic,
                    color: constantColors.primaryColor)),
          ],
        ),
        actions: [
          Opacity(
            opacity: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Icon(Icons.preview),
            ),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text(
              'Video might take Little time to load',
              style: TextStyle(
                color: constantColors.whiteColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: VideoPlayer(
              videoPlayerController:
                  VideoPlayerController.network(widget.videoUrl),
            ),
          ),
        ],
      ),
    );
  }
}
