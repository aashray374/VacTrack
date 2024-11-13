import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

class VideoScreen extends StatelessWidget {
  // List of direct video URLs. Replace these with actual .mp4 links if available.
  final List<String> videoUrls = [
    "https://youtu.be/aBIBsfrAnkI?si=SqksrgrVjutLQ71x",
    "https://youtu.be/XNGf-rm2t5Q?si=t-0YfkCgyCipU9kA",
    "https://youtu.be/OG8bU1OJlm8?si=emAjccY-hfmh1lcb",
    "https://youtu.be/aBIBsfrAnkI?si=SqksrgrVjutLQ71x",
    "https://youtu.be/XNGf-rm2t5Q?si=t-0YfkCgyCipU9k A",
    "https://youtu.be/OG8bU1OJlm8?si=emAjccY-hfmh1lcb",
  ];

  VideoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Vaccination Info Videos"),
        backgroundColor: Colors.purple,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: videoUrls.length,
        itemBuilder: (context, index) {
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)
            ),
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: InkWell(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => VideoPlayerScreen(videoUrl: videoUrls[index]),
                ),
              ),
              child: Column(
                children: [
                  Container(
                    height: 200,
                    color: Colors.grey[300],
                    child: Icon(
                      Icons.play_circle_outline,
                      color: Colors.purple,
                      size: 60,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Video ${index + 1}",
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class VideoPlayerScreen extends StatefulWidget {
  final String videoUrl;
  const VideoPlayerScreen({super.key, required this.videoUrl});

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController;

  @override
  void initState() {
    super.initState();
    _initializePlayer();
  }

  Future<void> _initializePlayer() async {
    _videoPlayerController = VideoPlayerController.network(widget.videoUrl);
    await _videoPlayerController.initialize();

    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoPlay: true,
      looping: false,
      fullScreenByDefault: true,
    );

    setState(() {});
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Playing Video"),
        backgroundColor: Colors.purple,
      ),
      body: Center(
        child: _chewieController != null &&
            _chewieController!.videoPlayerController.value.isInitialized
            ? Chewie(controller: _chewieController!)
            : const CircularProgressIndicator(),
      ),
    );
  }
}
