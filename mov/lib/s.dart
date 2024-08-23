import 'dart:convert';

import 'package:flutter/material.dart';

class SecndPage extends StatefulWidget {
  const SecndPage({super.key});

  @override
  State<SecndPage> createState() => _SecndPageState();
}

class _SecndPageState extends State<SecndPage> {
  @override
  Widget build(BuildContext context) {
    final Map<dynamic , dynamic> msg=jsonDecode(ModalRoute.of(context)?.settings.arguments as String);
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: Column(
              children: [
                Text(msg["name"])
              ],
            ),
          ),
      ),
    );
  }
}