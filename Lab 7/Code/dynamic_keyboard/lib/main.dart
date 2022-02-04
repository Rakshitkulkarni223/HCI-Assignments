import 'package:dynamic_keyboard/numeric_main.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:virtual_keyboard_multi_language/virtual_keyboard_multi_language.dart';
import 'package:dynamic_keyboard/custom_layout.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AlphaNumeric Keyboard',
      routes: <String, WidgetBuilder>{
        '/MyNumerickeyboard': (BuildContext context) => const NumericMain(),
        '/MyHomePage': (BuildContext context) => const MyApp()
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: const MyHomePage(title: 'AlphaNumeric Keyboard'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Holds the text that user typed.
  String text = '';
  CustomLayoutKeys? _customLayoutKeys;
  // True if shift enabled.
  bool shiftEnabled = false;

  // is true will show the numeric keyboard.
  bool isNumericMode = false;

  late TextEditingController _controllerText;

  List Row1 = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '0'];

  List<List> groups = [
    ['a', 'i', 'z'],
    ['b', 'j', 'y'],
    ['c', 'k', 'x'],
    ['d', 'l', 'w'],
    ['e', 'm', 'v'],
    ['f', 'n', 'v'],
    ['g', 'o', 't'],
    ['h', 'p', 's'],
    ['r', 'q', '*']
  ];

  List rows(int rownumber) {
    List row = [];
    for (var i = 0; i < 9; i++) {
      row.add(groups[i][rownumber]);
    }
    return row;
  }

  void shufflegrps() {
    for (int i = 0; i < 9; i++) {
      groups[i].shuffle();
    }
  }

  @override
  void initState() {
    Row1.shuffle();
    shufflegrps();
    List Row2 = rows(0);
    List Row3 = rows(1);
    List Row4 = rows(2);
    Row2.add(VirtualKeyboardKeyAction.Backspace);
    Row3.add(VirtualKeyboardKeyAction.Return);
    Row4.add('/');
    _customLayoutKeys = CustomLayoutKeys(Row1, Row2, Row3, Row4);
    _controllerText = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          children: [
            Row(
              children: [
                Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: RaisedButton(
                        elevation: 10,
                        child: const Text(
                          "Numeric Mode",
                          style: TextStyle(fontSize: 15.0),
                        ),
                        color: Color.fromARGB(255, 99, 243, 131),
                        textColor: Colors.black,
                        onPressed: () => {
                              Navigator.of(context)
                                  .pushReplacementNamed("/MyNumerickeyboard"),
                            })),
                Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: RaisedButton(
                        elevation: 10,
                        child: const Text(
                          "Change Positions",
                          style: TextStyle(fontSize: 15.0),
                        ),
                        color: Color.fromARGB(255, 243, 84, 177),
                        textColor: Colors.black,
                        onPressed: () => {
                              Navigator.of(context)
                                  .pushReplacementNamed("/MyHomePage"),
                            })),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: SizedBox(
                  height: 70,
                  child: Center(
                      child: TextField(
                    controller: _controllerText,
                    maxLines: null,
                    showCursor: false,
                    style: const TextStyle(fontSize: 20),
                    keyboardType: TextInputType.none,
                    decoration: InputDecoration(
                        labelText: "Type",
                        hintText: "Type Anything...",
                        errorStyle: const TextStyle(
                            color: Colors.yellowAccent, fontSize: 15.0),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                  ))),
            ),
            Row(
              children: [
                Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: RaisedButton(
                        elevation: 10,
                        child: const Text(
                          "Clear Input",
                          style: TextStyle(fontSize: 20.0),
                        ),
                        color: Color.fromARGB(255, 236, 93, 93),
                        textColor: Colors.black,
                        onPressed: () => setState(() {
                              _controllerText.text = "";
                            }))),
                Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: RaisedButton(
                        elevation: 10,
                        child: const Text(
                          "Submit",
                          style: TextStyle(fontSize: 20.0),
                        ),
                        color: Color.fromARGB(255, 97, 247, 214),
                        textColor: Colors.black,
                        onPressed: ()  {
                              showDialog(
                                  context: context,
                                  builder: (_) => AlertDialog(
                                        content: Text(
                                          "Text : ${_controllerText.text}",
                                          style: const TextStyle(fontSize: 20),
                                        ),
                                      ));
                            }
                            )
                    )
                    ],
            ),
            Expanded(
              child: Container(height: 80.0),
            ),
            Container(
              color: Color.fromARGB(255, 20, 26, 26),
              child: VirtualKeyboard(
                  height: 300,
                  fontSize: 23.0,
                  textColor: Colors.white,
                  textController: _controllerText,
                  customLayoutKeys: _customLayoutKeys,
                  type: VirtualKeyboardType.Alphanumeric,
                  onKeyPress: _onKeyPress),
            )
          ],
        ),
      ),
    );
  }

  /// Fired when the virtual keyboard key is pressed.
  _onKeyPress(VirtualKeyboardKey key) {
    if (key.keyType == VirtualKeyboardKeyType.String) {
      text = text + (shiftEnabled ? key.capsText : key.text);
    } else if (key.keyType == VirtualKeyboardKeyType.Action) {
      switch (key.action) {
        case VirtualKeyboardKeyAction.Backspace:
          if (text.isEmpty) return;
          text = text.substring(0, text.length - 1);
          break;
        case VirtualKeyboardKeyAction.Return:
          text = text + '\n';
          break;
        case VirtualKeyboardKeyAction.Space:
          text = text + key.text;
          break;
        case VirtualKeyboardKeyAction.Shift:
          shiftEnabled = !shiftEnabled;
          break;
        default:
      }
    }
    // Update the screen
    setState(() {});
  }
}
