import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

@override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Details",
      theme:ThemeData(
        primarySwatch:Colors.orange,
      ),
      home:Companydetails(),
      );
  }
}

class Person 
{
final String companyname="Google";
final String  position="position:abc";
final String  requirements="requirements:abc" ;
final String jobdescription="jobdescription:xyz"; 
 var salary="salary:10000";

}
class Companydetails extends StatefulWidget {
  @override
 
  _Details createState() => _Details();
}

class _Details extends State<Companydetails> {
  @override
  Person p = new Person();
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            "company Details"
          ),
          centerTitle:true ,
        ),
        body: Center(
            child:ListView (
            children: <Widget> [
               CircleAvatar (
                 radius: 40,
               backgroundImage: NetworkImage ('https://www.codemate.com/wp-content/uploads/2016/02/flutter-logo-round.png'),
                 ),
              
        Text(
           p.companyname,
          style: new TextStyle(
                            fontSize: 25.0,
                            fontStyle: FontStyle.normal,
                           height:2.5,
                          color: Colors.black),
                         textAlign: TextAlign.center,
                ),        
        Text(
    p.position,
   style: new TextStyle(
              fontSize: 15.0,
fontStyle: FontStyle.normal,
       height:2.5,
 
               color: Colors.black),
             textAlign: TextAlign.center,
              ),
              Text(
        p.salary.toString(),
   style: new TextStyle(
                            fontSize: 15.0,
        fontStyle: FontStyle.normal,
      height:2.5,
 

               color: Colors.black),
          textAlign: TextAlign.center,
              ),
               Text(
       p.requirements,
   style: new TextStyle(
              fontSize: 15.0,
fontStyle: FontStyle.normal,
      height:2.5,
 
               color: Colors.black),
                        textAlign: TextAlign.center,
              ),
              Text(
     p.jobdescription,
 style: new TextStyle(
                       fontSize: 15.0,
                      fontStyle: FontStyle.normal,
                     height:2.5,
                    color: Colors.black),
                   textAlign: TextAlign.center,
                 ),
     
             
      Row(
  children: <Widget>[
    SizedBox(
      width: 20.0,
    ),
    Expanded(
    
      child: RaisedButton(
        child: Text("Edit"),
        textColor: Colors.white,
        color: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius:
          BorderRadius.all(Radius.circular(40)),
        ),
        onPressed: () { },
        ),
      ),
     SizedBox(
      width: 20.0,
    ),
    Expanded(
    
      child: RaisedButton(
        child: Text("Delete"),
        textColor: Colors.white,
        color: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius:
          BorderRadius.all(Radius.circular(40)),
        ),
        onPressed: () { },
        ),
      ),
    ],
        ),
          ],
     ),
          ),
        );
     
   }
}

  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  