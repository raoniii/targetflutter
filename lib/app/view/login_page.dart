import 'package:flutter/material.dart';
import 'package:target/app/core/ui/widget/button.dart';
import 'package:target/app/core/ui/widget/policyprivaty.dart';
import 'package:target/app/core/ui/widget/text_field.dart';

class LoginPage extends StatefulWidget {
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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Usuário',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              TargetTextField(
                '',
                '',
                controller: loginController,
                validator: (value) {},
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                focusNode: loginFocus,
                nextFocus: senhaFocus,
                prefixIcon: Icons.person,
              ),
              SizedBox(height: 16),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Senha',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              TargetTextField(
                '',
                '',
                password: true,
                controller: senhaController,
                validator: (value) {},
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                focusNode: senhaFocus,
                nextFocus: FocusNode(), // Não há próximo campo, então use FocusNode vazio
                prefixIcon: Icons.lock,
              ),
              SizedBox(height: 24),
              TestButton(
                onPressed: () {
                  _validateAndNavigate();
                },
                label: 'Entrar',
                height: 50,
                width: 180,
              ),
              SizedBox(height: 16),
              PolicyPrivacy('https://www.google.com.br'),
            ],
          ),
        ),
      ),
    );
  }

  void _validateAndNavigate() {
    if (loginController.text.trim().isEmpty || senhaController.text.trim().isEmpty) {
      // Campos vazios
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

    if (senhaController.text.length < 2 || !RegExp(r'^[a-zA-Z0-9]+$').hasMatch(senhaController.text)) {
      // Senha inválida
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Senha inválida'),
            content: Text('A senha deve ter pelo menos 2 caracteres alfanuméricos.'),
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

    // Navegar para a próxima tela
    // Implemente a navegação para a próxima tela aqui
  }
}
