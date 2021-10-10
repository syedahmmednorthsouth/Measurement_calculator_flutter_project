import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Converter(),
    );
  }
}

class Converter extends StatefulWidget {
  const Converter({Key? key}) : super(key: key);

  @override
  _ConverterState createState() => _ConverterState();
}

class _ConverterState extends State<Converter> {
  double _numberForm = 0;
  late String _startMeasure = "meters" ;



  @override
  Widget build(BuildContext context) {
    final List<String> _measures = [
      'meters',
      'kilometers',
      'grams',
      'kilograms',
      'feet',
      'miles',
      'pounds (lbs)',
      'ounces',
    ];
    return MaterialApp(
      title: 'Measures Converter',
      home: Scaffold(
        appBar: AppBar(
          title: Text("Measures Converter"),
        ),
        body: Center(
          child:Column(
              children:[
                DropdownButton(
                  value: _startMeasure,

                  onChanged: (String? newValue) {
                     setState(() {
                       _startMeasure = newValue!;
                     });
                  },
                  items: _measures.map((String value) {
                      return DropdownMenuItem<String>(value: value, child:
                       Text(value),);
                     }).toList(),
                  ),
                TextField(
                  onChanged: (text){
                     var rv = double.tryParse(text);
                     if( rv != null){
                       setState(() {
                           _numberForm = rv;
                       });
                     }
                  },
                ),Text((_numberForm == null) ? '' : _numberForm.toString())
              ]
          ),
        ),
      ),
    );
  }



}


