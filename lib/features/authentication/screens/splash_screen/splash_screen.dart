import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_player/video_player.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();

    _initializeController();
    _playVideo();
  }

  Future<void> _initializeController() async {
    final videoFile = await _loadVideoFile();
    _controller = VideoPlayerController.file(videoFile);

    try {
      await _controller.initialize();
    } catch (error) {
      print('Error initializing video controller: $error');
    }

    if (mounted) {
      setState(() {});
    }

    _controller.setVolume(0.0);
  }

  Future<File> _loadVideoFile() async {
    // Load the video file using rootBundle
    final ByteData data = await rootBundle.load('assets/videos/DressME Up AI (1).mp4');
    final List<int> bytes = data.buffer.asUint8List();

    // Create a temporary file to hold the video data
    final tempFile = await File('${(await getTemporaryDirectory()).path}/video.mp4').create();

    // Write the video data to the temporary file
    await tempFile.writeAsBytes(bytes, flush: true);

    return tempFile;
  }

  void _playVideo() async {
    _controller.play();

    await Future.delayed(const Duration(seconds: 5));
    Navigator.pushNamed(context, '/');
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _controller.value.isInitialized
            ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              )
            : Container(),
      ),
    );
  }
}
