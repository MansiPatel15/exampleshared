import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  GlobalKey<FormState> _form = GlobalKey<FormState>();
  TextEditingController _mobile = TextEditingController();
  TextEditingController _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LoginPageExample"),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(15),
        child :Form(
          key: _form,
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("MobileNumber : ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _mobile,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(border: OutlineInputBorder(),hintText: 'Enter a MobileNumber'),
            ),
            SizedBox(
              height: 20,
            ),
            Text("Password : ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _password,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(border: OutlineInputBorder(),hintText: 'Enter a Password'),
              obscureText: true,
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: () async {
                    if(_form.currentState.validate())
                      {
                        var mobile = _mobile.text.toString();
                        var pass = _password.text.toString();

                        SharedPreferences prefs = await SharedPreferences.getInstance();
                        prefs.setString("Mobile", mobile);
                        prefs.setString("Password", pass);
                      }

                  },
                  child: Text("Login"),
                ),
              ),
            )
          ],
        ),
        ),
      ),
    ),
    );
  }
}
