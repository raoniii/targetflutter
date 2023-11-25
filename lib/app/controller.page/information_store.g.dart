// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'information_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$InformationStore on _InformationStore, Store {
  late final _$informationListAtom =
      Atom(name: '_InformationStore.informationList', context: context);

  @override
  ObservableList<Information> get informationList {
    _$informationListAtom.reportRead();
    return super.informationList;
  }

  @override
  set informationList(ObservableList<Information> value) {
    _$informationListAtom.reportWrite(value, super.informationList, () {
      super.informationList = value;
    });
  }

  late final _$fetchInformationListAsyncAction =
      AsyncAction('_InformationStore.fetchInformationList', context: context);

  @override
  Future<void> fetchInformationList() {
    return _$fetchInformationListAsyncAction
        .run(() => super.fetchInformationList());
  }

  late final _$updateInformationAsyncAction =
      AsyncAction('_InformationStore.updateInformation', context: context);

  @override
  Future<void> updateInformation(int informationId, String newInformation) {
    return _$updateInformationAsyncAction
        .run(() => super.updateInformation(informationId, newInformation));
  }

  late final _$deleteInformationAsyncAction =
      AsyncAction('_InformationStore.deleteInformation', context: context);

  @override
  Future<void> deleteInformation(int informationId) {
    return _$deleteInformationAsyncAction
        .run(() => super.deleteInformation(informationId));
  }

  @override
  String toString() {
    return '''
informationList: ${informationList}
    ''';
  }
}
