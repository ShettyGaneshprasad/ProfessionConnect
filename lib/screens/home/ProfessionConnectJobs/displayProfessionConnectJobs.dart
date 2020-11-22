import 'package:ProfessionConnect/screens/home/ProfessionConnectJobs/professionConnectJobDetails.dart';
import 'package:ProfessionConnect/shared/loading.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:url_launcher/url_launcher.dart';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class DisplayProfessionConnectJobs extends StatefulWidget {
  _DisplayProfessionConnectJobs createState() =>
      new _DisplayProfessionConnectJobs();
}

class _DisplayProfessionConnectJobs
    extends State<DisplayProfessionConnectJobs> {
  StreamSubscription<QuerySnapshot> subscription;
  List<DocumentSnapshot> professionConnectJob;

  final CollectionReference collectionReference =
      Firestore.instance.collection("professionConnectJob");

  @override
  void initState() {
    super.initState();
    subscription = collectionReference.snapshots().listen((datasnapshot) {
      setState(() {
        professionConnectJob = datasnapshot.documents;
      });
    });
  }

  @override
  void dispose() {
    subscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // inside a seperate builder

//  itemCount: professionConnectJob.length,
    return Scaffold(
        backgroundColor: Colors.white,
        body: professionConnectJob != null
            ? ListView.builder(
                itemCount: professionConnectJob.length,
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                itemBuilder: (context, index) {
                  String imgPath = professionConnectJob[index].data['dummy'];
                  return Text(imgPath);
                  //  PCTile();
                })
            : new Loading());
  }
}

class PCTile extends StatelessWidget {
  final String imgUrl,
      title,
      desc,
      // content,
      posturl,
      companyName,
      companyUrl,
      location,
      howToApply,
      companyLogo,
      type;
  PCTile(
      {this.imgUrl,
      this.title,
      this.desc,
      // this.content,
      this.posturl,
      this.companyLogo,
      this.companyName,
      this.companyUrl,
      this.howToApply,
      this.location,
      this.type});
  Color mainColor = Color(0xff79fadb);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProfessionConnectJobsDetails(
                      companyLogo: companyLogo,
                      companyName: companyName,
                      companyUrl: companyUrl,
                      // content: content,
                      // desc: descmarkdown,
                      howToApply: howToApply,
                      imgUrl: imgUrl,
                      location: location,
                      posturl: posturl,
                      title: title,
                      type: type,
                    )));
      },
      child: Container(
          color: Colors.black,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Card(
              // color: mainColor,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    // Image.network(
                    //   imgUrl,
                    //   height: 150,
                    // ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        title,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      "(" + type + ")",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          "Company  :- ",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          companyName,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Location  :- ",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          location,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
