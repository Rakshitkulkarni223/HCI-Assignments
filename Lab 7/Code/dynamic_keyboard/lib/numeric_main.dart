import 'package:dynamic_keyboard/main.dart';
import 'package:flutter/material.dart';
import 'package:dynamic_keyboard/numeric_keyboard.dart';
import 'package:restart_app/restart_app.dart';

class NumericMain extends StatelessWidget {
  const NumericMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Numeric Keyboard',
      theme:
          ThemeData(primarySwatch: Colors.indigo),
      routes: <String, WidgetBuilder>{
        '/MyAlphaNumerickeyboard': (BuildContext context) => const MyApp(),
        '/MyNumericMain': (BuildContext context) => const NumericMain()
      },
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // text controller
  final TextEditingController _myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Numeric Keyboard"),
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
           Expanded(
              child: Container(height: 50.0),
            ),
          Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Row(
              children: [
                RaisedButton(
                  elevation: 10,
                    child: Text("AlphaNumeric Mode",style: TextStyle(fontSize: 15.0),),
                    color: Color.fromARGB(255, 93, 231, 208),
                    textColor: Colors.black,
                    onPressed: () => {
                          Navigator.of(context)
                              .pushReplacementNamed("/MyAlphaNumerickeyboard")
                        }),
                Padding(
                  
                    padding: const EdgeInsets.all(20.0),
                    child: RaisedButton(
                      elevation: 10,
                        child: const Text("Change Positions",style: TextStyle(fontSize: 15.0),),
                    color: Color.fromARGB(255, 221, 245, 117),
                    textColor: Colors.black,
                        onPressed: () => {
                              Navigator.of(context)
                                  .pushReplacementNamed("/MyNumericMain"),
                            })),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(20),
            child: SizedBox(
              height: 70,
              child: Center(
                  child: TextField(
                controller: _myController,
                textAlign: TextAlign.center,
                showCursor: false,
                style: const TextStyle(fontSize: 40),
                keyboardType: TextInputType.none,
              )),
            ),
          ),
          // implement the custom NumPad
          NumPad(
            buttonSize: 75,
            buttonColor: Color.fromARGB(255, 29, 33, 39),
            iconColor: Color.fromARGB(255, 91, 243, 116),
            controller: _myController,
            delete: () {
              _myController.text = _myController.text
                  .substring(0, _myController.text.length - 1);
            },
            // do something with the input numbers
            onSubmit: () {
              showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                        content: Text(
                          "Number : ${_myController.text}",
                          style: const TextStyle(fontSize: 20),
                        ),
                      ));
            },
          ),
        ],
      ),
    );
  }
}
