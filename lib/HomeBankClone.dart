import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sharepreferencesexample/EnterPinBankClone.dart';

class HomeBankClone extends StatefulWidget {

  @override
  State<HomeBankClone> createState() => _HomeBankCloneState();
}

class _HomeBankCloneState extends State<HomeBankClone> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HomeBankCloneExample"),
      ),
      body: Center(
        child :Padding(
        padding: EdgeInsets.all(15),
        child :Container(
          child: Ink(
            decoration: ShapeDecoration(
              color: Colors.red,
              shape: CircleBorder(),
            ),
            child: IconButton(
              icon: Icon(
                  Icons.power_settings_new_outlined),iconSize: 50,
              color: Colors.white,
              onPressed: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
               // prefs.remove("islogin");

                Navigator.of(context).pop();
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context)=> EnterPinBankClone())
                );
                print("You Pressed The icon!");
              },
            ),
          ),
        )
        ),
        ),
    );
  }
}
