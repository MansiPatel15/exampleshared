import 'package:flutter/material.dart';

class ErrorPageBankClone extends StatefulWidget {

  @override
  State<ErrorPageBankClone> createState() => _ErrorPageBankCloneState();
}

class _ErrorPageBankCloneState extends State<ErrorPageBankClone> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ErrorPageBankCloneExample"),
      ),
      body: Center(
        child: Text("Invalid PIN....Please Uninstall the app",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
      ),
    );
  }
}
