import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:target/app/controller.page/information_store.dart';
import 'package:target/app/core/ui/widget/button.dart';
import 'package:target/app/core/ui/widget/policyprivaty.dart';
import '../core/ui/widget/text_field.dart';



class InformationPage extends StatefulWidget {
  const InformationPage({Key? key}) : super(key: key);

  @override
  _InformationPageState createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage> {
  final InformationStore _informationStore = InformationStore(); // Crie uma instância da InformationStore

  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.5,
              child: Card(
                elevation: 5.0,
                margin: EdgeInsets.only(
                  top: 64.0,
                  right: 32.0,
                  bottom: 32.0,
                  left: 32.0,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Conteúdo do Card',
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                    Expanded(
                      child: Observer(
                        builder: (_) {
                          if (_informationStore.informationList.isEmpty) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          } else {
                            return ListView.builder(
                              itemCount: _informationStore.informationList.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  title: Text(_informationStore
                                      .informationList[index].information),
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                        icon: Icon(Icons.edit),
                                        onPressed: () {
                                          _showEditDialog(
                                            _informationStore
                                                .informationList[index].id,
                                            _informationStore
                                                .informationList[index]
                                                .information,
                                          );
                                          print('Editar item $index');
                                        },
                                      ),
                                      IconButton(
                                        icon: Icon(
                                          Icons.cancel,
                                          color: Colors.red,
                                        ),
                                        onPressed: () {
                                          _showDeleteDialog(
                                            _informationStore
                                                .informationList[index].id,
                                          );
                                          print('Excluir item $index');
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(16.0),
              child: TargetTextField(
                '',
                'Digite seu texto',
                controller: _textEditingController,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                focusNode: FocusNode(),
                nextFocus: FocusNode(),
                validator: (value) {},
                hintTextStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
                onFieldSubmitted: (String _textEditingController) async {
                  print('Texto digitado: $_textEditingController');
                  if (_textEditingController.isNotEmpty) {
                    await _informationStore
                        .saveOnSubmit(_textEditingController);
                    print('Método saveOnSubmit concluído');
                  }
                },
              ),
            ),
            SizedBox(height: 128),
            PolicyPrivacy('https://www.google.com.br'),
          ],
        ),
      ),
    );
  }

  void _showDeleteDialog(int informationId) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirmar exclusão'),
          content: Text('Tem certeza de que deseja excluir este item?'),
          actions: [
            TargetButton(
              label: 'Cancelar',
              onPressed: () async {
                await _informationStore.deleteInformation(informationId);
                Navigator.of(context).pop();
              },
              backgroundColor: Colors.white,
              textColor: Color(0xFF43bd6e),
            ),
            TargetButton(
              label: 'Excluir',
              onPressed: () async {
                await _informationStore.deleteInformation(informationId);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showEditDialog(int informationId, String existingInformation) {
    TextEditingController editController =
    TextEditingController(text: existingInformation);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Editar informação'),
          content: TextField(
            controller: editController,
            decoration: InputDecoration(labelText: 'Nova informação'),
          ),
          actions: [
            TargetButton(
              label: 'Cancelar',
              onPressed: () {
                Navigator.of(context).pop();
              },
              backgroundColor: Colors.white,
              textColor: Color(0xFF43bd6e),
            ),
            TargetButton(
              label: 'Salvar',
              onPressed: () async {
                await _informationStore.updateInformation(
                  informationId,
                  editController.text,
                );
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }
}