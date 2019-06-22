import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget{

  final String pageText;

  //const ProfilePage({Key key, this.pageText}): super(key: key);
  ProfilePage(this.pageText, {Key key}): super(key: key);
  @override
  _ProfilePage createState() => _ProfilePage();
}


class _ProfilePage extends State<ProfilePage>{

  //String pageText = _ProfilePage(this.pageText);

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(title: new Text(widget.pageText),),
      body: new Center(
        child: new Text(widget.pageText),
      ),
    );
  }


}
