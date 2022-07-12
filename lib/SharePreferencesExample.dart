import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharePreferencesExample extends StatefulWidget {

  @override
  _SharePreferencesExampleState createState() => _SharePreferencesExampleState();
}

class _SharePreferencesExampleState extends State<SharePreferencesExample> {

  TextEditingController _name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SharePreferencesExample"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.all(10.0),
          child :Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Text : ",style: TextStyle(fontSize: 20),),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: _name,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () async {
                var nm = _name.text.toString();

                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.setString("fullname", nm);

                print("Value Stored in Shared Prefs");

                _name.text="";
              },
              child: Text("Store"),
            ),
            ElevatedButton(
              onPressed: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();

                if(prefs.containsKey("fullname"))
                  {
                    var n = prefs.getString("fullname");
                    print("Value : "+n);
                  }
                else
                  {
                    print("No Value Available");
                  }
              },
              child: Text("Read"),
            )
          ],
        ),
      ),
      ),
    );
  }
}
