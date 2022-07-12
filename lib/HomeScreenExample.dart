import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'LoginScreen1Example.dart';

class HomeScreenExample extends StatefulWidget {

  @override
  _HomeScreenExampleState createState() => _HomeScreenExampleState();
}
class _HomeScreenExampleState extends State<HomeScreenExample> {

  var name="",mobile="",password="",email="";

  getdata() async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString("name");
      mobile = prefs.getString("mobile");
      password = prefs.getString("password");
      email = prefs.getString("email");
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Padding(
      padding: EdgeInsets.all(20.0),
      child:Column(
        children: [
          Text("Name : "+name,style: TextStyle(fontSize: 20),),
          Text("Mobile : "+mobile,style: TextStyle(fontSize: 20),),
          Text("Password : "+password,style: TextStyle(fontSize: 20),),
          Text("Email : "+email,style: TextStyle(fontSize: 20),),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () async{
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.remove("islogin");

                Navigator.of(context).pop();
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context)=> LoginScreen1Example())
                );
              },
              child: Text("LogOut",style: TextStyle(fontSize: 20),)
          ),
        ],
      ),
      ),
    );
  }
}
