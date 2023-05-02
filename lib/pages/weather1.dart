import 'package:app/pages/weather.dart';
import 'package:flutter/material.dart';

void main()=>runApp(const MaterialApp(
  home: Weather1(),

));

class Weather1 extends StatefulWidget {
  const Weather1({Key? key}) : super(key: key);

  @override
  State<Weather1> createState() => _Weather1State();
}

class _Weather1State extends State<Weather1> {
  final TextEditingController _textController= TextEditingController();
  String place='';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: const Text('Weather',
          style: TextStyle(
              fontSize: 25.0
          ),
        ),
        centerTitle: true,
        titleSpacing: 2.0,
        backgroundColor: Colors.indigo[700],
        toolbarHeight: 55.0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: _textController,
            decoration:  InputDecoration(
                hintText: 'Enter City',
                labelText: 'City',
                labelStyle: const TextStyle(
                    fontSize: 30.0,
                    color: Colors.black
                ),
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                    onPressed: (){
                      _textController.clear();
                    },
                    icon:const Icon(Icons.clear)
                )
            ),
          ),
          const SizedBox(height: 20.0),
          ElevatedButton(
              onPressed: (){
                place=_textController.text;
                Navigator.push(context,
                    MaterialPageRoute(builder: (context)=>Weather(place:place)));
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo
              ),
              child: const Text('Enter',
                style: TextStyle(
                    fontSize: 15.0
                ),
              )
          )
        ],
      ),
    );
  }
}
