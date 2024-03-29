import 'package:flutter/material.dart';
import 'package:address_book/address_book_row.dart';
import 'package:address_book/contact_info.dart';

class AddressBookSection extends StatelessWidget {
  final String title;
  final List<String> contacts;
  final double headerHeight;
  final double cellHeight;

  const AddressBookSection(
      {Key key,
      this.title,
      this.contacts,
      this.headerHeight = 40,
      this.cellHeight = 50})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          color: Colors.lightBlueAccent,
          padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
          width: BoxConstraints.expand().maxWidth,
          height: headerHeight,
          child: Text(
            title,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        ListView.builder(
          primary: false,
          shrinkWrap: true,
          itemCount: contacts.length,
          itemBuilder: (BuildContext context, int index) {
            String contact = contacts[index];
            return AddressBookRow(
                contact: contact,
                height: cellHeight,
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => ContactInfo(contact)),
                  );
                });
          },
        ),
      ],
    );
  }
}
