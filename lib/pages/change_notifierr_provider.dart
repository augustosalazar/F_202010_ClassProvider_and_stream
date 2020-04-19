import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChangeNotifierrProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Simple change notifier')),
        body: ChangeNotifierProvider<SingleModel>(
            //      <--- ChangeNotifierProvider
            create: (context) => SingleModel(value : 0),
            child: _buildUi()));
  }

  Widget _buildUi() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Consumer<SingleModel>(
            //                  <--- Consumer
            builder: (context, singleModel, child) {
              return _row(singleModel);
            },
          ),
          Consumer<SingleModel>(
            //                  <--- Consumer
            builder: (context, singleModel, child) {
              return FlatButton(
                  onPressed: () => changeData(singleModel),
                  child: Text("Press me!!"));
            },
          )
        ]);
  }

  Widget _row(SingleModel singleModel) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Expanded(
          child: Container(
            margin: const EdgeInsets.fromLTRB(8, 8, 8, 8),
            height: 40.0,
            color: singleModel.value == 0 ? Colors.blue : Colors.grey,
            child: Center(child: Text("C1")),
          ),
        ),
        Expanded(
          child: Container(
            margin: const EdgeInsets.fromLTRB(8, 8, 8, 8),
            height: 40.0,
            color: singleModel.value == 1 ? Colors.red : Colors.grey,
            child: Center(child: Text("C2")),
          ),
        ),
        Expanded(
          child: Container(
            margin: const EdgeInsets.fromLTRB(8, 8, 8, 8),
            height: 40.0,
            color: singleModel.value == 2 ? Colors.yellow : Colors.grey,
            child: Center(child: Text("C3")),
          ),
        ),
      ],
    );
  }

  void changeData(SingleModel singleModel) {
    int newValue = singleModel.value + 1;
    if (newValue == 3) {
      newValue = 0;
    }
    singleModel.changeValue(newValue);
  }
}

class SingleModel extends ChangeNotifier {
  int value;
  SingleModel({this.value});

  void changeValue(int v) {
    value = v;
    notifyListeners(); 
  }
}
