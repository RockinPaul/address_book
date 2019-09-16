import 'package:flutter/material.dart';

class ContactInfo extends StatelessWidget {
  final String name;

  ContactInfo(this.name);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Center(
        child: Text(name),
      ),
    );
  }
}
