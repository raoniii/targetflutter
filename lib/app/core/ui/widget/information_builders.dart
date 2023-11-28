import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:target/app/controller.page/information_store.dart';

import 'button.dart';

class InformationListBuilder extends StatelessWidget {
  final InformationStore informationStore;

  const InformationListBuilder({required this.informationStore});

  @override
  Widget build(BuildContext context) {
    if (informationStore.informationList.isEmpty) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return ListView.builder(
        itemCount: informationStore.informationList.length * 2 - 1,
        itemBuilder: (context, index) {
          if (index.isOdd) {
            // Se índice ímpar, retorna uma linha separadora
            return Divider(
              indent: 10,
              endIndent: 10,
              color: Colors.grey,
              height: 1,
              thickness: 1,

            );
          } else {
            // Índice par, retorna o ListTile
            final itemIndex = index ~/ 2;
            return ListTile(
              title: Text(informationStore.informationList[itemIndex].information),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      _showEditDialog(
                        context,
                        informationStore.informationList[itemIndex].id,
                        informationStore.informationList[itemIndex].information,
                      );
                      print('Editar item $itemIndex');
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.cancel,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      _showDeleteDialog(
                        context,
                        informationStore.informationList[itemIndex].id,
                      );
                      print('Excluir item $itemIndex');
                    },
                  ),
                ],
              ),
            );
          }
        },
      );
    }
  }

  void _showDeleteDialog(BuildContext context, int informationId) {
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
                await informationStore.deleteInformation(informationId);
                Navigator.of(context).pop();
              },
              backgroundColor: Colors.white,
              textColor: Color(0xFF43bd6e),
            ),
            TargetButton(
              label: 'Excluir',
              onPressed: () async {
                await informationStore.deleteInformation(informationId);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showEditDialog(
      BuildContext context,
      int informationId,
      String existingInformation,
      ) {
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
                await informationStore.updateInformation(
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
}
