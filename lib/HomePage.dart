import 'package:flutter/material.dart';
import 'package:sharepreferencesexample/LoginPage.dart';

import 'AddEmployee.dart';
import 'AddProduct.dart';
import 'ViewEmployee.dart';
import 'ViewProduct.dart';

class HomePage extends StatefulWidget {

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HomePageExample"),
      ),
      body: Text("HomePage...",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),

      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                child: Text("M"),
              ),
              accountName: Text("Mansi Patel.."),
              accountEmail: Text("mansippatel.0105@gmail.com"),
            ),
            ListTile(
              leading: Icon(Icons.login_rounded),
              title: Text("Login"),
              trailing: Icon(Icons.arrow_right_alt),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context)=>LoginPage())
                );
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.app_registration_rounded),
              title: Text("Register"),
              trailing: Icon(Icons.arrow_right_alt),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context)=>ViewProduct())
                );
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.tag_faces_rounded),
              title: Text("About"),
              trailing: Icon(Icons.arrow_right_alt),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context)=>AddEmployee())
                );
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.contacts),
              title: Text("Contact"),
              trailing: Icon(Icons.arrow_right_alt),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context)=>ViewEmployee())
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
