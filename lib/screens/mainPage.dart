import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

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

  List<dynamic> phoneNumbersList = <dynamic>[];
  NewModel response = NewModel();

  Future<Null> greetings() async {
    NewModel _message;
    String text = "This will be a model.";
    int m = 3;

    try {
      var response = await platformMethodChannel
          .invokeMethod('getModel', {'title': 'ggg', 'id': 2});
      setState(() {
        _message = NewModel.fromJson(json.decode(response));
        print(_message.title);
      });
      print(response);
    } on PlatformException catch (e) {
      // _message = "Exception: ";
      print("e.message");
      print(e.message);
    }
    setState(() {
      nativeMessage = _message.title + " - ";
    });
  }
}

NewModel newModelFromJson(String str) => NewModel.fromJson(json.decode(str));

String newModelToJson(NewModel data) => json.encode(data.toJson());

class NewModel {
  NewModel({
    this.id,
    this.title,
  });

  int id;
  String title;

  factory NewModel.fromJson(Map<String, dynamic> json) => NewModel(
        id: json["id"] == null ? null : json["id"],
        title: json["title"] == null ? null : json["title"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "title": title == null ? null : title,
      };
}
