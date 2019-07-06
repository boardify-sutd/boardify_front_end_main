import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget{

  final String pageText;

  //const ProfilePage({Key key, this.pageText}): super(key: key);
  ProfilePage(this.pageText, {Key key}): super(key: key);
  @override
  _ProfilePage createState() => _ProfilePage();
}


class _ProfilePage extends State<ProfilePage>{
  Choice _selectedChoice = choices[0];

  void _select(Choice choice) {
    // Causes the app to rebuild with the new _selectedChoice.
    setState(() {
      _selectedChoice = choice;
    });
  }

  int getColorHexFromStr(String colorStr) {
    colorStr = "FF" + colorStr;
    colorStr = colorStr.replaceAll("#", "");
    int val = 0;
    int len = colorStr.length;
    for (int i = 0; i < len; i++) {
      int hexDigit = colorStr.codeUnitAt(i);
      if (hexDigit >= 48 && hexDigit <= 57) {
        val += (hexDigit - 48) * (1 << (4 * (len - 1 - i)));
      } else if (hexDigit >= 65 && hexDigit <= 70) {
        // A..F
        val += (hexDigit - 55) * (1 << (4 * (len - 1 - i)));
      } else if (hexDigit >= 97 && hexDigit <= 102) {
        // a..f
        val += (hexDigit - 87) * (1 << (4 * (len - 1 - i)));
      } else {
        throw new FormatException("An error occurred when converting a color");
      }
    }
    return val;
  }

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: AppBar(
          backgroundColor: Color(getColorHexFromStr("#34495E")),
          automaticallyImplyLeading: false, // hides leading widget
          flexibleSpace: new Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height:20.0),
                Row(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.clear, color: Colors.grey),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),  
                    Container(
                      width: MediaQuery.of(context).size.width/2,
                      child: Text(widget.pageText,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30.0,
                            fontFamily: 'Futura',
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.0,
                        ),
                      ),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width/4,),
                    PopupMenuButton<Choice>(
                      icon: new Icon(Icons.more_vert, color: Colors.grey),
                      onSelected: _select,
                      itemBuilder: (BuildContext context) {
                        return choices.skip(2).map((Choice choice) {
                          return PopupMenuItem<Choice>(
                            value: choice,
                            child: Text(choice.title),
                          );
                        }).toList();
                      },
                    ),
                  ],
                ),                
              ],
            ),  
          ),
        )
      ),
      body: new Center(
        child: Column(
          children: <Widget>[
            SizedBox(height: 30.0,),
            Stack(
              overflow: Overflow.visible,
              children: <Widget>[
                new CircleAvatar(
                  backgroundImage: AssetImage("assets/aus.png"),
                  backgroundColor: Colors.transparent,
                  radius: 70.0,
                ),
                new Positioned(
                  right: -15.0,
                  bottom: 0.0,
                  child: Material(
                    color: Colors.transparent,
                    child: Ink(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 4.0),
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: InkWell(
                        //This keeps the splash effect within the circle
                        borderRadius: BorderRadius.circular(1000.0), //Something large to ensure a circle
                        onTap: null,
                        child: Padding(
                          padding:EdgeInsets.all(9.0),
                          child: Icon(
                            Icons.camera_alt,
                            size: 25.0,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15.0),
            new Text("sweatglenns",
              style: TextStyle(
                  color: Color(getColorHexFromStr("#606060")),
                  fontSize: 20.0,
                  fontFamily: 'Futura',            
              ),
            ),
            SizedBox(height:10.0),
            new InkWell(
              onTap: () => print('hello'),
              child: new Container(
                width: MediaQuery.of(context).size.width/3,
                height: 50.0,
                decoration: new BoxDecoration(
                  color: Colors.white,
                  border: new Border.all(color: Color(getColorHexFromStr("#DFDFDF")), width: 3.0),
                  borderRadius: new BorderRadius.circular(25.0),
                ),
                child: new Center(
                  child: new Text(
                    'Edit Profile', 
                    style: new TextStyle(
                      fontSize: 18.0, 
                      fontFamily: 'Futura',
                      color: Colors.grey
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width/3,
                  child: _buildVotes("191", "UPVOTES")
                ),
                SizedBox(width:MediaQuery.of(context).size.width/10),
                Container(
                  width: MediaQuery.of(context).size.width/3,
                  child: _buildVotes("26", "DOWNVOTES")
                ),
              ],
            ),
            SizedBox(height:10.0),
            new Divider(
              color: Colors.grey,
              height: 30.0,
              indent: 20.0,
            ),
            new Container(
              width: MediaQuery.of(context).size.width/1.3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _nameDisp("First Name", "Glenn", 80.0),
                  SizedBox(width: MediaQuery.of(context).size.width/3),
                  _nameDisp("Last Name", "Chia", 80.0),
                ],
              ),
            ),
            new Divider(
              color: Colors.grey,
              height: 30.0,
              indent: 20.0,
            ),
            new Container(
              width: MediaQuery.of(context).size.width/1.3,
              child: _nameDisp("Class", "F01", 320.0),
            )
            
          ],
        ),
      )
    );
  }
  Widget _buildVotes(voteCount, voteType){
    return new Column(
      children: <Widget>[
        new Text(
          voteCount,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Color(getColorHexFromStr("#606060")),
              fontSize: 20.0,
              fontFamily: 'QuickSand',
              ),
          //color: Colors.black
        ),
        new Text(
          voteType,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Color(getColorHexFromStr("#606060")),
              fontSize: 13.0,
              fontFamily: 'QuickSand',
              ),
          //color: Colors.black
        ),
      ],
    );
  } 
Widget _nameDisp(labelText, nameText, width){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      new Text(
        labelText,
        textAlign: TextAlign.left,
        style:TextStyle(
          color: Color(getColorHexFromStr("#A6A6A6")),
          fontSize: 13.0,
        )
      ),
      SizedBox(
        width:width, 
        child: TextField(
          autofocus: false,
          style:TextStyle(
            color: Color(getColorHexFromStr("#606060")),
            fontSize: 13.0,
          ),
          decoration: InputDecoration(
          border: UnderlineInputBorder(borderSide: BorderSide(color: Color(getColorHexFromStr("#A6A6A6")))),
          //focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.cyan)),
          hintText: nameText
          ),
        ),
      ),
        
      //   // nameText,
      //   // textAlign: TextAlign.left,
      //   // style:TextStyle(
      //   //   color: Color(getColorHexFromStr("#606060")),
      //   //   fontSize: 13.0,
      //   // )
      //),
      new Divider(),
    ],
  );
}
}
class Choice {
  const Choice({this.title, this.icon});

  final String title;
  final IconData icon;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'Car', icon: Icons.directions_car),
  const Choice(title: 'Bicycle', icon: Icons.directions_bike),
  const Choice(title: 'Boat', icon: Icons.directions_boat),
  const Choice(title: 'Bus', icon: Icons.directions_bus),
  const Choice(title: 'Train', icon: Icons.directions_railway),
  const Choice(title: 'Walk', icon: Icons.directions_walk),
];

class ChoiceCard extends StatelessWidget {
  const ChoiceCard({Key key, this.choice}) : super(key: key);

  final Choice choice;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.display1;
    return Card(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(choice.icon, size: 128.0, color: textStyle.color),
            Text(choice.title, style: textStyle),
          ],
        ),
      ),
    );
  }
}
