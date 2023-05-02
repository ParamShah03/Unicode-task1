import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(const MaterialApp(
  home: Profile(),
));

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final TextEditingController _name= TextEditingController();
  final TextEditingController _date= TextEditingController();
  final TextEditingController _number= TextEditingController();
  final TextEditingController _mail= TextEditingController();

  void saveText() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("name", _name.text);
    pref.setString("date", _date.text);
    pref.setString("number", _number.text);
    pref.setString("mail", _mail.text);
  }

  void readText() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? name = pref.getString("name");
    String? date = pref.getString("date");
    String? number = pref.getString("number");
    String? mail = pref.getString("mail");
    if(name!=null && date!=null && number!=null && mail !=null){
      _name.text= name;
      _date.text= date;
      _number.text= number;
      _mail.text= mail;
    }
  }

  @override
  void initState(){
    super.initState();
    readText();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          elevation: 0.0,
          title: const Text('Profile',
            style: TextStyle(
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
        ),
        body: SingleChildScrollView(
          child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Center(
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/ID.jpg'),
                      radius: 60.0,
                    ),
                  ),
                ),
                const Divider(
                    height: 10.0,
                    color: Colors.black
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    controller: _name,
                    decoration:  InputDecoration(
                        hintText: 'Enter your name',
                        labelText: 'Full Name',
                        labelStyle: const TextStyle(
                            fontSize: 20.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1.0
                        ),
                        prefixIcon: const Icon(Icons.person),
                        border: const UnderlineInputBorder(),
                        suffixIcon: IconButton(
                            onPressed: (){
                              _name.clear();
                            },
                            icon:const Icon(Icons.clear)
                        )
                    ),
                    onChanged: (name)=> setState(() {saveText();}),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    controller: _date,
                    decoration:  InputDecoration(
                        hintText: 'DD/MM/YYYY',
                        labelText: 'Birth Date',
                        labelStyle: const TextStyle(
                            fontSize: 20.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1.0
                        ),
                        prefixIcon: const Icon(Icons.calendar_month_outlined),
                        border: const UnderlineInputBorder(),
                        suffixIcon: IconButton(
                            onPressed: (){
                              _date.clear();
                            },
                            icon:const Icon(Icons.clear)
                        )
                    ),
                    onChanged: (date)=> setState(() {saveText();}),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    controller: _number,
                    decoration:  InputDecoration(
                        hintText: '+91',
                        labelText: 'Phone Number',
                        labelStyle: const TextStyle(
                            fontSize: 20.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1.0
                        ),
                        prefixIcon: const Icon(Icons.phone),
                        border: const UnderlineInputBorder(),
                        suffixIcon: IconButton(
                            onPressed: (){
                              _number.clear();
                            },
                            icon:const Icon(Icons.clear)
                        )
                    ),
                    onChanged: (number)=> setState(() {saveText();}),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    controller: _mail,
                    decoration:  InputDecoration(
                        hintText: 'Enter your mail id',
                        labelText: 'Email',
                        labelStyle: const TextStyle(
                            fontSize: 20.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1.0
                        ),
                        prefixIcon: const Icon(Icons.mail),
                        border: const UnderlineInputBorder(),
                        suffixIcon: IconButton(
                            onPressed: (){
                              _mail.clear();
                            },
                            icon:const Icon(Icons.clear)
                        )
                    ),
                    onChanged: (mail)=> setState(() {saveText();}),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                        onPressed: (){
                          _name.clear();
                          _date.clear();
                          _number.clear();
                          _mail.clear();
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red
                        ),
                        child: const Text(
                          'Clear',
                          style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),
                        )
                    ),
                    ElevatedButton(
                        onPressed: () async{
                          saveText();
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green[600]
                        ),
                        child: const Text(
                          'Save',
                          style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),
                        )
                    )
                  ],
                )
              ]
          ),
        )
    );
  }
}

