import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:examenia/Screens/TapBarView.dart';
import 'package:examenia/models/LoginModel.dart';
import 'package:examenia/provider/LoginProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';

class LoginView extends StatelessWidget {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context);

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: FormBuilder(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _usernameField(context),
              _passwordField(context),
              _buttonSend(loginProvider, context)
            ],
          ),
        ),
      ),
    );
  }

  Widget _usernameField(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.5,
      child: FormBuilderTextField(
        name: 'username',
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Usuario',
        ),
        onChanged: (v) {},
        validator: FormBuilderValidators.compose([
          FormBuilderValidators.required(context,
              errorText: "Este campo es requerido"),
          FormBuilderValidators.email(context,
              errorText: "Este campo es un correo electronico")
        ]),
        keyboardType: TextInputType.emailAddress,
      ),
    );
  }

  Widget _passwordField(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.5,
      child: FormBuilderTextField(
        name: 'password',
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Contraseña',
        ),
        onChanged: (v) {},
        // valueTransformer: (text) => num.tryParse(text),
        validator: FormBuilderValidators.compose([
          FormBuilderValidators.required(context,
              errorText: "Este campo es requerido"),
        ]),
        keyboardType: TextInputType.text,
      ),
    );
  }

  Widget _buttonSend(LoginProvider loginProvider, BuildContext context) {
    return OutlineButton(
      borderSide: BorderSide(width: 1, color: Colors.grey),
      color: Colors.grey,
      onPressed: () async {
        _formKey.currentState.save();
        if (_formKey.currentState.validate()) {
          var resp = await loginProvider.login(LoginModel(
              _formKey.currentState.value["username"],
              _formKey.currentState.value["password"]));

          if (!resp) {
            return AwesomeDialog(
              context: context,
              dialogType: DialogType.ERROR,
              animType: AnimType.BOTTOMSLIDE,
              title: 'Error',
              desc: 'Usuario y/o contraseña incorrecta',
              btnOkOnPress: () {},
            )..show();
          }
          return AwesomeDialog(
            context: context,
            dialogType: DialogType.SUCCES,
            animType: AnimType.BOTTOMSLIDE,
            title: 'Bienvenido',
            desc: 'Tus datos son correctos',
            btnOkOnPress: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => TapBarView()),
              );
            },
          )..show();
        }
      },
      child: loginProvider.getLoading
          ? CircularProgressIndicator()
          : Text("Iniciar sesión"),
    );
  }
}
