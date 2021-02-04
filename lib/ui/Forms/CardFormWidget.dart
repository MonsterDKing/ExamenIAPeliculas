import 'package:examenia/provider/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';

class CardFormWidget extends StatelessWidget {
  const CardFormWidget({
    Key key,
    @required GlobalKey<FormBuilderState> formKey,
  })  : _formKey = formKey,
        super(key: key);

  final GlobalKey<FormBuilderState> _formKey;

  @override
  Widget build(BuildContext context) {
    final usuarioProvider = Provider.of<UsuarioProvider>(context);

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
                name: 'card',
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Ingresa Tarjeta',
                ),
                onChanged: (v) {},
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(context,
                      errorText: "Este campo es requerido"),
                  FormBuilderValidators.min(context, 16,
                      errorText: "Este Campo requiere 16 digitos")
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
                  usuarioProvider.setCardCinepolis =
                      _formKey.currentState.value["card"];
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
