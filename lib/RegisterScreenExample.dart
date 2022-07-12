import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sharepreferencesexample/HomeScreenExample.dart';
import 'package:sharepreferencesexample/LoginScreen1Example.dart';

class RegisterScreenExample extends StatefulWidget {

  @override
  _RegisterScreenExampleState createState() => _RegisterScreenExampleState();
}

class _RegisterScreenExampleState extends State<RegisterScreenExample> {
  var formkey = GlobalKey<FormState>();
  TextEditingController _name = TextEditingController();
  TextEditingController _mobile = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("RegisterScreen"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.all(20.0),
          child : Form(
            key: formkey,
          child :Column(
            crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Name : ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _name,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(border: OutlineInputBorder(),
                hintText: 'Enter the Name',
                isDense: true,
              ),
              validator: (val)
              {
                if(val.length<=0)
                  {
                    return "Please Enter Name";
                  }
                return null;
              },
            ),
            SizedBox(
              height: 20,
            ),
            Text("MobileNumber : ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _mobile,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(border: OutlineInputBorder(),
                  hintText: 'Enter the MobileNumber',
                isDense: true,
              ),
              validator: (val)
              {
                if(val.length<=0)
                  {
                    return "Plaese Enter MobileNumber";
                  }
                else if(val.length!=10)
                  {
                    return "Please Enter Valid MobileNumber";
                  }
                return null;
              },
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
              obscureText: true,
              decoration: InputDecoration(border: OutlineInputBorder(),
                  hintText: 'Enter the password',
                isDense: true,
              ),
              validator: (val)
              {
                if(val.isEmpty)
                  {
                    return "Please Enter Password";
                  }
                else if(val.length<=6)
                  {
                    return "Please Enter Min 6 Character";
                  }
                return null;
              },
            ),
            SizedBox(
              height: 20,
            ),
            Text("EmailAddress : ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _email,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(border: OutlineInputBorder(),
                  hintText: 'Enter the EmailAddress',
                isDense: true,
              ),
              validator: (val){
                if(val.isEmpty)
                {
                  return 'Please a Enter EmailAddress';
                }
                else if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(val))
                {
                  return 'Please  Enter a valid EmailAddress';
                }
                return null;
              },
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: ElevatedButton(
                onPressed: ()async{
                  if(formkey.currentState.validate())
                  {
                    var name =_name.text.toString();
                    var mobile =_mobile.text.toString();
                    var password =_password.text.toString();
                    var email =_email.text.toString();

                    print("Name : "+name);
                    print("MobileNumber : "+mobile);
                    print("Password : "+password);
                    print("EmailAddress : "+email);

                    SharedPreferences prefs = await SharedPreferences.getInstance();
                    prefs.setString("name",name);
                    prefs.setString("mobile",mobile);
                    prefs.setString("password",password);
                    prefs.setString("email",email);

                    print("value stored");
                    Navigator.of(context).pop();
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context)=> LoginScreen1Example())
                    );
                  }
                },
                child: Text("Register",style: TextStyle(fontSize: 20),),
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
