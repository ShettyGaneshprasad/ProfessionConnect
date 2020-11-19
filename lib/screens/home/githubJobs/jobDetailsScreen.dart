import 'package:flutter/material.dart';

final String companyName = "Google";
final String position = "position:abc";
final String requirements = "requirements:abc";
final String jobDescription = "jobdescription:xyz";
var salary = "salary:10000";

class Companydetails extends StatefulWidget {
  _Details createState() => _Details();
}

class _Details extends State<Companydetails> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          companyName,
        ),
        centerTitle: true,
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRllVpgal57jpMmUQWQnCVDGnMEztY3NnKM2w&usqp=CAU'),
            ),
            Text(
              companyName,
              style: new TextStyle(
                  fontSize: 25.0,
                  fontStyle: FontStyle.normal,
                  height: 2.5,
                  color: Colors.black),
              textAlign: TextAlign.center,
            ),
            Text(
              position,
              style: new TextStyle(
                  fontSize: 15.0,
                  fontStyle: FontStyle.normal,
                  height: 2.5,
                  color: Colors.black),
              textAlign: TextAlign.center,
            ),
            Text(
              salary.toString(),
              style: new TextStyle(
                  fontSize: 15.0,
                  fontStyle: FontStyle.normal,
                  height: 2.5,
                  color: Colors.black),
              textAlign: TextAlign.center,
            ),
            Text(
              requirements,
              style: new TextStyle(
                  fontSize: 15.0,
                  fontStyle: FontStyle.normal,
                  height: 2.5,
                  color: Colors.black),
              textAlign: TextAlign.center,
            ),
            Text(
              jobDescription,
              style: new TextStyle(
                  fontSize: 15.0,
                  fontStyle: FontStyle.normal,
                  height: 2.5,
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
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                    ),
                    onPressed: () {},
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
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                    ),
                    onPressed: () {},
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
