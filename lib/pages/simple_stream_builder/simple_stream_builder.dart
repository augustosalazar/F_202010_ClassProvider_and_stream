import 'package:flutter/material.dart';

import 'single_model.dart';
import 'stream_state_handler.dart';

class SimpleStreamProvider extends StatefulWidget {
  @override
  _SimpleStreamProviderState createState() => _SimpleStreamProviderState();
}

class _SimpleStreamProviderState extends State<SimpleStreamProvider> {
  final StreamStateHandler myStreamProvider = StreamStateHandler();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Simple Stream Builder"),
      ),
      body: _getBuilder(),
    );
  }

  Widget _getBuilder() {
    return StreamBuilder(
      stream: myStreamProvider.myModels,
      initialData: new SingleModel(value: 0),
      builder: (BuildContext context, AsyncSnapshot<SingleModel> snapshot) {
        SingleModel currentValue = snapshot.data;
        return _buildUi(currentValue);
      },
    );
  }

  Widget _buildUi(SingleModel currentValue) {
    print(currentValue.value);
    return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Expanded(
                child: Container(
                  margin: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                  height: 40.0,

                  color: currentValue.value == 0 ? Colors.blue : Colors.grey,
                  child: Center(child: Text("C1")),
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                  height: 40.0,
                  color: currentValue.value == 1 ? Colors.red : Colors.grey,
                  child: Center(child: Text("C2")),
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                  height: 40.0,
                  color: currentValue.value == 2 ? Colors.yellow : Colors.grey,
                  child: Center(child: Text("C3")),
                ),
              ),
            ],
          ),
          FlatButton(
              onPressed: () => changeData(currentValue),
              child: Text("Press me!!"))
        ]);
  }

  void changeData(SingleModel currentValue) {
    int newValue = currentValue.value + 1;
    if (newValue == 3) {
      newValue = 0;
    }
    currentValue.value = newValue;
    myStreamProvider.changeValue(currentValue);
  }
}
