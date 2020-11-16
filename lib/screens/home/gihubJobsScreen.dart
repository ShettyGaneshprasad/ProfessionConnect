import 'package:ProfessionConnect/models/githubJobs.dart';
import 'package:ProfessionConnect/services/githubJobs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html_view/flutter_html_view.dart';

class GithubJobScreen extends StatefulWidget {
  @override
  _GithubJobScreenState createState() => _GithubJobScreenState();
}

class _GithubJobScreenState extends State<GithubJobScreen> {
  List<GithubJobsModel> githubJobsList = new List<GithubJobsModel>();
  bool _loading = true;

  @override
  void initState() {
    getNews();
    super.initState();
  }

  getNews() async {
    GithubJobs githubJobs = GithubJobs();
    print("github jobs object created");
    await githubJobs.getNews();
    print("exectuted job list and created news");
    githubJobsList = githubJobs.githubJobsList;
    setState(() {
      _loading = false;
    });

    print(githubJobsList[0].company);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                child: Center(
                  child: _loading
                      ? Container(child: CircularProgressIndicator())
                      : SingleChildScrollView(
                          child: Container(
                            child: Column(
                              children: <Widget>[
                                /// Categories

                                /// News Article
                                Container(
                                  margin: EdgeInsets.only(top: 16),
                                  child: ListView.builder(
                                      itemCount: githubJobsList.length,
                                      shrinkWrap: true,
                                      physics: ClampingScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        return BlogTile(
                                          imgUrl: githubJobsList[index]
                                                  .companyLogo ??
                                              "",
                                          title:
                                              githubJobsList[index].title ?? "",
                                          desc: githubJobsList[index]
                                                  .description ??
                                              "",
                                          content:
                                              githubJobsList[index].location ??
                                                  "",
                                          posturl:
                                              githubJobsList[index].url ?? "",
                                        );
                                      }),
                                ),
                              ],
                            ),
                          ),
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BlogTile extends StatelessWidget {
  final String imgUrl, title, desc, content, posturl;
  BlogTile({this.imgUrl, this.title, this.desc, this.content, this.posturl});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //         builder: (context) => DetailView(
        //               blogurl: posturl,
        //             )));
      },
      child: Container(
          child: Column(
        children: <Widget>[
          Image.network(imgUrl),
          SizedBox(
            height: 10,
          ),
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child:
                // HtmlView(data: desc),
                Text(
              desc,
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
              ),
            ),
          ),
          // SizedBox(
          //   height: 20,
          // ),
          Divider(
            color: Colors.blue,
            thickness: 3,
          )
        ],
      )),
    );
  }
}
