import 'package:mobx/mobx.dart';
import 'package:target/app/database/controller/information_controller.dart';
import 'package:target/app/models/information_model.dart';

part 'information_store.g.dart';

class InformationStore = _InformationStore with _$InformationStore;

abstract class _InformationStore with Store {
  final InformationController _controller = InformationController();

  @observable
  ObservableList<Information> informationList = ObservableList<Information>();

  @action
  Future<void> fetchInformationList() async {
    informationList.clear();
    informationList.addAll(await _controller.listar());
  }

  @action
  Future<void> updateInformation(int informationId, String newInformation) async {
    await _controller.update(Information(informationId, newInformation));
    fetchInformationList();
  }

  @action
  Future<void> deleteInformation(int informationId) async {
    await _controller.delete(informationId);
    fetchInformationList();
  }

  @action
  Future<void> saveOnSubmit(String text) async {
    if (text.isNotEmpty) {
      await _controller.saveOnSubmit(text);
      fetchInformationList();
    }
  }
}