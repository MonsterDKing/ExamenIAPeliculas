import 'package:examenia/models/UsuarioResponseModel.dart';
import 'package:examenia/provider/UsuarioProvider.dart';
import 'package:examenia/ui/Forms/CardFormWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';

class ProfileView extends StatelessWidget {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    final usuarioProvider = Provider.of<UsuarioProvider>(context);
    return Container(
      width: double.infinity,
      child: FutureBuilder(
        future: usuarioProvider.getUserData(),
        builder: (BuildContext context,
            AsyncSnapshot<UsuarioResponseModel> snapshot) {
          if (snapshot.hasData) {
            return Column(
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
                      Text(
                          "${snapshot.data.firstName} ${snapshot.data.lastName}"),
                      Text("Correo Electronico"),
                      Text("${snapshot.data.email}"),
                      Text("Tarjeta"),
                      Text("${snapshot.data.cardNumber}"),
                      usuarioProvider.getCardCinepolis == null
                          ? CardFormWidget(formKey: _formKey)
                          : usuarioProvider.getLoadingCardInformation
                              ? Container(
                                  margin: EdgeInsets.symmetric(vertical: 30),
                                  child: Column(
                                    children: [
                                      Text(
                                          "Espere en lo que se solicita la informacion"),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      Container(
                                          child: Center(
                                              child:
                                                  CircularProgressIndicator()))
                                    ],
                                  ),
                                )
                              : usuarioProvider.getDataCardCinepolis == null
                                  ? Container(
                                      margin:
                                          EdgeInsets.symmetric(vertical: 30),
                                      child: Column(
                                        children: [
                                          Text(
                                              "Hubo un error al procesar su solicitud intentelo nuevamente"),
                                          SizedBox(
                                            height: 30,
                                          ),
                                          Container(
                                              child: Center(
                                                  child: OutlineButton(
                                            onPressed: () {
                                              usuarioProvider.setCardCinepolis =
                                                  null;
                                            },
                                            child: Text("Reintentar"),
                                          )))
                                        ],
                                      ),
                                    )
                                  : Container(
                                      child: Text(
                                          usuarioProvider.getDataCardCinepolis),
                                    )
                    ],
                  ),
                )
              ],
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
