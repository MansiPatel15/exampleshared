import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdditionExample extends StatefulWidget {

  @override
  _AdditionExampleState createState() => _AdditionExampleState();
}

class _AdditionExampleState extends State<AdditionExample> {
  TextEditingController _no1 = TextEditingController();
  TextEditingController _no2 = TextEditingController();
  var result ="0";
  var sum =0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AdditionExample"),
      ),
      body: Padding(
        padding:  EdgeInsets.all(10.0),
      child :Column(
        crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("No1 : ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: _no1,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 20,
            ),
            Text("No2 : ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: _no2,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  var n1 = _no1.text.toString();
                  var n2 = _no2.text.toString();
                  setState(() {
                    sum = int.parse(n1) + int.parse(n2);
                    result = sum.toString();
                  });
                  SharedPreferences prefs = await SharedPreferences.getInstance();
                  prefs.setString("Addition", result);
                  print("Value Stored in Shared Prefs");
                  _no1.text="";
                  _no2.text="";
                },
                child: Text("Addition"),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text("Result : "+result.toString(),style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    SharedPreferences prefs = await SharedPreferences.getInstance();

                    if(prefs.containsKey("Addition"))
                    {
                      var n = prefs.getString("Addition");
                      setState(() {
                        result=n;
                      });
                    }
                    else
                    {
                      setState(() {
                        result="No Value Available";
                      });
                    }
                  },
                  child: Text("LastRead"),
                ),
                ElevatedButton(
                  onPressed: () async {
                    SharedPreferences prefs = await SharedPreferences.getInstance();

                    if(prefs.containsKey("Addition"))
                    {
                      // prefs.clear(); //all value
                      prefs.remove("Addition");
                      print("Value Removed from Storage");
                      setState(() {
                        result="No Value Available";
                      });
                    }
                    else
                    {
                      setState(() {
                        result="No Value Available";
                      });
                    }
                  },
                  child: Text("Remove"),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
