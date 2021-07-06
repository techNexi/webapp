import 'package:flutter/material.dart';
import 'package:webapp/others/new_article.dart';
import 'package:webapp/theme.dart';
import 'package:cool_alert/cool_alert.dart';

class TechWiki extends StatefulWidget {
  const TechWiki({Key key}) : super(key: key);

  @override
  _TechWikiState createState() => _TechWikiState();
}

class _TechWikiState extends State<TechWiki> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text("Create a techWIKI"),
          onPressed: () async {
            Future<String> submitted = Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => NewArticle())) ??
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
    );
  }
}
