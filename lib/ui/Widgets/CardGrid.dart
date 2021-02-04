import 'package:examenia/Screens/MovieDetailView.dart';
import 'package:examenia/config/AppConfig.dart';
import 'package:examenia/models/CarteleraResponseModel.dart';
import 'package:examenia/provider/TapBarProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CardGrid extends StatelessWidget {
  final Movie movie;

  CardGrid({@required this.movie});

  @override
  Widget build(BuildContext context) {
    final tabBarProvider = Provider.of<TapBarProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MovieDetailView(
                        movie: movie,
                      )),
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(movie.name),
              Container(
                width: double.infinity,
                height: 150,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          "${Appconfig.imageUrl}${movie.media[0].resource}"),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ],
          )),
    );
  }
}
