// import 'package:flutter/material.dart';
// import '../video_player_widget.dart';
// import 'package:video_player/video_player.dart';

// class AssetPlayerWidget extends StatefulWidget {
//   @override
//   _AssetPlayerWidgetState createState() => _AssetPlayerWidgetState();
// }

// class _AssetPlayerWidgetState extends State<AssetPlayerWidget> {
//   final asset = 'assets/video.mp4';
//   late VideoPlayerController controller;

//   @override
//   void initState() {
//     super.initState();
//     controller = VideoPlayerController.asset(asset)
//       ..addListener(() => setState(() {}))
//       ..setLooping(true)
//       ..initialize().then((_) => controller.play());
//   }

//   @override
//   void dispose() {
//     controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final isMuted = controller.value.volume == 0;
//     return Column(
//       children: [
//         VideoPlayerWidget(controller: controller),
//         const SizedBox(height: 32),
//         // ignore: unrelated_type_equality_checks
//         if (controller != controller.value.isInitialized)
//           CircleAvatar(
//             radius: 30,
//             backgroundColor: Colors.red,
//             child: IconButton(
//               icon: Icon(
//                 isMuted ? Icons.volume_mute : Icons.volume_up,
//                 color: Colors.white,
//               ),
//               onPressed: () => controller.setVolume(isMuted ? 0 : 1),
//             ),
//           )
//       ],
//     );
//   }
// }

// ignore_for_file: prefer_const_constructors

import 'package:cinema_g/screens/home_screen.dart';
import 'package:cinema_g/screens/nav_screen.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class AssetPlayerWidget extends StatefulWidget {
  AssetPlayerWidget() : super();

  final String title = "Quragnaye";

  @override
  AssetPlayerWidgetState createState() => AssetPlayerWidgetState();
}

class AssetPlayerWidgetState extends State<AssetPlayerWidget> {
  //
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    // _controller = VideoPlayerController.network(
    //   "https://www.youtube.com/watch?v=4PurPz918qo"
    //     "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4");
    _controller = VideoPlayerController.asset("assets/video.mp4");
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);
    _controller.setVolume(1.0);
    _controller.play();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final value = await showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Alert'),
                content: Text('Do you want to Exit'),
                actions: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.redAccent,
                      onPrimary: Colors.white,
                      elevation: 20.0,
                    ),
                    onPressed: () => Navigator.of(context).pop(false),
                    child: Text('No'),
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.redAccent,
                        onPrimary: Colors.white,
                        elevation: 20.0,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop(true);
                        // Navigator.pop(
                        //                   context,
                        //                   MaterialPageRoute(
                        //                       builder: (context) =>
                        //                           HomeScreen()),
                        //                 );
                      },
                      child: Text('Exit')),
                ],
              );
            });
        if (value != null) {
          return Future.value(value);
        } else {
          return Future.value(false);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("ቁራኛዬ"),
          backgroundColor: Colors.redAccent,
        ),
        body: FutureBuilder(
          future: _initializeVideoPlayerFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Center(
                child: AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                ),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.redAccent,
          onPressed: () {
            setState(() {
              if (_controller.value.isPlaying) {
                _controller.pause();
              } else {
                _controller.play();
              }
            });
          },
          child: Icon(
              _controller.value.isPlaying ? Icons.pause : Icons.play_arrow),
        ),
      ),
    );
  }
}
