import 'dart:async';

import 'single_model.dart';

class StreamStateHandler {
  SingleModel data = new SingleModel(value: 0);
  final _myModelController = StreamController<SingleModel>.broadcast();

  get myModels => _myModelController.stream;

  StreamStateHandler() {
    getMyModels();
  }

  getMyModels({String query}) async {
    _myModelController.add(data);
  }

  changeValue(SingleModel newValue)  {
    data = newValue;
    getMyModels();
  }


}