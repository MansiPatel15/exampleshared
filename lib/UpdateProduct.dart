import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sharepreferencesexample/ViewProduct.dart';

import 'helpers/DatabaseHelper.dart';

class UpdateProduct extends StatefulWidget {
  var updateid="";
  UpdateProduct({this.updateid});

  @override
  State<UpdateProduct> createState() => _UpdateProductState();
}

class _UpdateProductState extends State<UpdateProduct> {
  TextEditingController _name =TextEditingController();
  TextEditingController _desc =TextEditingController();
  TextEditingController _rprice =TextEditingController();
  TextEditingController _sprice =TextEditingController();

  getsingledata() async
  {
    DatabaseHelper obj = new DatabaseHelper();
    var data=await obj.getsingleproduct(widget.updateid);
    setState(() {
      _name.text = data[0]["pname"].toString();
      _desc.text = data[0]["pdesc"].toString();
      _rprice.text = data[0]["rprice"].toString();
      _sprice.text = data[0]["sprice"].toString();
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
        title: Text("UpdateProductExample"),
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child:  Container(
                      width: MediaQuery.of(context).size.width/2.2,
                      child: ElevatedButton(
                        onPressed: () async{
                          var name = _name.text.toString();
                          var pdesc = _desc.text.toString();
                          var rprice = _rprice.text.toString();
                          var sprice = _sprice.text.toString();

                          DatabaseHelper obj = new DatabaseHelper();
                          var status = await obj.updateproduct(name,pdesc,rprice,sprice,widget.updateid);
                          Navigator.of(context).pop();
                          Navigator.of(context).pop();
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (context)=> ViewProduct())
                          );
                          Fluttertoast.showToast(
                              msg: "Product Updated Successfully",
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
