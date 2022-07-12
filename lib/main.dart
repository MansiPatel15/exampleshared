import 'package:flutter/material.dart';

import 'AddEmployee.dart';
import 'AddProduct.dart';
import 'AddStudent.dart';
import 'AdditionExample.dart';
import 'BankClone.dart';
import 'EnterPinBankClone.dart';
import 'ErrorPageBankClone.dart';
import 'HomeBankClone.dart';
import 'HomePage.dart';
import 'LoginPage.dart';
import 'LoginScreen1Example.dart';
import 'HomeScreenExample.dart';
import 'SharePreferencesExample.dart';
import 'SqfliteExample.dart';
import 'ViewStudent.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SqfliteExample(),
    );
  }
}


