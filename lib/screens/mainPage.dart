import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MainPage extends StatefulWidget {
  @override
  MainPageState createState() {
    return MainPageState();
  }
}

class MainPageState extends State<MainPage> {
  static const platformMethodChannel =
      const MethodChannel('com.methodchannel/test');
  String nativeMessage = '';
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 18.0, top: 200.0),
            child: Text(
              'Hellö!',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 23.0),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 8.0, right: 8.0, top: 10.0),
            child: RaisedButton(
              child: Text('Click Here'),
              onPressed: () => greetings(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 10.0),
            child: Text(
              nativeMessage,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 23.0),
            ),
          )
        ],
      ),
    );
  }

  Future<Null> greetings() async {
    String _message;
    try {
      final String result =
          await platformMethodChannel.invokeMethod('greetings');
      _message = result;
      print(result);
    } on PlatformException catch (e) {
      _message = "Exception: ${e.message}.";
      print("e.message");
      print(e.message);
    }
    setState(() {
      nativeMessage = _message;
    });
  }
}
