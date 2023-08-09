import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:number2words/number2word.dart';

final controllerText = TextEditingController(text: "0" );
final controllerText2 = TextEditingController(text: "" );

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(title: 'Flutter Convert your number to text'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, this.title}) : super(key: key);
  final String? title;

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title?? ""),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height * 0.5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Convert your number to text',
            ),
            TextField(
              onTap: (){
                controllerText.text= "";
                controllerText2.text= "";
              },
              keyboardType: TextInputType.number,
              controller: controllerText,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16,color: Colors.red),
            ),
            TextField(
              onTap: (){
                Clipboard.setData(ClipboardData(text: controllerText2.text));
                controllerText.text= "";
                controllerText2.text= "";
              },
              enabled: false,
              keyboardType: TextInputType.number, // Onl
              controller: controllerText2,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16,color: Colors.red),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          try {
            controllerText2.text = NumberToWord().convertToIndianStyle(int.parse(controllerText.text));
          } catch (exception) {
            controllerText2.text = "Invalid number";
          }
        },
        tooltip: 'Convert',
        child: const Icon(Icons.add),
      ),
    );
  }
}