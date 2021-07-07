import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:webapp/home_page.dart';
import 'package:webapp/others/new_article.dart';
import 'package:webapp/theme.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TechWiki extends StatefulWidget {
  const TechWiki({Key key}) : super(key: key);

  @override
  _TechWikiState createState() => _TechWikiState();
}

class _TechWikiState extends State<TechWiki> {
  Widget customList(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection("tech-wiki")
          .where("authorized", isEqualTo: true)
          .snapshots(),
      builder: (_, snapshot) {
        if (snapshot.hasError) return Text('Error: ${snapshot.error}');
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
            color: Colors.white,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          if (snapshot.data.size == 0) {
            return SingleChildScrollView(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: Image.asset(
                        "assets/empty.png",
                        height: 300,
                      ),
                    ),
                    Text(
                      "No Articless Found",
                      style: TextStyle(
                          fontFamily: fontFamily1,
                          fontSize: 25,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: snapshot.data.size,
              itemBuilder: (context, index) {
                String title = snapshot.data.docs[index].get('title');
                String body = snapshot.data.docs[index].get('body');
                bool imageAdded = snapshot.data.docs[index].get('imageAdded');
                String image = snapshot.data.docs[index].get('image') ?? '';
                bool videoAdded = snapshot.data.docs[index].get('videoAdded');
                String video = snapshot.data.docs[index].get('video') ?? '';
                String createdOn = snapshot.data.docs[index].get('createdOn');
                String postedBy = snapshot.data.docs[index].get('postedBy');
                bool authorized = snapshot.data.docs[index].get('authorized');
                bool trending = snapshot.data.docs[index].get('trending');
                String videoId = YoutubePlayer.convertUrlToId(video);
                YoutubePlayerController _controller = YoutubePlayerController(
                  initialVideoId: 'iLnmTe5Q2Qw',
                  flags: YoutubePlayerFlags(
                    autoPlay: false,
                    mute: true,
                  ),
                );

                return Padding(
                    padding: EdgeInsets.all(25),
                    child: Neumorphic(
                      child: Container(
                          padding: EdgeInsets.all(30),
                          width: width,
                          color: Colors.white,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 4,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      title,
                                      style: TextStyle(
                                        color: myBlack3.withAlpha(200),
                                        fontSize: 24,
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      '\n',
                                      style: TextStyle(
                                        color: myBlack3.withAlpha(200),
                                        fontSize: 24,
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      body,
                                      style: TextStyle(
                                        color: myBlack2,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      imageAdded
                                          ? Image.network(image)
                                          : SizedBox.shrink(),
                                      videoAdded
                                          ? YoutubePlayer(
                                              controller: _controller,
                                              showVideoProgressIndicator: true,
                                            )
                                          : SizedBox.shrink(),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          )),
                    ));
              },
            );
          }
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: TextButton(
          child: Image.asset("assets/images/logo.png", width: 180),
          onPressed: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (_) => HomePage()));
          },
        ),
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: ElevatedButton(
              child: Text("Create a techWIKI"),
              onPressed: () async {
                Future<String> submitted = Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => NewArticle())) ??
                    "";
                if (await submitted == "done") {
                  CoolAlert.show(
                    borderRadius: 5,
                    backgroundColor: myWhite3,
                    confirmBtnColor: myBlack4,
                    confirmBtnTextStyle: TextStyle(color: Colors.white),
                    context: context,
                    type: CoolAlertType.success,
                    text: "Your request was succesfilly created",
                  );
                }
                if (await submitted == "failed") {
                  CoolAlert.show(
                    context: context,
                    type: CoolAlertType.error,
                    text: "Failed to create request",
                  );
                }
              },
            ),
          ),
        ],
      ),
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: ListView(
                children: [
                  ListTile(
                    leading: Icon(
                      Icons.favorite_outline_outlined,
                      size: 20,
                    ),
                    title: Text(
                      'recommended',
                      style: TextStyle(
                        color: myBlack2,
                        fontSize: 17,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.favorite_outline_outlined),
                    title: Text(
                      'recommended',
                      style: TextStyle(
                        color: myBlack2,
                        fontSize: 17,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.favorite_outline_outlined),
                    title: Text(
                      'recommended',
                      style: TextStyle(
                        color: myBlack2,
                        fontSize: 17,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Text(
                      "Headlines",
                      style: TextStyle(
                        color: myBlack2,
                        fontSize: 25,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  customList(context),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
