import 'package:boardify_main/pages/boardview_nav.dart';
import 'package:flutter/material.dart';
import './boardview_nav.dart';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';

class SeeAllSubjects extends StatefulWidget{
  @override
  _SeeAllSubjects createState() => _SeeAllSubjects();
  
  // final String pageText;

  // const SeeAllSubjects({Key key, this.pageText}): super(key: key);

}

class _SeeAllSubjects extends State<SeeAllSubjects>{

  Choice _selectedChoice = choices[0]; // The app's "state".
  List<String> litems = ["Cohort 1", "Cohort 2", "Lecture"];
  List sub_ls = [["assets/physics.png", "Physics", "Prof Alex"], 
                    ["assets/bio.jpg", "Chemistry", "Prof Xiao"],
                    ["assets/math.jpg", "Math", "Prof Glenn"],
                    ];
  bool isSwitched = true;
  String dropdownValue = 'Date';
  // final String pageText;

  // _SeeAllSubjects(this.pageText);

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
                    SizedBox(width: MediaQuery.of(context).size.width/4,),
                    Container(
                      width: MediaQuery.of(context).size.width/2,
                      child: Text("Classes",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30.0,
                            fontFamily: 'Futura',
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.0,
                        ),
                      ),
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
      body: DefaultTabController(
        length: 2,
        child: new Column(
            children: <Widget>[
              new Row(
                children: <Widget>[
                  Container(
                    constraints: BoxConstraints(maxHeight: 50.0),
                    child: Align (
                      alignment: Alignment.centerLeft,
                      child: Material(
                      color: Colors.white,
                        child: new TabBar(
                          isScrollable: true,
                          labelColor: Colors.white,
                          indicatorColor: Colors.grey,
                          unselectedLabelColor: Colors.grey,
                          labelPadding: EdgeInsets.only(right: 10.0, left: 10.0),
                          indicatorSize: TabBarIndicatorSize.label,
                          indicator: new BubbleTabIndicator(
                            indicatorHeight: 25.0,
                            indicatorColor: Colors.blueAccent,
                            tabBarIndicatorSize: TabBarIndicatorSize.label,
                          ),
                          tabs: [
                            Tab(icon: Text("     All     ",
                              style: TextStyle(
                                //color: Colors.grey,
                                fontSize: 15.0,
                                fontFamily: 'Futura',
                              ),
                              )
                            ),
                            Tab(icon: Text("Focused",
                              style: TextStyle(
                                //color: Colors.grey,
                                fontSize: 15.0,
                                fontFamily: 'Futura',
                              ),
                              )
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                   SizedBox(width: MediaQuery.of(context).size.width/2.5),
                      new Container(
                        margin: new EdgeInsets.only(top: 2.0),
                        decoration: new BoxDecoration(
                          color: Color(getColorHexFromStr("#D7D7D7")),
                          borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
                        ),
                        child: 
                          DropdownButton<String>(
                            isDense: true,
                            value: dropdownValue,
                            onChanged: (String newValue) {
                              setState(() {
                                dropdownValue = newValue;
                              });
                            },
                            items: <String>['Date', 'Likes', 'Comments']
                              .map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Row(
                                    children: <Widget>[
                                      SizedBox(width:8.0),
                                      Text(value,
                                        style: TextStyle(
                                          color: Color(getColorHexFromStr("#606060")),
                                          fontSize: 15.0,
                                          fontFamily: 'Futura',
                                          //fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                  ],
                                )
                              );
                            })
                            .toList(),
                        ),
                      ),
                  Divider(height: 1, color: Colors.black,),////////
                ], ///// ROWWWWWW
              ),
              new Expanded(child: TabBarView(
            children: [
              CustomScrollView(
                slivers: <Widget>[
                  SliverList(
                    delegate: SliverChildBuilderDelegate((BuildContext context, int index){
                      return _indivNotifications(sub_ls[index][0], sub_ls[index][1], sub_ls[index][2]);
                    },
                    childCount: sub_ls.length,
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
              //Icon(Icons.directions_car),
              Icon(Icons.directions_transit),
            ],
          )
          )
            ],
        )
      
      ),
    );
    
  }
  Widget _indivNotifications(dp, subjects, prof){
    if(dp != ""){
      return Container(
        padding: EdgeInsets.only(top: 15.0, left: 15.0, right: 15.0),
        child: Column(
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                new CircleAvatar(
                  backgroundImage: AssetImage(dp),
                  radius: 25.0,
                ),
                SizedBox(width: 10.0,),
                new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Row(
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width/2,
                          child:Text(
                            subjects,
                            style: TextStyle(
                              color: Color(getColorHexFromStr("#606060")),
                              fontSize: 23.0,
                              fontFamily: 'Futura',
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),      
                        SizedBox(width: MediaQuery.of(context).size.width/5,),
                        new Icon(Icons.more_vert, color: Colors.grey)
                      ],
                    ),
                    Text(
                      prof,
                      style: TextStyle(
                        color: Color(getColorHexFromStr("#B8B8B8")),
                        fontSize: 15.0,
                        fontFamily: 'Futura',
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 15.0,),
            Divider(height:1, color: Colors.black,)
          ],
        )
      );
    }
    else{
      return Container(
        padding: EdgeInsets.only(top: 15.0, left: 15.0, right: 15.0),
        child: Column(
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
               new CircleAvatar(
                  // backgroundImage: AssetImage(dp),
                  backgroundColor: Colors.blue,
                  radius: 25.0,
                ),
                SizedBox(width: 10.0,),
                new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Row(
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width/2,
                          child:Text(
                            subjects,
                            style: TextStyle(
                              color: Color(getColorHexFromStr("#606060")),
                              fontSize: 23.0,
                              fontFamily: 'Futura',
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),      
                        SizedBox(width: MediaQuery.of(context).size.width/5,),
                        new Icon(Icons.more_vert, color: Colors.grey)
                      ],
                    ),
                    Text(
                      prof,
                      style: TextStyle(
                        color: Color(getColorHexFromStr("#B8B8B8")),
                        fontSize: 15.0,
                        fontFamily: 'Futura',
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 15.0,),
            Divider(height:1, color: Colors.black,)
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