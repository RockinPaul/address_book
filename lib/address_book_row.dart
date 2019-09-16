import 'package:flutter/material.dart';

class AddressBookRow extends StatelessWidget {
  final String contact;
  final Function onTap;

  AddressBookRow({Key key, this.contact, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(20, 15, 20, 0),
            height: 50,
            child: Text(contact),
          ),
          Divider(
            color: Colors.black,
            height: 1.0,
          ),
        ],
      ),
    );
  }
}
