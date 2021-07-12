import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:webapp/responsive.dart';
import 'package:webapp/theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';
import 'dart:async';
import 'package:path/path.dart' as p;
import 'package:mime_type/mime_type.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:firebase/firebase.dart' as fb;
import 'dart:ui';

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
  MediaInfo selectedImage;
  MediaInfo selectedVideo;
  Widget _pickedImages;

  Future<void> createNewArticle(
      BuildContext context, Map<String, dynamic> value) async {
    print("new Article about to run");
    var dateNow = DateTime.now();
    var formattedDateNow = DateFormat('yyyy-MM-dd kk:mm:ss').format(dateNow);
    Uri imageLINK = await uploadFile(selectedImage, value["title"] + "-image");
    await FirebaseFirestore.instance.collection('tech-wiki').doc().set({
      'authorized': false,
      'attachments': value["attachments"],
      'body': value["body"],
      'createdOn': formattedDateNow,
      'image': imageAdded ? imageLINK.toString() : '',
      'postedBy': value["postedBy"],
      'title': value["title"],
      'topic': value["topic"],
      'trending': false,
      'video': videoAdded
          ? await uploadFile(selectedVideo, value["title"] + "-video")
          : '',
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

  Future<Uri> uploadFile(MediaInfo mediaInfo, String fileName) async {
    try {
      String mimeType = mime(p.basename(mediaInfo.fileName));

      // html.File mediaFile =
      //     new html.File(mediaInfo.data, mediaInfo.fileName, {'type': mimeType});
      final String extension = extensionFromMime(mimeType);

      var metadata = fb.UploadMetadata(
        contentType: mimeType,
      );

      fb.StorageReference storageReference =
          fb.storage().ref("tech-wiki/images").child(fileName + ".$extension");

      fb.UploadTaskSnapshot uploadTaskSnapshot =
          await storageReference.put(mediaInfo.data, metadata).future;

      Uri imageUri = await uploadTaskSnapshot.ref.getDownloadURL();
      print("download url $imageUri");
      isLoading = false;
      return imageUri;
    } catch (e) {
      print("File Upload Error $e");
      isLoading = false;
      return null;
    }
  }

  Future<MediaInfo> itemPicker(String itemType) async {
    MediaInfo item = itemType == "image"
        ? await ImagePickerWeb.getImageInfo
        : await ImagePickerWeb.getVideoInfo;
    setState(() {
      _pickedImages = Stack(
        alignment: Alignment.topRight,
        children: [
          Image.memory(
            item.data,
            semanticLabel: item.fileName,
            height: 150,
            width: 150,
          ),
          ClipOval(
            child: Material(
              color: Colors.grey[350], // Button color
              child: InkWell(
                splashColor: Colors.grey, // Splash color
                onTap: () {
                  setState(() {
                    imageAdded = false;
                  });
                },
                child: SizedBox(
                    width: 20,
                    height: 20,
                    child: Center(
                        child: Icon(
                      Icons.close,
                      size: 18,
                    ))),
              ),
            ),
          ),
        ],
      );

      itemType == "image" ? imageAdded = true : videoAdded = true;
    });
    return item;
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
            crossAxisAlignment: CrossAxisAlignment.start,
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
                        maxLines: 5,
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
                      padding: const EdgeInsets.all(8.0),
                      child: FormBuilderTextField(
                        name: "postedBy",
                        decoration: InputDecoration(
                          isDense: true,
                          labelStyle: TextStyle(color: myBlack1),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: myBlack1, width: 2.0),
                          ),
                          border: OutlineInputBorder(),
                          labelText: 'Article Written By',
                        ),

                        // valueTransformer: (text) => num.tryParse(text),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.max(context, 20),
                          FormBuilderValidators.required(context),
                        ]),
                        keyboardType: TextInputType.name,
                      ),
                    ),
                  ],
                ),
              ),
              imageAdded ? _pickedImages : SizedBox.shrink(),
              SizedBox(
                height: 50,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ResponsiveWidget.isSmallScreen(context)
                      ? SizedBox.shrink()
                      : Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 200,
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20)),
                            child: ElevatedButton(
                              onPressed: isLoading
                                  ? null
                                  : () {
                                      _fbKey.currentState.save();
                                      if (_fbKey.currentState.validate()) {
                                        setState(() {
                                          isLoading = true;
                                        });
                                        uploadFile(selectedImage,
                                            'value["title"]' + "-image");
                                        // createNewArticle(
                                        //     context, _fbKey.currentState.value);
                                        print(_fbKey.currentState.value);
                                      }
                                    },
                              style: ElevatedButton.styleFrom(
                                primary: myBlack1,
                              ),
                              child: isLoading
                                  ? CircularProgressIndicator(
                                      valueColor:
                                          new AlwaysStoppedAnimation<Color>(
                                              myBlack1),
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
                  SizedBox(
                    width: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: IconButton(
                      tooltip: 'add image',
                      icon: Icon(Icons.image),
                      onPressed: () async {
                        selectedImage = await itemPicker("image");
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: IconButton(
                      tooltip: 'add video',
                      icon: Icon(Icons.video_collection),
                      onPressed: () async {
                        selectedVideo = await itemPicker("video");
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: IconButton(
                      tooltip: 'add link',
                      icon: Icon(Icons.link),
                      onPressed: () {
                        //imagePicker();
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: IconButton(
                      tooltip: 'add file',
                      icon: Icon(Icons.attach_file),
                      onPressed: () {
                        // imagePicker();
                      },
                    ),
                  ),
                ],
              ),
              ResponsiveWidget.isSmallScreen(context)
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5)),
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
                                  valueColor: new AlwaysStoppedAnimation<Color>(
                                      myBlack1),
                                )
                              : Text(
                                  'Submit Article',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontFamily: fontFamily1,
                                  ),
                                ),
                        ),
                      ),
                    )
                  : SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}
