import 'package:flutter/material.dart';
import 'pages/simple_change_notifierr_provider.dart';
import 'pages/simple_stream_builder/simple_stream_builder.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text("Class_Stream&Provider"),
        ),
        body: ListView(children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              _row(context, "Simple Change notifier provider",
                  ChangeNotifierrProvider()),
              _row(context, "Simple Stream builder",
                  SimpleStreamProvider()),
            ],
          ),
        ]));
  }

    Widget _row(BuildContext context, String text, Widget destination) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          FlatButton(
              onPressed: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => destination),
                    )
                  },
              child: Text(text)),
          SizedBox(height: 20.0)
        ]);
  }
}
