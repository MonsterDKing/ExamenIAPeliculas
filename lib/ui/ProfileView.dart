import 'package:examenia/models/UsuarioResponseModel.dart';
import 'package:examenia/provider/UsuarioProvider.dart';
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
                      CardFormWidget(formKey: _formKey),
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

class CardFormWidget extends StatelessWidget {
  const CardFormWidget({
    Key key,
    @required GlobalKey<FormBuilderState> formKey,
  })  : _formKey = formKey,
        super(key: key);

  final GlobalKey<FormBuilderState> _formKey;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 30),
      child: FormBuilder(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: FormBuilderTextField(
                name: 'tarjeta',
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Ingresa Tarjeta',
                ),
                onChanged: (v) {},
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(context,
                      errorText: "Este campo es requerido"),
                ]),
                keyboardType: TextInputType.number,
              ),
            ),
            OutlineButton(
              borderSide: BorderSide(width: 1, color: Colors.grey),
              color: Colors.grey,
              onPressed: () async {
                _formKey.currentState.save();
                if (_formKey.currentState.validate()) {
                  print("es valido");
                } else {
                  print("no valido");
                }
              },
              child: Text("Iniciar sesión"),
            )
          ],
        ),
      ),
    );
  }
}
