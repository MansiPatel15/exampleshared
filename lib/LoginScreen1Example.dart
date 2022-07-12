import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sharepreferencesexample/HomeScreenExample.dart';
import 'package:sharepreferencesexample/RegisterScreenExample.dart';

class LoginScreen1Example extends StatefulWidget {

  @override
  _LoginScreen1ExampleState createState() => _LoginScreen1ExampleState();
}

class _LoginScreen1ExampleState extends State<LoginScreen1Example> {

  TextEditingController _mobile =TextEditingController();
  TextEditingController _password =TextEditingController();

  checklogin() async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs.containsKey("islogin"))
      {
        Navigator.of(context).pop();
        Navigator.of(context).push(
            MaterialPageRoute(
                builder: (context) => HomeScreenExample())
        );
      }
  }
  //Page Load
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checklogin();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Padding(
        padding:  EdgeInsets.all(25.0),
        child : Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Enter Your MobileNumber : ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: _mobile,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(border: OutlineInputBorder(),hintText: 'Enter the mobilenumber'),
            ),
            SizedBox(
              height: 20,
            ),
            Text("Enter Your Password : ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: _password,
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              decoration: InputDecoration(border: OutlineInputBorder(),hintText: 'Enter the password'),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
            child :Column(
              children :[
              ElevatedButton(
                onPressed: () async {
                  var mobile = _mobile.text.toString();
                  var password = _password.text.toString();

                  var s_mobile="";
                  var s_password="";

                  SharedPreferences prefs = await SharedPreferences.getInstance();

                  if(prefs.containsKey("mobile") && prefs.containsKey("password"))
                    {
                      s_mobile = prefs.getString("mobile");
                      s_password = prefs.getString("password");
                    }

                  if(mobile=="" && password=="")
                  {
                    Fluttertoast.showToast(
                        msg: "Please enter Mobile Number or Password",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0
                    );
                  }
                   else if(mobile==s_mobile && password==s_password)
                   {
                    SharedPreferences prefs = await SharedPreferences.getInstance();
                    prefs.setString("islogin","yes");

                    Navigator.of(context).pop();
                    Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => HomeScreenExample())
                    );
                  }
                  else
                  {
                    Fluttertoast.showToast(
                        msg: "Invalid Mobile Number and Password",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0
                    );
                  }
                },
                child: Text("Login",style: TextStyle(fontSize: 20),),
              ) ,
                TextButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.all(16.0),
                    primary: Colors.blue,
                    textStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context)=> RegisterScreenExample())
                    );
                  },
                  child: Text('Create New Account'),
                ),
              ],
            ),
            ),
          ],
        ),
      ),
    );
  }
}
