import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sharepreferencesexample/helpers/DatabaseHelper.dart';

class AddProduct extends StatefulWidget {

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  TextEditingController _name =TextEditingController();
  TextEditingController _desc =TextEditingController();
  TextEditingController _rprice =TextEditingController();
  TextEditingController _sprice =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AddProduct"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15.0),
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
            Text("Description : ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: _desc,
              minLines: 2,
              maxLines: 5,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(border: OutlineInputBorder(),hintText: 'Enter a Description'),
            ),
            SizedBox(
              height: 20,
            ),
            Text("Regular Price : ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: _rprice,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(border: OutlineInputBorder(),hintText: 'Enter a RegularPrice'),
            ),
            SizedBox(
              height: 20,
            ),
            Text("S Price : ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: _sprice,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(border: OutlineInputBorder(),hintText: 'Enter a SPrice'),
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
                    onPressed: () async{
                      var name = _name.text.toString();
                      var pdesc = _desc.text.toString();
                      var rprice = _rprice.text.toString();
                      var sprice = _sprice.text.toString();


                      DatabaseHelper obj = new DatabaseHelper();
                      var id = await obj.addproduct(name,pdesc,rprice,sprice);
                      print("Record Inserted at : "+id.toString());

                      Fluttertoast.showToast(
                          msg: "Product Inserted Successfully",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0
                      );
                      _name.text="";
                      _rprice.text="";
                      _desc.text="";
                      _sprice.text="";
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
