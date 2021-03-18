import 'dart:io';
import 'dart:ui';
import 'package:ProfessionConnect/models/user.dart';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:ProfessionConnect/screens/home/drawerScreen.dart/Profile/editprofilePage.dart';

class MyCV extends StatelessWidget {
  final _globalkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    User userdata = Provider.of<User>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 10.0,
        centerTitle: true,
        backgroundColor: Color(0xff2FD159),
        leading: new GestureDetector(
          child: Container(
            color: Color(0xff2FD159),
            child: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        title: new Text(
          'My CV',
          style: TextStyle(color: Colors.black, fontSize: 25),
          textAlign: TextAlign.left,
        ),
        actions: <Widget>[],
      ),
      body: Form(
        key: _globalkey,
        child: Container(
          // color: Colors.black,
          height: double.infinity, // Change as per your requirement
          width: double.infinity,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            children: <Widget>[
              // imageProfile(),
              SizedBox(
                height: 10,
              ),
              // Row(children: [
              //   Text("Name:  "),
              //   getNameHeaderText(userdata);
              // ],)
              // getNameHeaderText(userdata),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(width: 100),
                  Text(
                    "Email:  ",
                    style: TextStyle(color: Colors.grey, fontSize: 20),
                  ),
                  getEmailHeaderText(userdata),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Divider(color: Colors.grey),
              Row(
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // SizedBox(width: 100),
                  Text(
                    "Upload CV",
                    style: TextStyle(color: Colors.green, fontSize: 20),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
              // getEmailHeaderText(userdata),

              // SizedBox(
              //   height: 20,
              // ),
              // getHeaderText(),
              SizedBox(
                height: 20,
              ),

              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

getNameHeaderText(User userdata) {
  // final userdata = Provider.of<User>(context);
  return Text(
    userdata.name ?? "User Name",
    maxLines: 1,
    textAlign: TextAlign.center,
    style: TextStyle(
      color: Colors.green,
      fontSize: 40,
      decoration: TextDecoration.none,
    ),
  );
}

getEmailHeaderText(User userdata) {
  // final userdata = Provider.of<User>(context);
  return Text(
    userdata.email,
    maxLines: 1,
    textAlign: TextAlign.center,
    style: TextStyle(
      color: Colors.green,
      fontSize: 20,
      decoration: TextDecoration.none,
    ),
  );
}
