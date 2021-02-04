import 'package:chewie/chewie.dart';
import 'package:examenia/config/AppConfig.dart';
import 'package:examenia/models/CarteleraResponseModel.dart';
import 'package:examenia/provider/index.dart';
import 'package:examenia/ui/Widgets/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_social_content_share/flutter_social_content_share.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

class MovieDetailView extends StatefulWidget {
  final Movie movie;

  const MovieDetailView({this.movie});

  @override
  _MovieDetailViewState createState() => _MovieDetailViewState();
}

class _MovieDetailViewState extends State<MovieDetailView> {
  VideoPlayerController _controller;
  ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    initializePlayer();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _chewieController.dispose();
  }

  Future<void> initializePlayer() async {
    _controller = VideoPlayerController.network(
        "${Appconfig.videoUrl}${widget.movie.media[2].resource}");
    await _controller.initialize();

    _chewieController = ChewieController(
        videoPlayerController: _controller,
        autoPlay: false,
        looping: true,
        fullScreenByDefault: false,
        showControls: true,
        aspectRatio: 16 / 9);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final tabBarProvider = Provider.of<TapBarProvider>(context);

    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: double.infinity,
        child: _chewieController != null &&
                _chewieController.videoPlayerController.value.initialized
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    height: 280,
                    child: Stack(
                      children: [
                        Chewie(
                          controller: _chewieController,
                        ),
                        Positioned(
                          top: 30,
                          child: IconButton(
                              icon: Icon(
                                Icons.share,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                // FlutterSocialContentShare.share(
                                //     type: ShareType.facebookWithoutImage,
                                //     url: "https://www.apple.com",
                                //     quote: "captions");
                              }),
                        )
                      ],
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.symmetric(vertical: 30),
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Nombre ${widget.movie.name}"),
                          Text("Clasificacion ${widget.movie.rating}"),
                          Text("Genero ${widget.movie.genre}"),
                          Text("Duracion ${widget.movie.length}"),
                          Text("Sinopsis ${widget.movie.synopsis}"),
                        ],
                      ))
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 20),
                  Text('Cargando'),
                ],
              ),
      ),
      bottomNavigationBar: TapBarWidget(tabBarProvider: tabBarProvider),
    );
  }
}
