import 'package:examenia/models/CarteleraResponseModel.dart';
import 'package:examenia/provider/UsuarioProvider.dart';
import 'package:examenia/ui/Widgets/CardGrid.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BillboardView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final usuarioProvider = Provider.of<UsuarioProvider>(context);

    return FutureBuilder(
      future: usuarioProvider.getBillboard(),
      builder: (BuildContext context,
          AsyncSnapshot<CarteleraResponseModel> snapshot) {
        if (snapshot.hasData) {
          return Container(
            width: double.infinity,
            height: double.infinity,
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 0.6, crossAxisCount: 3),
                itemCount: snapshot.data.movies.length,
                itemBuilder: (BuildContext context, int index) {
                  return CardGrid(
                    movie: snapshot.data.movies[index],
                    // logo: snapshot.data.movies[index]
                    // onPress: () {},
                  );
                }),
          );
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
