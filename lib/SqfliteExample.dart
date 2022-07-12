import 'package:flutter/material.dart';
import 'package:sharepreferencesexample/AddEmployee.dart';
import 'package:sharepreferencesexample/AddProduct.dart';
import 'package:sharepreferencesexample/AddStudent.dart';
import 'package:sharepreferencesexample/UpdateEmployee.dart';
import 'package:sharepreferencesexample/UpdateProduct.dart';
import 'package:sharepreferencesexample/UpdateStudent.dart';
import 'package:sharepreferencesexample/ViewEmployee.dart';
import 'package:sharepreferencesexample/ViewProduct.dart';
import 'package:sharepreferencesexample/ViewStudent.dart';

class SqfliteExample extends StatefulWidget {

  @override
  State<SqfliteExample> createState() => _SqfliteExampleState();
}

class _SqfliteExampleState extends State<SqfliteExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SqfliteExample"),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(icon: Icon(Icons.remove_red_eye_sharp,),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      body: Text("SqfliteExample",style: TextStyle(fontSize: 20),),
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
              leading: Icon(Icons.production_quantity_limits),
              title: Text("AddProduct"),
              trailing: Icon(Icons.arrow_right_alt),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context)=>AddProduct())
                );
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.production_quantity_limits_rounded),
              title: Text("ViewProduct"),
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
              leading: Icon(Icons.person),
              title: Text("UpdateProduct"),
              trailing: Icon(Icons.arrow_right_alt),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context)=>UpdateProduct())
                );
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.person_add),
              title: Text("AddEmployee"),
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
              leading: Icon(Icons.person),
              title: Text("ViewEmployee"),
              trailing: Icon(Icons.arrow_right_alt),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context)=>ViewEmployee())
                );
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("UpdateEmployee"),
              trailing: Icon(Icons.arrow_right_alt),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context)=>UpdateEmployee())
                );
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("AddStudent"),
              trailing: Icon(Icons.arrow_right_alt),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context)=>AddStudent())
                );
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("ViewStudent"),
              trailing: Icon(Icons.arrow_right_alt),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context)=>ViewStudent())
                );
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("UpdateStudent"),
              trailing: Icon(Icons.arrow_right_alt),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context)=>UpdateStudent())
                );
              },
            ),Divider(),


          ],
        ),
      ),
    );
  }
}
