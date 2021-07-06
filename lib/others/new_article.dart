import 'package:webapp/theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';

class NewArticle extends StatefulWidget {
  NewArticle({
    Key key,
  }) : super(key: key);

  @override
  _NewArticleState createState() => _NewArticleState();
}

class _NewArticleState extends State<NewArticle> {
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
  bool isLoading = false;
  bool videoAdded = false;
  bool imageAdded = false;

  Future<void> createNewArticle(
      BuildContext context, Map<String, dynamic> value) async {
    print("new Article about to run");
    var dateNow = DateTime.now();
    var formattedDateNow = DateFormat('yyyy-MM-dd kk:mm:ss').format(dateNow);

    await FirebaseFirestore.instance.collection('tech-wiki').doc().set({
      'authorized': false,
      'body': value["body"],
      'createdOn': formattedDateNow,
      'image': value["image"],
      'imageAdded': imageAdded,
      'title': value["title"],
      'topic': value["topic"],
      'trending': false,
      'video': value["video"],
      'videoAdded': videoAdded,
    }).then((value) {
      setState(() {
        isLoading = false;
      });
      Navigator.of(context).pop('done');
    }).catchError((e) {
      print("catching error");
      setState(() {
        isLoading = false;
      });
      Navigator.of(context).pop('failed');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: myBlack1,
        title: Text(
          "Create New Article",
          style: TextStyle(
            fontFamily: fontFamily1,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              FormBuilder(
                key: _fbKey,
                autovalidateMode: AutovalidateMode.always,
                child: Column(
                  children: <Widget>[
                    new StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection('tech-wiki-article-topic')
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData)
                            return const Center(
                              child: CupertinoActivityIndicator(),
                            );

                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FormBuilderDropdown(
                              name: 'topic',
                              decoration: InputDecoration(
                                isDense: true,
                                labelStyle: TextStyle(color: myBlack1),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: myBlack1, width: 2.0),
                                ),
                                border: OutlineInputBorder(),
                                labelText: 'Topic',
                              ),
                              // initialValue: 'Male',
                              allowClear: true,
                              hint: Text('Select Topic'),
                              validator: FormBuilderValidators.compose(
                                  [FormBuilderValidators.required(context)]),

                              items: snapshot.data.docs
                                  .map((DocumentSnapshot document) {
                                return new DropdownMenuItem<String>(
                                    value: document.get("topic"),
                                    child: new Container(
                                      padding: EdgeInsets.fromLTRB(
                                          10.0, 2.0, 10.0, 0.0),
                                      //color: primaryColor,
                                      child: new Text(document.get("topic")),
                                    ));
                              }).toList(),
                            ),
                          );
                        }),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FormBuilderTextField(
                        name: "title",
                        decoration: InputDecoration(
                          isDense: true,
                          labelStyle: TextStyle(color: myBlack1),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: myBlack1, width: 2.0),
                          ),
                          border: OutlineInputBorder(),
                          labelText: 'Title',
                        ),

                        // valueTransformer: (text) => num.tryParse(text),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.max(context, 40),
                          FormBuilderValidators.required(context),
                        ]),
                        keyboardType: TextInputType.name,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FormBuilderTextField(
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        name: "body",
                        decoration: InputDecoration(
                          isDense: true,
                          labelStyle: TextStyle(color: myBlack1),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: myBlack1, width: 2.0),
                          ),
                          border: OutlineInputBorder(),
                          labelText: 'Body',
                        ),

                        // valueTransformer: (text) => num.tryParse(text),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.max(context, 1000),
                          FormBuilderValidators.required(context),
                        ]),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: CheckboxListTile(
                        value: imageAdded,
                        onChanged: (newValue) {
                          setState(() {
                            imageAdded = newValue;
                            videoAdded = !newValue;
                          });
                        },
                        controlAffinity: ListTileControlAffinity
                            .leading, //  <-- leading Checkbox

                        title: FormBuilderTextField(
                          name: "image",
                          decoration: InputDecoration(
                            isDense: true,
                            labelStyle: TextStyle(color: myBlack1),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: myBlack1, width: 2.0),
                            ),
                            border: OutlineInputBorder(),
                            labelText: 'Image Link',
                          ),

                          // valueTransformer: (text) => num.tryParse(text),
                          validator: imageAdded
                              ? FormBuilderValidators.compose([
                                  FormBuilderValidators.url(context),
                                  FormBuilderValidators.required(context),
                                ])
                              : FormBuilderValidators.compose([
                                  FormBuilderValidators.url(context),
                                ]),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: CheckboxListTile(
                        value: videoAdded,
                        onChanged: (newValue) {
                          setState(() {
                            videoAdded = newValue;
                            imageAdded = !newValue;
                          });
                        },
                        controlAffinity: ListTileControlAffinity
                            .leading, //  <-- leading Checkbox

                        title: FormBuilderTextField(
                          name: "video",
                          decoration: InputDecoration(
                            isDense: true,
                            labelStyle: TextStyle(color: myBlack1),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: myBlack1, width: 2.0),
                            ),
                            border: OutlineInputBorder(),
                            labelText: 'Video Link',
                          ),

                          // valueTransformer: (text) => num.tryParse(text),
                          validator: videoAdded
                              ? FormBuilderValidators.compose([
                                  FormBuilderValidators.url(context),
                                  FormBuilderValidators.required(context),
                                ])
                              : FormBuilderValidators.compose([
                                  FormBuilderValidators.url(context),
                                ]),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  child: ElevatedButton(
                    onPressed: isLoading
                        ? null
                        : () {
                            _fbKey.currentState.save();
                            if (_fbKey.currentState.validate()) {
                              setState(() {
                                isLoading = true;
                              });
                              createNewArticle(
                                  context, _fbKey.currentState.value);
                              print(_fbKey.currentState.value);
                            }
                          },
                    style: ElevatedButton.styleFrom(
                      primary: myBlack1,
                    ),
                    child: isLoading
                        ? CircularProgressIndicator(
                            valueColor:
                                new AlwaysStoppedAnimation<Color>(myBlack1),
                          )
                        : Text(
                            'Submit Article',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: fontFamily1,
                            ),
                          ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
