import 'package:flutter/material.dart';
import 'package:target/app/core/ui/widget/policyprivaty.dart';
import '../core/ui/widget/text_field.dart';

class InformationPage extends StatefulWidget {
  @override
  _InformationPageState createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage> {
  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Metade Superior: Card Branco
          Container(
            height: MediaQuery.of(context).size.height * 0.5,
            child: Card(
              elevation: 5.0,
              margin: EdgeInsets.only(top: 64.0, right: 32.0, bottom: 32.0, left: 32.0),
              child: Center(
                child: Text(
                  'Conteúdo do Card',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
            ),
          ),
          // Metade Inferior: Campo de Texto
          Container(
            padding: EdgeInsets.all(16.0),
            child: TargetTextField(
              '', // Adicionado o rótulo (label)
              'Digite seu texto',
              controller: _textEditingController,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.done,
              focusNode: FocusNode(), // Adicionado um FocusNode vazio
              nextFocus: FocusNode(), // Deixe o próximo FocusNode como nulo se não for necessário
              validator: (value) {}, // Adicionado um validador vazio
            ),
          ),
          SizedBox(height: 128),
          PolicyPrivacy('https://www.google.com.br'),
        ],
      ),
    );
  }

  @override
  void dispose() {
    // Limpar o controlador quando o widget for destruído para evitar vazamentos de memória.
    _textEditingController.dispose();
    super.dispose();
  }
}