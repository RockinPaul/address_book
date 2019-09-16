import 'package:flutter/material.dart';
import 'package:address_book/address_book_section.dart';
import 'package:address_book/search.dart';

const double CELL_HEIGHT = 50.0;
const double HEADER_HEIGHT = 40.0;

class AddressBook extends StatefulWidget {
  final Map<String, List<String>> contacts;
  final String sectionToGo;

  const AddressBook({Key key, this.contacts, this.sectionToGo})
      : super(key: key);

  @override
  _AddressBookState createState() => _AddressBookState();
}

class _AddressBookState extends State<AddressBook> {
  @override
  Widget build(BuildContext context) {
    List<String> _keys = widget.contacts.keys.toList();
    List<List<String>> _values = widget.contacts.values.toList();

    // Compose offsets for scrolling API
    Map<String, double> offsets = Map<String, double>();
    int values = 0;
    double offset = 0.0;
    for (int i = 0; i < _keys.length; i++) {
      offsets[_keys[i]] = offset;
      String key = _keys[i];
      values = widget.contacts[key].length;
      offset += values * CELL_HEIGHT + HEADER_HEIGHT;
    }

    ScrollController _scrollController = new ScrollController();

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _scrollController.animateTo(
            offsets[widget.sectionToGo.toUpperCase()],
            curve: Curves.easeOut,
            duration: const Duration(milliseconds: 300),
          );
        },
        child: Icon(Icons.arrow_upward),
      ),
      appBar: AppBar(
        title: Text('Contacts'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: Search(widget.contacts),
              );
            },
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            child: Text("The ability to show widgets on top"),
          ),
          Expanded(
            child: ListView.builder(
                controller: _scrollController,
                shrinkWrap: true,
                itemCount: widget.contacts.length,
                itemBuilder: (BuildContext context, int index) {
                  return AddressBookSection(
                      title: _keys[index], contacts: _values[index]);
                }),
          ),
          Container(
            child: Text("The ability to show widgets below the list"),
          ),
        ],
      ),
    );
  }
}
