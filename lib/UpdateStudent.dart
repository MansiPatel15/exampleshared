import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sharepreferencesexample/ViewStudent.dart';

import 'helpers/DatabaseHelper.dart';

class UpdateStudent extends StatefulWidget {

  var updateid="";
  UpdateStudent({this.updateid});

  @override
  State<UpdateStudent> createState() => _UpdateStudentState();
}

class _UpdateStudentState extends State<UpdateStudent> {
  TextEditingController _rollno =TextEditingController();
  TextEditingController _name =TextEditingController();
  TextEditingController _s1 =TextEditingController();
  TextEditingController _s2 =TextEditingController();
  TextEditingController _s3 =TextEditingController();


  getsingledata() async
  {
    DatabaseHelper obj = new DatabaseHelper();
    var data=await obj.getsinglestudent(widget.updateid);
    setState(() {
      _rollno.text = data[0]["rollno"].toString();
      _name.text = data[0]["sname"].toString();
      _s1.text = data[0]["s1"].toString();
      _s2.text = data[0]["s2"].toString();
      _s3.text = data[0]["s3"].toString();
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
          title: Text("UpdateStudentExample"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Roll No : ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: _rollno,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(border: OutlineInputBorder(),hintText: 'Enter a Roll No'),
                ),
                SizedBox(
                  height: 20,
                ),
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
                Text("Subject1 : ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: _s1,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(border: OutlineInputBorder(),hintText: 'Enter a Subject1'),
                ),
                SizedBox(
                  height: 20,
                ),
                Text("Subject2 : ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: _s2,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(border: OutlineInputBorder(),hintText: 'Enter a Subject2'),
                ),
                SizedBox(
                  height: 20,
                ),
                Text("Subject3 : ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: _s3,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(border: OutlineInputBorder(),hintText: 'Enter a Subject3'),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width/2.2,
                        child: ElevatedButton(
                          onPressed: () async {
                            var rollno = _rollno.text.toString();
                            var name = _name.text.toString();
                            var subject1 = _s1.text.toString();
                            var subject2 = _s2.text.toString();
                            var subject3 = _s3.text.toString();
                            var total = double.parse(subject1) +double.parse(subject2)+double.parse(subject3);
                            var percentage = total/3;

                            DatabaseHelper obj = new DatabaseHelper();
                            var status = await obj.updatestudent(rollno,name,subject1,subject2,subject3,total,percentage,widget.updateid);
                            Navigator.of(context).pop();
                            Navigator.of(context).pop();
                            Navigator.of(context).push(
                                MaterialPageRoute(builder: (context)=> ViewStudent())
                            );
                            Fluttertoast.showToast(
                                msg: "Student Updated Successfully",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0
                            );
                            // DatabaseHelper obj = new DatabaseHelper();
                            // var id = await obj.addstudent(rollno,name,subject1,subject2,subject3,total,percentage);
                            // print("Record Inserted at : "+id.toString());
                            // _rollno.text="";
                            // _name.text="";
                            // _s1.text="";
                            // _s2.text="";
                            // _s3.text="";
                          },
                          child: Text("Update",style: TextStyle(fontSize: 20),),
                        ) ,
                      ),
                    )

                  ],
                ),
              ],
            ),
          ),
        )
    );
  }
}

