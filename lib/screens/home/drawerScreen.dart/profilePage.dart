import 'dart:io';

//import 'package:blogapp/NetworkHandler.dart';
// import 'package:blogapp/Pages/HomePage.dart';
// import 'package:blogapp/Screen/HomeScreen.dart';
import 'package:ProfessionConnect/models/user.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class CreateProfile extends StatefulWidget {
  @override
  _CreateProfileState createState() => _CreateProfileState();
}

class _CreateProfileState extends State<CreateProfile> {
  //final networkHandler = NetworkHandler();
  bool circular = false;
  PickedFile _imageFile;
  final _globalkey = GlobalKey<FormState>();
  TextEditingController _name = TextEditingController();
  TextEditingController _profession = TextEditingController();
  TextEditingController _age = TextEditingController();
  TextEditingController _title = TextEditingController();
  TextEditingController _about = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _globalkey,
        child: Container(
          height: double.infinity, // Change as per your requirement
          width: double.infinity,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            children: <Widget>[
              imageProfile(),
              SizedBox(
                height: 20,
              ),
              getHeaderText(),
              SizedBox(
                height: 20,
              ),
              nameTextField(),
              SizedBox(
                height: 20,
              ),
              professionTextField(),
              SizedBox(
                height: 20,
              ),
              ageField(),
              SizedBox(
                height: 20,
              ),
              titleTextField(),
              SizedBox(
                height: 20,
              ),
              // aboutTextField(),
              // SizedBox(
              //   height: 20,
              // ),
              // InkWell(
              //   onTap: () async {
              //     setState(() {
              //       circular = true;
              //     });
              //     if (_globalkey.currentState.validate()) {
              //       Map<String, String> data = {
              //         "name": _name.text,
              //         "profession": _profession.text,
              //         "dob": _dob.text,
              //         "title": _title.text,
              //         "about": _about.text,
              //       };
              //       var response =
              //           await networkHandler.post("/profile/add", data);
              //       if (response.statusCode == 200 ||
              //           response.statusCode == 201) {
              //         if (_imageFile.path != null) {
              //           var imageResponse = await networkHandler.patchImage(
              //               "/profile/add/image", _imageFile.path);
              //           if (imageResponse.statusCode == 200) {
              //             setState(() {
              //               circular = false;
              //             });
              //             Navigator.of(context).pushAndRemoveUntil(
              //                 MaterialPageRoute(builder: (context) => HomePage()),
              //                 (route) => false);
              //      s     }
              //         } else {
              //           setState(() {
              //             circular = false;
              //           });
              //           Navigator.of(context).pushAndRemoveUntil(
              //               MaterialPageRoute(builder: (context) => HomePage()),
              //               (route) => false);
              //         }
              //       }
              //     }
              //   },
              //   child: Center(
              //     child: Container(
              //       width: 200,
              //       height: 50,
              //       decoration: BoxDecoration(
              //         color: Colors.teal,
              //         borderRadius: BorderRadius.circular(10),
              //       ),
              //       child: Center(
              //         child: circular
              //             ? CircularProgressIndicator()
              //             : Text(
              //                 "Submit",
              //                 style: TextStyle(
              //                   color: Colors.white,
              //                   fontSize: 18,
              //                   fontWeight: FontWeight.bold,
              //                 ),
              //               ),
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  Widget imageProfile() {
    return Center(
      child: Stack(children: <Widget>[
        Container(
          child: CircleAvatar(
            radius: 80.0,
            backgroundImage: _imageFile == null
                ? NetworkImage(
                    'https://helpx.adobe.com/content/dam/help/en/stock/how-to/visual-reverse-image-search/jcr_content/main-pars/image/visual-reverse-image-search-v2_intro.jpg',
                  )
                : FileImage(
                    File(
                      _imageFile.path,
                    ),
                  ),
          ),
        ),
        Container(
          child: Positioned(
            bottom: 20.0,
            right: 20.0,
            child: InkWell(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: ((builder) => bottomSheet()),
                );
              },
              child: Icon(
                Icons.camera_alt,
                color: Colors.teal,
                size: 28.0,
              ),
            ),
          ),
        ),
      ]),
    );
  }

  Widget bottomSheet() {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          Text(
            "Choose Profile photo",
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.camera),
              onPressed: () {
                takePhoto(ImageSource.camera);
              },
              label: Text("Camera"),
            ),
            FlatButton.icon(
              icon: Icon(Icons.image),
              onPressed: () {
                takePhoto(ImageSource.gallery);
              },
              label: Text("Gallery"),
            ),
          ])
        ],
      ),
    );
  }

  void takePhoto(ImageSource source) async {
    final pickedFile = await _picker.getImage(
      source: source,
    );
    setState(() {
      _imageFile = pickedFile ??
          NetworkImage(
            'https://helpx.adobe.com/content/dam/help/en/stock/how-to/visual-reverse-image-search/jcr_content/main-pars/image/visual-reverse-image-search-v2_intro.jpg',
          );
    });
  }

  getHeaderText() {
    final userdata = Provider.of<User>(context);
    return Text(
      userdata.email,
      maxLines: 1,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.white,
        fontSize: 12,
        decoration: TextDecoration.none,
      ),
    );
  }

  Widget nameTextField() {
    return TextFormField(
      controller: _name,
      validator: (value) {
        if (value.isEmpty) return "Name can't be empty";

        return null;
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.teal,
        )),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.orange,
          width: 2,
        )),
        prefixIcon: Icon(
          Icons.person,
          color: Colors.green,
        ),
        labelText: "Name",
        helperText: "Name can't be empty",
        hintText: "Dev Stack",
      ),
    );
  }

  Widget professionTextField() {
    return TextFormField(
      controller: _profession,
      validator: (value) {
        if (value.isEmpty) return "Profession can't be empty";

        return null;
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.teal,
        )),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.orange,
          width: 2,
        )),
        prefixIcon: Icon(
          Icons.person,
          color: Colors.green,
        ),
        labelText: "Profession",
        helperText: "Profession can't be empty",
        hintText: "Full Stack Developer",
      ),
    );
  }

  Widget ageField() {
    return TextFormField(
      onChanged: (value) {
        print(value);
      },
      controller: _age,
      validator: (value) {
        if (value.isEmpty) return "Age can't be empty";

        return null;
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.teal,
        )),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.orange,
          width: 2,
        )),
        prefixIcon: Icon(
          Icons.person,
          color: Colors.green,
        ),
        labelText: "Age",
        helperText: "Provide your age",
        hintText: "20 or 30",
      ),
    );
  }

  Widget titleTextField() {
    return TextFormField(
      controller: _title,
      validator: (value) {
        if (value.isEmpty) return "Title can't be empty";

        return null;
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.teal,
        )),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.orange,
          width: 2,
        )),
        prefixIcon: Icon(
          Icons.person,
          color: Colors.green,
        ),
        labelText: "Title",
        helperText: "It can't be empty",
        hintText: "Flutter Developer",
      ),
    );
  }

  Widget aboutTextField() {
    return TextFormField(
      controller: _about,
      validator: (value) {
        if (value.isEmpty) return "About can't be empty";

        return null;
      },
      maxLines: 4,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.teal,
        )),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.orange,
          width: 2,
        )),
        labelText: "About",
        helperText: "Write about yourself",
        hintText: "I am Dev Stack",
      ),
    );
  }
}
