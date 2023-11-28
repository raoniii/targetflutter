import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:target/app/core/ui/widget/button.dart';
import 'package:target/app/core/ui/widget/policyprivaty.dart';
import 'package:target/app/core/ui/widget/text_field.dart';
import 'package:target/app/page/infor_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController loginController = TextEditingController();
  TextEditingController senhaController = TextEditingController();

  FocusNode loginFocus = FocusNode();
  FocusNode senhaFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '                Usuário',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 40, right: 40),
                  child: TargetTextField(
                    '',
                    '',
                    controller: loginController,
                    validator: (value) {
                      return null;
                    },
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    focusNode: loginFocus,
                    nextFocus: senhaFocus,
                    prefixIcon: Icons.person,
                    iconColor: Colors.black,
                    height: 14,
                  ),
                ),
                SizedBox(height: 16),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '                Senha',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 40, right: 40),
                  child: TargetTextField(
                    '',
                    '',
                    password: true,
                    controller: senhaController,
                    validator: (value) {
                      return null;
                    },
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                    focusNode: senhaFocus,
                    nextFocus: FocusNode(),
                    prefixIcon: Icons.lock,
                    iconColor: Colors.black,
                    height: 14,
                  ),
                ),
                SizedBox(height: 24),
                TargetButton(
                  onPressed: () {
                    _validateAndNavigate();
                  },
                  label: 'Entrar',
                  height: 50,
                  width: 180,
                ),
                SizedBox(height: 16),
              ],
            ),
          ),
        ),
        Positioned.fill(
            bottom: 0,
            child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(40),
                  child: PolicyPrivacy(),
                ))),
      ],
    ));
  }

  void _validateAndNavigate() {
    if (loginController.text.trim().isEmpty ||
        senhaController.text.trim().isEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Campos vazios'),
            content: Text('Por favor, preencha ambos os campos.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
      return;
    }

    if (senhaController.text.length < 2 ||
        !RegExp(r'^[a-zA-Z0-9]+$').hasMatch(senhaController.text)) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Senha inválida'),
            content:
                Text('A senha deve ter pelo menos 2 caracteres alfanuméricos.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
      return;
    }
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => InformationPage()),
    );
  }
}
