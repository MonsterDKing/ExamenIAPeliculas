import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
              child: Icon(
            Icons.people,
            size: 80,
          )),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Bienvenido"),
                Text("Nombre de usuario"),
                Text("Correo Electronico"),
                Text("Tarjeta")
              ],
            ),
          )
        ],
      ),
    );
  }
}
