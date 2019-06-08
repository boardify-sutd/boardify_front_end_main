import 'package:flutter/material.dart';
import './page2.dart';

class Week extends StatefulWidget{
  @override
  _Week createState() => _Week();

  // final String pageText;

  // const Week({Key key, this.pageText}): super(key: key);

}

class _Week extends State<Week>{

  Choice _selectedChoice = choices[0]; // The app's "state".
  List<String> litems = ["Cohort 1", "Cohort 2", "Lecture"];
  // final String pageText;

  // _Week(this.pageText);

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
                    Text("Week 1",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30.0,
                          fontFamily: 'Futura',
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.0,
                      ),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width/2.7,),
                    IconButton(
                      icon: Icon(Icons.search, color: Colors.grey),
                      onPressed: null,//() {
                        //_select(choices[0]);
                      //},
                    ),
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
      OrientationBuilder(
        builder: (context, orientation) {
          return  new ListView.builder
              (
                itemCount: litems.length,
                itemBuilder: (BuildContext ctxt, int Index) {
                  return week_card(litems[Index]);
                }
            );
        //);
          // return ListView(
          //   children: <Widget>[
          //     week_card("Week 1"),
          //     week_card("Week 2")
          //   ],
          // );
          
        },
      ),
    );  // Scaffold
  }
  Widget week_card(week){
    return new Container(
      height: 100.0,
      decoration:
        new BoxDecoration(
            border: Border.all(
              color: Colors.grey,
              width: 0.2,
            ),
        ),
      child: ListTile(
        dense: false,
        title: Center(
          child: Text(week,
            style: TextStyle(
                color: Color(getColorHexFromStr("#606060")),
                fontSize: 20.0,
                fontFamily: 'Futura',            
            ),
          ),
        ),
      onTap: () { 
        Navigator.of(context).push(new MaterialPageRoute
        (builder: (BuildContext context) =>
      new Pagetwo()));
      }
    ),
    alignment: Alignment(0.0, 0.0),
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