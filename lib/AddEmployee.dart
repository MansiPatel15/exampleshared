import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'helpers/DatabaseHelper.dart';

class AddEmployee extends StatefulWidget {

  @override
  State<AddEmployee> createState() => _AddEmployeeState();
}

class _AddEmployeeState extends State<AddEmployee> {
  var operation ="F";
  var select = "p1";
  TextEditingController _name =TextEditingController();
  TextEditingController _contact =TextEditingController();
  TextEditingController _email =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AddEmployee"),
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width/2.2,
                  child: ElevatedButton(
                    onPressed: () async {
                      var name = _name.text.toString();
                      var contact = _contact.text.toString();
                      var email = _email.text.toString();

                      DatabaseHelper obj = new DatabaseHelper();
                      var id = await obj.addemployee(name,contact,email,operation,select);
                      print("Record Inserted at : "+id.toString());

                      Fluttertoast.showToast(
                          msg: "Employee Inserted Successfully",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0
                      );
                      _name.text="";
                      _contact.text="";
                      _email.text="";
                      operation="";
                      select="";
                      },
                    child: Text("Add",style: TextStyle(fontSize: 20),),
                  ) ,
                ),
                Container(
                  width: MediaQuery.of(context).size.width/2.2,
                  child: ElevatedButton(
                    onPressed: (){},
                    child: Text("Cancel",style: TextStyle(fontSize: 20),),
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
