import 'package:boardify_main/pages/boardview_nav.dart';
import 'package:flutter/material.dart';
import './boardview_nav.dart';

class Notifications extends StatefulWidget{
  @override
  _Notifications createState() => _Notifications();

  // final String pageText;

  // const Notifications({Key key, this.pageText}): super(key: key);

}

class _Notifications extends State<Notifications>{

  Choice _selectedChoice = choices[0]; // The app's "state".
  List<String> litems = ["Cohort 1", "Cohort 2", "Lecture"];
  List notif_ls = [["assets/aus.png", "pencillead", "mentioned you in a comment: @Glenn you are so cool", "assets/board1.png"], 
                    ["assets/physics.jpg", "Physics - Week 1 - Cohort 1", "was updated", "assets/board1.png"],
                    ["assets/physics.jpg", "Physics - Week 1 - Cohort 1", "was updated", ""],
                    ];
  // final String pageText;

  // _Notifications(this.pageText);

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
          //automaticallyImplyLeading: false, // hides leading widget
          flexibleSpace: new Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height:20.0),
                Row(
                  children: <Widget>[ 
                    SizedBox(width: MediaQuery.of(context).size.width/20,),
                    Container(
                      width: MediaQuery.of(context).size.width/2,
                      child: Text("Notifications",
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
      body:
      Container(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverList(
              delegate: SliverChildBuilderDelegate((BuildContext context, int index){
                return _indivNotifications(notif_ls[index][0], notif_ls[index][1], notif_ls[index][2], notif_ls[index][3]);
              },
              childCount: notif_ls.length,
                // [
                //   ListView.builder(
                //     itemCount: notif_ls.length,
                //     itemBuilder: (context, index){
                //     },
                //   ),
                // ]
              ),
            )
          ],
        ),
      )
    );
  }
  Widget _indivNotifications(dp, name, text, image){
    if(dp != ""){
      return Container(
      padding: EdgeInsets.all(15.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        new CircleAvatar(
          backgroundImage: AssetImage(dp),
          radius: 25.0,
        ),
        SizedBox(width: 10.0,),
        new Container(
          height: 45.0,
          width: MediaQuery.of(context).size.width/1.8,
          //decoration: BoxDecoration(border: Border.all(color: Colors.cyan)),
          child: RichText(
            text: new TextSpan(
              // Note: Styles for TextSpans must be explicitly defined.
              // Child text spans will inherit styles from parent
              style: new TextStyle(
                fontSize: 14.0,
                color: Colors.black,
              ),
              children: <TextSpan>[
                new TextSpan(text: name, style: new TextStyle(fontWeight: FontWeight.bold)),
                new TextSpan(text: " "),
                new TextSpan(text: text),
                //new TextSpan(text: 'World', style: new TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ),
        SizedBox(width: MediaQuery.of(context).size.width/20,),
        Container(
          height: 60.0,
          width: MediaQuery.of(context).size.width/7,
          decoration: new BoxDecoration(
            image: DecorationImage(
              image: new AssetImage(image),
              fit: BoxFit.fill,
            ),
            shape: BoxShape.rectangle,
          ),
        ),
      ],
    )
    );
    }
    else{
      return Container(
      padding: EdgeInsets.all(15.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        new CircleAvatar(
          // backgroundImage: AssetImage(dp),
          backgroundColor: Colors.blue,
          radius: 25.0,
        ),
        SizedBox(width: 10.0,),
        new Container(
          height: 45.0,
          width: MediaQuery.of(context).size.width/1.8,
          //decoration: BoxDecoration(border: Border.all(color: Colors.cyan)),
          child: RichText(
            text: new TextSpan(
              // Note: Styles for TextSpans must be explicitly defined.
              // Child text spans will inherit styles from parent
              style: new TextStyle(
                fontSize: 14.0,
                color: Colors.black,
              ),
              children: <TextSpan>[
                new TextSpan(text: name, style: new TextStyle(fontWeight: FontWeight.bold)),
                new TextSpan(text: " "),
                new TextSpan(text: text),
                //new TextSpan(text: 'World', style: new TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ),
        SizedBox(width: MediaQuery.of(context).size.width/20,),
        Container(
          height: 60.0,
          width: MediaQuery.of(context).size.width/7,
          decoration: new BoxDecoration(
            image: DecorationImage(
              image: new AssetImage(image),
              fit: BoxFit.fill,
            ),
            shape: BoxShape.rectangle,
          ),
        ),
      ],
    )
    );
    }
    
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