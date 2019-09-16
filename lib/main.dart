import 'package:flutter/material.dart';
import 'package:address_book/address_book.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    List<String> contacts = [
      'Adi Shamir',
      'Alan Kay',
      'Andrew Yao',
      'Barbara Liskov',
      'Kristen Nygaard',
      'Leonard Adleman',
      'Leslie Lamport',
      'Ole-Johan Dahl',
      'Peter Naur',
      'Robert E. Kahn',
      'Ronald L. Rivest',
      'Vinton G. Cerf',
    ];
    contacts.sort((a, b) => a.toLowerCase().compareTo(b.toLowerCase()));
    Map<String, List<String>> groupedContacts = Map<String, List<String>>();
    contacts.forEach((name) {
      String firstChar = name.substring(0, 1);
      if (!groupedContacts.keys.contains(firstChar)) {
        groupedContacts[firstChar] = contacts.where((contact) => contact.startsWith(firstChar)).toList();
      }
    });

    print(groupedContacts);

    return MaterialApp(
      home: AddressBook(
        contacts: groupedContacts,
      ), //MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
