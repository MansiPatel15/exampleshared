import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sharepreferencesexample/ErrorPageBankClone.dart';
import 'package:sharepreferencesexample/HomeBankClone.dart';

class EnterPinBankClone extends StatefulWidget {

  @override
  State<EnterPinBankClone> createState() => _EnterPinBankCloneState();
}

class _EnterPinBankCloneState extends State<EnterPinBankClone> {
  TextEditingController _pin = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("EnterPinBankCloneExample"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child :Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Enter A Pin",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
              SizedBox(
                height: 20,
              ),
              Text("PIN : ",style: TextStyle(fontSize: 20,),),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: _pin,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width/2,
                    child: ElevatedButton(
                      onPressed: () async
                      {
                        var pin =_pin.text.toString();

                        var s_pin ="";

                        SharedPreferences prefs = await SharedPreferences.getInstance();
                        if(prefs.containsKey("Pin"))
                          {
                            s_pin=prefs.getString("Pin");
                          }

                        if(pin==s_pin)
                          {
                            if(prefs.containsKey("counter"))
                            {
                              prefs.remove("counter");
                            }
                            Navigator.of(context).pop();
                            Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => HomeBankClone())
                            );
                          }
                        else
                          {
                            if(prefs.containsKey("counter"))
                              {
                                var c = prefs.getInt("counter");
                                if(c>=3)
                                  {
                                    Navigator.of(context).pop();
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) => ErrorPageBankClone())
                                    );
                                  }
                                c++;
                                prefs.setInt("counter", c);
                              }
                            else
                              {
                                prefs.setInt("counter", 1);
                              }

                            Fluttertoast.showToast(
                                msg: "Pin Not Match",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0
                            );
                          }

                      },
                      child: Text("Submit",style: TextStyle(fontSize: 20),),
                    ),
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}
