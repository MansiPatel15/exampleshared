
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper
{
  Database db;

  //Database Create
  Future<Database> create_db() async
  {
      //databse already exist
      if(db!=null)
        {
          return db;
        }
      else
        {
          //databse create
          Directory dir = await getApplicationDocumentsDirectory();
          String path = join(dir.path,"shopdb");
          var db = await openDatabase(path,version: 1,onCreate: create_table);
          return db;
        }
  }
  create_table(Database db,int version) async
  {
    //table create
    db.execute("create table products (pid integer primary key autoincrement,pname text,pdesc text,rprice double,sprice double)");
    db.execute("create table employee (eid integer primary key autoincrement,ename text,econtact text,email text,gender text,dept text)");
    db.execute("create table student (sid integer primary key autoincrement,rollno integer,sname text,s1 double,s2 double,s3 double,total double,per double)");
    print("Table Create");
  }
  Future<int> addproduct(name,pdesc,rprice,sprice) async
  {
    var db = await create_db();
    var id = await db.rawInsert("insert into products (pname,pdesc,rprice,sprice) values(?,?,?,?)",[name,pdesc,rprice,sprice]);
    return id;
  }
  Future<int> addemployee(name,contact,email,operation,select) async
  {
    var db = await create_db();
    var id = await db.rawInsert("insert into employee (ename,econtact,email,gender,dept) values(?,?,?,?,?)",[name,contact,email,operation,select]);
    return id;
  }
  Future<int> addstudent(rollno,name,subject1,subject2,subject3,total,percentage) async
  {
    var db = await create_db();
    var id = await db.rawInsert("insert into student (rollno,sname,s1,s2,s3,total,per) values(?,?,?,?,?,?,?)",[rollno,name,subject1,subject2,subject3,total,percentage]);
    return id;
  }
  Future<int> updatestudent(rollno,name,subject1,subject2,subject3,total,percentage,updateid) async
  {
    var db = await create_db();
    //var id = await db.rawInsert("insert into student (rollno,sname,s1,s2,s3,total,per) values(?,?,?,?,?,?,?)",[rollno,name,subject1,subject2,subject3,total,percentage]);
    var status = await db.rawUpdate("update student set rollno=?,sname=?,s1=?,s2=?,s3=?,total=?,per=? where sid=?",[rollno,name,subject1,subject2,subject3,total,percentage,updateid]);
    return status;
  }
  Future<int> updateproduct(name,pdesc,rprice,sprice,updateid) async
  {
    var db = await create_db();
    var status = await db.rawUpdate("update products set pname=?,pdesc=?,rprice=?,sprice=? where pid=?",[name,pdesc,rprice,sprice,updateid]);
    return status;
  }
  Future<int> updateemployee(name,contact,email,operation,select,updateid) async
  {
    var db = await create_db();
    var status = await db.rawUpdate("update employee set ename=?,econtact=?,email=?,gender=?,dept=? where eid=?",[name,contact,email,operation,select,updateid]);
    return status;
  }

  Future<List> getAllProducts() async
  {
    var db = await create_db();
    var data = await db.rawQuery("select * from products");
    return data.toList();
  }
  Future<List> getAllEmployee() async
  {
    var db = await create_db();
    var data = await db.rawQuery("select * from employee");
    return data.toList();
  }
  Future<List> getAllStudent() async
  {
    var db = await create_db();
    var data = await db.rawQuery("select * from student");
    return data.toList();
  }

  Future<int> deleteStudent(id) async
  {
    var db = await create_db();
    var status = await db.rawDelete("delete from student where sid=?",[id]);
    return status;
  }
  Future<int> deleteProduct(id) async
  {
    var db = await create_db();
    var status = await db.rawDelete("delete from products where pid=?",[id]);
    return status;
  }
  Future<int> deleteEmployee(id) async
  {
    var db = await create_db();
    var status = await db.rawDelete("delete from employee where eid=?",[id]);
    return status;
  }

  Future<List> getsinglestudent(id) async
  {
    var db = await create_db();
    var data = await db.rawQuery("select * from student where sid=?",[id]);
    return data.toList();
  }
  Future<List> getsingleproduct(id) async
  {
    var db = await create_db();
    var data = await db.rawQuery("select * from products where pid=?",[id]);
    return data.toList();
  }
  Future<List> getsingleemployee(id) async
  {
    var db = await create_db();
    var data = await db.rawQuery("select * from employee where eid=?",[id]);
    return data.toList();
  }
}