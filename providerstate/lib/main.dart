import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerstate/providerstatee/numberlistprovider.dart';
import 'package:providerstate/setstate.dart';

void main() {
  runApp(
ChangeNotifierProvider(
  create: (context) => NumberListProvider(),
  child: MaterialApp(
    home: SetState1(),
  ),
)
  );
}
