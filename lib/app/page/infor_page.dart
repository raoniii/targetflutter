import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:target/app/controller.page/information_store.dart';
import 'package:target/app/core/ui/theme/themeconfig.dart';

import 'package:target/app/core/ui/widget/policyprivaty.dart';
import '../core/ui/widget/information_builders.dart';
import '../core/ui/widget/text_field.dart';

class InformationPage extends StatefulWidget {
  const InformationPage({Key? key}) : super(key: key);

  @override
  _InformationPageState createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage> {
  final InformationStore _informationStore = InformationStore();
  TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _informationStore.fetchInformationList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ThemeConfig.getGradientBackground(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 128),
              buildInformationCard(),
              buildTextField(),
              SizedBox(height: 180),
              PolicyPrivacy(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildInformationCard() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      height: MediaQuery.of(context).size.height * 0.5,
      child: Card(
        elevation: 5.0,
        margin: EdgeInsets.symmetric(
          vertical: 32.0,
          horizontal: 32.0,
        ),
        child: Column(
          children: [
            Expanded(
              child: Observer(
                builder: (_) {
                  return InformationListBuilder(
                    informationStore: _informationStore,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: TargetTextField(
        '',
        'Digite seu texto',
        controller: _textEditingController,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.done,
        focusNode: FocusNode(),
        nextFocus: FocusNode(),
        validator: (value) {},
        contentPadding: EdgeInsetsDirectional.only(start: 20),
        hintTextStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.grey,
        ),
        onFieldSubmitted: (String _textEditingController) async {
          print('Texto digitado: $_textEditingController');
          if (_textEditingController.isNotEmpty) {
            await _informationStore.saveOnSubmit(_textEditingController);
            print('Método saveOnSubmit concluído');
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }
}
