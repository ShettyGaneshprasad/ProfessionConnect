import 'package:flutter/material.dart';

class GithubJobsDetails extends StatefulWidget {
  // GithubJobsDetails({});
  final String imgUrl,
      title,
      desc,
      content,
      posturl,
      companyName,
      companyUrl,
      location,
      howToApply,
      companyLogo,
      type;

  GithubJobsDetails(
      {this.imgUrl,
      this.title,
      this.desc,
      this.content,
      this.posturl,
      this.companyLogo,
      this.companyName,
      this.companyUrl,
      this.howToApply,
      this.location,
      this.type});
  @override
  _GithubJobsDetailsState createState() => _GithubJobsDetailsState();
}

class _GithubJobsDetailsState extends State<GithubJobsDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Image.network(widget.imgUrl),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              widget.title,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Text(
            "(" + widget.type + ")",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "Company Website  " + widget.companyUrl,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      )),
    );
  }
}
