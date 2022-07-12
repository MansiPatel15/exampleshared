import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sharepreferencesexample/ViewEmployee.dart';

import 'helpers/DatabaseHelper.dart';

class UpdateEmployee extends StatefulWidget {
  var updateid="";
  UpdateEmployee({this.updateid});
  @override
  State<UpdateEmployee> createState() => _UpdateEmployeeState();
}

class _UpdateEmployeeState extends State<UpdateEmployee> {

  var operation ="F";
  var select = "p1";
  TextEditingController _name =TextEditingController();
  TextEditingController _contact =TextEditingController();
  TextEditingController _email =TextEditingController();

  getsingledata() async
  {
    DatabaseHelper obj = new DatabaseHelper();
    var data=await obj.getsingleemployee(widget.updateid);
    setState(() {
      _name.text = data[0]["ename"].toString();
      _contact.text = data[0]["econtact"].toString();
      _email.text = data[0]["email"].toString();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getsingledata();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("UpdateEmployeeExample"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15),
          child :Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Name : ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: _name,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(border: OutlineInputBorder(),hintText: 'Enter a Name'),
              ),
              SizedBox(
                height: 20,
              ),
              Text("Contact : ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: _contact,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(border: OutlineInputBorder(),hintText: 'Enter a Contact'),
              ),
              SizedBox(
                height: 20,
              ),
              Text("EmailAddress : ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: _email,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(border: OutlineInputBorder(),hintText: 'Enter a Email'),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text("Gender : ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  SizedBox(
                    height: 10,
                  ),
                  Radio(
                    groupValue: operation,
                    value: "F",
                    onChanged: (val)
                    {
                      setState(() {
                        operation=val;
                      });
                    },
                  ),
                  Text("Female"),
                  Radio(
                    groupValue: operation,
                    value: "M",
                    onChanged: (val)
                    {
                      setState(() {
                        operation=val;
                      });
                    },
                  ),
                  Text("Male"),
                  Radio(
                    groupValue: operation,
                    value: "O",
                    onChanged: (val)
                    {
                      setState(() {
                        operation=val;
                      });
                    },
                  ),
                  Text("Other"),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text("Department : ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  SizedBox(
                    height: 20,
                  ),
                  DropdownButton(
                    value: select,
                    onChanged: (val)
                    {
                      setState(() {
                        select=val;
                      });
                    },
                    items: [
                      DropdownMenuItem(
                        child: Text("Purchase Department"),
                        value: "p1",
                      ),
                      DropdownMenuItem(
                        child: Text("Sales Department"),
                        value: "s2",
                      ),
                      DropdownMenuItem(
                        child: Text("Accounting Department"),
                        value: "a3",
                      ),
                      DropdownMenuItem(
                        child: Text("Marketing Department"),
                        value: "m4",
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child:Container(
                      width: MediaQuery.of(context).size.width/2.2,
                      child: ElevatedButton(
                        onPressed: () async {
                          var name = _name.text.toString();
                          var contact = _contact.text.toString();
                          var email = _email.text.toString();

                          DatabaseHelper obj = new DatabaseHelper();
                          var status = await obj.updateemployee(name,contact,email,operation,select,widget.updateid);
                          Navigator.of(context).pop();
                          Navigator.of(context).pop();
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (context)=> ViewEmployee())
                          );
                          Fluttertoast.showToast(
                              msg: "Employee Updated Successfully",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0
                          );
                        },
                        child: Text("Update",style: TextStyle(fontSize: 20),),
                      ) ,
                    ) ,
                  )

                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
