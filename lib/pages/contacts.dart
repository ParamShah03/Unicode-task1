import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';
import 'contacts_details.dart';

void main()=>runApp(const MaterialApp(
  home: Contacts(),
));

class Contacts extends StatefulWidget {
  const Contacts({Key? key}) : super(key: key);

  @override
  State<Contacts> createState() => _ContactsState();
}
class _ContactsState extends State<Contacts> {
  List<Contact> contacts = [];

  @override
  void initState() {
    super.initState();
    getContacts();
  }

  getContacts() async{
    List<Contact> _contacts = (await ContactsService.getContacts(withThumbnails: false)).toList();
    setState(() {
      contacts = _contacts;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: const Text('My Contacts',
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
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: contacts.length,
                  itemBuilder: (context,index){
                    Contact contact =contacts[index];
                    return GestureDetector(
                      child: ListTile(
                        title: Text(contact.displayName!),
                        subtitle: Text(contact.phones!.elementAt(0).value!),
                        leading: CircleAvatar(
                          child: Text(contact.initials()),
                        ),
                        shape: RoundedRectangleBorder(
                            side: const BorderSide(width: 2.0),
                            borderRadius: BorderRadius.circular(30)
                        ),
                        onTap: (){
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context)=> Details(
                                  name: contact.displayName!,
                                  num: contact.phones!.elementAt(0).value!,
                                  ini: contact.initials()
                              )));
                        },
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>const SizedBox(height: 10.0)
              ),
            )
          ],
        ),
      ),
    );
  }
}
