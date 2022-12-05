import 'package:flutter/material.dart';
import 'package:flutter_chatapp/widgets/blue_button.dart';

import '../widgets/custom_input.dart';
import '../widgets/labels.dart';
import '../widgets/logo.dart';
import '../widgets/terms_conditions.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffF2F2F2),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Logo(titulo: 'Messenger'),
                _Form(),
                Labels(
                  titulo: '¿No tienes una cuenta?',
                  subtitulo: '¡Crear una ahora!',
                  ruta: 'register',
                ),
                TermsAndConditions(),
              ],
            ),
          ),
        ));
  }
}

class _Form extends StatefulWidget {
  @override
  State<_Form> createState() => __FormState();
}

class __FormState extends State<_Form> {
  final emailCtrl = TextEditingController();
  final psswdCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40),
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        children: [
          CustomInput(
            icon: Icons.alternate_email_rounded,
            placeholder: 'Email',
            textController: emailCtrl,
            keyboardType: TextInputType.emailAddress,
          ),
          CustomInput(
            icon: Icons.lock_outline_rounded,
            placeholder: 'Password',
            textController: psswdCtrl,
            keyboardType: TextInputType.visiblePassword,
            isPassword: true,
          ),
          SizedBox(
            height: 20,
          ),
          // TODO: CREAR BOTON DE LOGIN
          BlueButton(
            text: 'Ingrese',
            onPressed: () {
              print('valores');
            },
          )
        ],
      ),
    );
  }
}
