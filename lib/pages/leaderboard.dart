import 'package:boardify_main/pages/boardview_nav.dart';
import 'package:flutter/material.dart';
import './boardview_nav.dart';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';

class Leaderboard extends StatefulWidget{
  @override
  _Leaderboard createState() => _Leaderboard();
  
  // final String pageText;

  // const Leaderboard({Key key, this.pageText}): super(key: key);

}

class _Leaderboard extends State<Leaderboard>{

  Choice _selectedChoice = choices[0]; // The app's "state".
  List<String> litems = ["Cohort 1", "Cohort 2", "Lecture"];
  List sub_ls = [["1", "assets/physics.png", "pencillead", 190, false, 3, true], 
                    ["2","assets/bio.jpg", "xiao", 190, true, 3, false],
                    ["3","assets/math.jpg", "zhao", 190, false, 3, true],
                    ];
  bool isSwitched = true;
  String dropdownValue = 'Date';
  // final String pageText;

  // _Leaderboard(this.pageText);

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
                      icon: Icon(Icons.arrow_back_ios, color: Colors.grey),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),  
                    SizedBox(width: MediaQuery.of(context).size.width/40,),
                    Container(
                      width: MediaQuery.of(context).size.width/1.4,
                      child: Text("Leaderboard",
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
                            Tab(icon: Text("Friends",
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
                ], 
              ),
              new Container(
                height: 60.0,
                child:  Row(
                  children: <Widget>[
                    SizedBox(width: MediaQuery.of(context).size.width/8),
                    Text("17",
                    style: TextStyle(
                      color: Color(getColorHexFromStr("#606060")),
                      fontSize: 20.0,
                      fontFamily: 'Futura',
                      ),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width/24),
                    new CircleAvatar(
                        backgroundImage: AssetImage("assets/aus.png"),
                        backgroundColor: Colors.transparent,
                        radius: 25.0,
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width/24),
                    Text("sweatglenns",
                    style: TextStyle(
                      color: Color(getColorHexFromStr("#606060")),
                      fontSize: 20.0,
                      fontFamily: 'Futura',
                      ),
                    ),
                    SizedBox(
                      width: 30.0,
                      child:  IconButton(
                        // icon: (notif_ls[index][3]  ? Icon(Icons.favorite) : Icon(Icons.favorite_border)),
                        // color: Colors.red[500],
                        // onPressed: _toggleFavorite,
                        icon: Icon(Icons.change_history)
                      ),
                    ),
                    Text("191"),//likeCount.toString()),
                    SizedBox(
                      width: 30.0,
                      child: 
                      IconButton(
                          // icon: (notif_ls[index][3]  ? Icon(Icons.favorite) : Icon(Icons.favorite_border)),
                          // color: Colors.red[500],
                          // onPressed: _toggleFavorite,
                          icon: Icon(Icons.details)
                      ),
                    ),                    
                    Text("26")//dislikeCount.toString()),
                  ],
                ),
              ),
              new Container(
                padding: EdgeInsets.only(left:20.0, right:20.0),
                child: Divider(color: Colors.grey, height: 5.0,),
              ),
              
              new Expanded(child: TabBarView(
            children: [
              CustomScrollView(
                slivers: <Widget>[
                  SliverList(
                    delegate: SliverChildBuilderDelegate((BuildContext context, int index){
                      return _leaderboardList(sub_ls[index][0], sub_ls[index][1], sub_ls[index][2],  sub_ls[index][3],  sub_ls[index][4], sub_ls[index][5], sub_ls[index][6], index);
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
  Widget _leaderboardList(rank, dp, name, likeCount, likeState, dislikeCount, dislikeState, index){
    void _toggleLike() {
      setState(() {
        if (sub_ls[index][4]) {
          sub_ls[index][4] = false;
          sub_ls[index][3] = sub_ls[index][3] - 1;
        } else {
          sub_ls[index][4] = true;
          sub_ls[index][3] = sub_ls[index][3] + 1;
        }
      });
    }
    void _toggleDislike() {
      setState(() {
        if (sub_ls[index][6]) {
          sub_ls[index][6] = false;
          sub_ls[index][5] = sub_ls[index][5] - 1;
        } else {
          sub_ls[index][6] = true;
          sub_ls[index][5] = sub_ls[index][5] + 1;
        }
      });
    }
    
    if(dp != ""){
      return Container(
        padding: EdgeInsets.only(top: 15.0),
        child: Column(
          children: <Widget>[
            new Row(
              mainAxisAlignment: MainAxisAlignment.start,
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(width: MediaQuery.of(context).size.width/18),
                Text(rank,
                style: TextStyle(
                  color: Color(getColorHexFromStr("#606060")),
                  fontSize: 20.0,
                  fontFamily: 'Futura',
                  ),
                ),
                SizedBox(width: MediaQuery.of(context).size.width/24),
                new CircleAvatar(
                    backgroundImage: AssetImage(dp),
                    backgroundColor: Colors.transparent,
                    radius: 25.0,
                ),
                SizedBox(width: MediaQuery.of(context).size.width/24),
                Container(
                  width: MediaQuery.of(context).size.width/2.5,
                  child: Text(name,
                    style: TextStyle(
                      color: Color(getColorHexFromStr("#606060")),
                      fontSize: 20.0,
                      fontFamily: 'Futura',
                      ),
                  ),   
                ),
                SizedBox(
                  width: 30.0,
                  child: IconButton(
                    icon: (sub_ls[index][4]  ? 
                      Icon(Icons.change_history,color: Colors.blue[500],) : 
                      Icon(Icons.change_history)), 
                      onPressed: _toggleLike,
                      ),
                ),
                Text(likeCount.toString()),
                SizedBox(
                  width: 30.0,
                  child: 
                  IconButton(
                    icon: (sub_ls[index][6]  ? 
                    Icon(Icons.details,color: Colors.red[500],) : Icon(Icons.details)),
                    onPressed: _toggleDislike,
                ),
                ),                    
                Text(dislikeCount.toString()),
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
            new Row(
              mainAxisAlignment: MainAxisAlignment.start,
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(width: MediaQuery.of(context).size.width/18),
                Text(rank,
                style: TextStyle(
                  color: Color(getColorHexFromStr("#606060")),
                  fontSize: 20.0,
                  fontFamily: 'Futura',
                  ),
                ),
                SizedBox(width: MediaQuery.of(context).size.width/24),
                new CircleAvatar(
                  // backgroundImage: AssetImage(dp),
                  backgroundColor: Colors.blue,
                  radius: 25.0,
                ),
                SizedBox(width: MediaQuery.of(context).size.width/24),
                Container(
                  width: MediaQuery.of(context).size.width/2.5,
                  child: Text(name,
                    style: TextStyle(
                      color: Color(getColorHexFromStr("#606060")),
                      fontSize: 20.0,
                      fontFamily: 'Futura',
                      ),
                  ),   
                ),
                SizedBox(
                  width: 30.0,
                  child: IconButton(
                    icon: (sub_ls[index][4]  ? 
                      Icon(Icons.change_history,color: Colors.blue[500],) : 
                      Icon(Icons.change_history)), 
                      onPressed: _toggleLike,
                      ),
                ),
                Text(likeCount.toString()),
                SizedBox(
                  width: 30.0,
                  child: 
                  IconButton(
                    icon: (sub_ls[index][6]  ? 
                    Icon(Icons.details,color: Colors.red[500],) : Icon(Icons.details)),
                    onPressed: _toggleDislike,
                ),
                ),                    
                Text(dislikeCount.toString()),
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