import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sharepreferencesexample/UpdateProduct.dart';
import 'package:sharepreferencesexample/helpers/DatabaseHelper.dart';

class ViewProduct extends StatefulWidget {

  @override
  State<ViewProduct> createState() => _ViewProductState();
}

class _ViewProductState extends State<ViewProduct> {

  Future<List> alldata;

  getdata() async
  {
    DatabaseHelper obj = new DatabaseHelper();
    setState(() {
      alldata = obj.getAllProducts();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }

  _createDialog(id)
  {
    AlertDialog alert = AlertDialog(
      title: Text("Are You Sure ?",textAlign: TextAlign.center,),
      content: Text("Do you really want to delete permanently ?",style: TextStyle(fontSize: 13),),
      contentPadding: EdgeInsets.all(15.0),
      actions: [
        Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 3,
              child: ElevatedButton(onPressed: ()  async{
                DatabaseHelper obj = new DatabaseHelper();
                int status = await obj.deleteProduct(id);
                print("Status : "+status.toString());
                Navigator.of(context).pop();
                if(status==1)
                {
                  print("Record Deleted");
                  Fluttertoast.showToast(
                      msg: "Product Deleted Successfully",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0
                  );
                  getdata();
                }
                else
                {
                  print("Error");
                }
              }, child: Text("Yes")),
            ),
            SizedBox(
              width: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width / 3,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("No")),
            )
          ],
        )
      ],
    );
    showDialog(context: context, builder: (context){
      return alert;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ViewProductExample"),
      ),
      body: FutureBuilder(
        future: alldata,
        builder: (context,snapshots)
        {
          if(snapshots.hasData)
            {
              //if data loaded
              if(snapshots.data.length<=0)
                {
                  return Center(child: Text("No Data!"));
                }
              else
                {
                    return ListView.builder(
                      itemCount: snapshots.data.length,
                      itemBuilder: (context,index)
                      {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          height: 250.0,
                          color: Colors.purple,
                          margin: EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              Text(snapshots.data[index]["pname"].toString(),style: TextStyle(fontSize: 20,color: Colors.white),),
                              Divider(
                                color: Colors.white,
                              ),
                              Text(snapshots.data[index]["pdesc"].toString(),style: TextStyle(fontSize: 20,color: Colors.white),),
                              Divider(
                                color: Colors.white,
                              ),
                              Text(snapshots.data[index]["rprice"].toString(),style: TextStyle(fontSize: 20,color: Colors.white),),
                              Divider(
                                color: Colors.white,
                              ),
                              Text(snapshots.data[index]["sprice"].toString(),style: TextStyle(fontSize: 20,color: Colors.white),),
                              Divider(
                                color: Colors.white,
                              ),
                                SizedBox(
                                  height: 10,
                                ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(padding: EdgeInsets.all(5)),
                                  Container(
                                    width: MediaQuery.of(context).size.width/2.3,
                                    child: ElevatedButton(
                                      onPressed: (){
                                        var id = snapshots.data[index]["pid"].toString();
                                        _createDialog(id);
                                      },
                                      child: Text("Delete"),
                                    ),
                                  ),
                                  Padding(padding: EdgeInsets.all(5)),
                                  Container(
                                    width: MediaQuery.of(context).size.width/2.3,
                                    child: ElevatedButton(
                                      onPressed: (){
                                        var id = snapshots.data[index]["pid"].toString();
                                        Navigator.of(context).push(
                                            MaterialPageRoute(builder: (context)=> UpdateProduct(updateid: id))
                                        );
                                      },
                                      child: Text("Update"),
                                    ),
                                  ),
                                  Padding(padding: EdgeInsets.all(5)),
                                ],
                              ),
                            ],
                          ),
                        );
                        // return ListTile(
                        //   title: Text(snapshots.data[index]["pname"].toString()),
                        //   subtitle: Text(snapshots.data[index]["pdesc"].toString()),
                        //   trailing: Text("Rs."+snapshots.data[index]["sprice"].toString()),
                        // );
                      },
                    );
                }
            }
          else
            {
              //data not loaded yet
              return Center(child: CircularProgressIndicator(),);
            }
        },
      ),
    );
  }
}
