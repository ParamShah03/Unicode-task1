import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  final String name,num,ini;
  const Details({Key? key, required this.name, required this.num, required this.ini,}) : super(key: key);

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title:  Text(widget.name,
          style: const TextStyle(
              fontSize: 25.0
          ),
        ),
        centerTitle: true,
        titleSpacing: 2.0,
        backgroundColor: Colors.indigo[700],
        toolbarHeight: 55.0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25.0),
            bottomRight: Radius.circular(25.0),
          ),
        ),
        actions: [
          IconButton(onPressed: (){},
              icon:const Icon(Icons.edit)),
          IconButton(onPressed: (){},
              icon:const Icon(Icons.star))
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          Center(
            child: CircleAvatar(
              backgroundColor: Colors.redAccent[700],
              radius: 70.0,
              child: Text(widget.ini,
                  style: const TextStyle(fontSize: 65.0,letterSpacing: 3.0)
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(widget.name,
              style: const TextStyle(fontSize: 40.0,letterSpacing: 2.0)
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Icon(Icons.call,size: 35),
                Icon(Icons.textsms,size: 35),
                Icon(Icons.video_call,size: 40),
              ],
            ),
          ),
          const SizedBox(height: 20),
          ListTile(
              title: Center(
                child: Text(widget.num,
                    style: const TextStyle(fontSize: 30.0)
                ),
              ),
              shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 3.0),
                  borderRadius: BorderRadius.circular(10)
              )
          )
        ],
      ),
    );
  }
}
