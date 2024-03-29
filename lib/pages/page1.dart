import 'package:boardify_main/pages/leaderboard_nav.dart';
import 'package:boardify_main/pages/my_profile_page_nav.dart';
import 'package:flutter/material.dart';
import './my_profile_page.dart';
import './subjects.dart';
import './subjects_nav.dart';
import './see_all_subjects_nav.dart';
import './leaderboard_nav.dart';

class Pageone extends StatefulWidget{
  @override
  _Pageone createState() => _Pageone();
}

class _Pageone extends State<Pageone>{
  List test_ls =[
        ["Physics", "10 Boards", "assets/physics.jpg"],
        ["Chemistry", "10 Boards", "assets/chem.jpg"],
        ["Biology", "40 Boards", "assets/bio.jpg"],
      ];
    
  List recents_ls = [
    ["Chemistry 11/5/19 13:01","assets/board2.png"],
    ["Physics 23/1/19 08:51","assets/board1.png"],
    ["Chemistry 11/5/19 13:01","assets/board2.png"],
    ["Physics 23/1/19 08:51","assets/board1.png"],
    ["Chemistry 11/5/19 13:01","assets/board2.png"],
    ["Physics 23/1/19 08:51","assets/board1.png"],
  ];
  List subjects = ["physics","math","econs","chemistry"];//new List();
  List filterSubjects = ["physics","math","econs","chemistry"];// new List();

  String currentProfilePic = "https://images.unsplash.com/photo-1503875154399-95d2b151e3b0?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60";

  Icon _searchIcon = new Icon(Icons.search);
  Widget _appBarTitle = new Text( 'Search Example' );

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();


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
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
          title: new TextField(
            decoration: new InputDecoration(
                hintText: 'Search...',
                suffixIcon: _searchIcon,
//                border: new OutlineInputBorder(
//                  borderRadius: new BorderRadius.circular(25.0),
////                  borderSide: new BorderSide(
////                  ),
//                ),
            ),
          ),
          // See if we can somehow add a container here and a search bar inside
            backgroundColor: Colors.transparent,
            elevation: 0.0,
          leading: IconButton(
            icon: Icon(Icons.menu, color: Colors.grey),
            onPressed: () => _scaffoldKey.currentState.openDrawer(),
          ),
      ),
drawer: new Drawer(
          child: new ListView(
            children: <Widget>[
              Center(
                  child: new Column(
                    children: <Widget>[
                      SizedBox(height:30),
                      new DrawerHeader(
                          child: new CircleAvatar(
                            // backgroundImage: NetworkImage(currentProfilePic),
                            backgroundImage: AssetImage("assets/aus.png"),
                            backgroundColor: Colors.transparent,
                            radius: 70.0,
                          )
                      ),
                      new Text(
                        "Sweatglenns",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color(getColorHexFromStr("#606060")),
                            fontSize: 20.0,
                            fontFamily: 'QuickSand',
                            fontWeight: FontWeight.bold),
                            //color: Colors.black,

                      ),
                      SizedBox(height:20.0),
                      new Row(
                        children: <Widget>[
                          SizedBox(width: 40.0),
                          Column(
                            children: <Widget>[
                              new Text(
                                "191",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Color(getColorHexFromStr("#606060")),
                                    fontSize: 25.0,
                                    fontFamily: 'QuickSand',
                                    ),
                                //color: Colors.black
                              ),
                              new Text(
                                "UPVOTES",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Color(getColorHexFromStr("#606060")),
                                    fontSize: 15.0,
                                    fontFamily: 'QuickSand',
                                    ),
                                //color: Colors.black
                              ),
                            ],
                          ),
                          SizedBox(width:70.0),
                          Column(
                            children: <Widget>[
                              new Text(
                                "26",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Color(getColorHexFromStr("#606060")),
                                    fontSize: 25.0,
                                    fontFamily: 'QuickSand',
                                    ),
                              ),
                              new Text(
                                "DOWNVOTES",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(getColorHexFromStr("#606060")),
                                  fontSize: 15.0,
                                  fontFamily: 'QuickSand',
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  )
              ),
              new Divider(),
              _buildTile("My Profile","Profile"),
              _buildTile("Notifications","Notifications"),
              _buildTileLeader("Leaderboard","Leaderboard"),
              _buildTile("Recents","Recents"),
              _buildTile("Starred","Starred"),
              _buildTile("Settings","Settings"),
              _buildTile("Help","Help"),
              _buildTile("Logout","Logout"),
              new Divider(),
              new ListTile(
                  dense: true,
                  title: new Text("Close"),
                  trailing: new Icon(Icons.cancel),
                  onTap: () {
                    Navigator.of(context).pop();
                  }
              ),// ListTile
            ], // widget[]
          ),  // listView
        ),
      body: 
      Container(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  SizedBox(height: 10.0),
                  _buildRow(context, "My Classes", "See All", "blank"),
                ]
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                height: 200.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: test_ls.length,
                  itemBuilder: (context, index) {
                   return _buildCard(context, test_ls[index][0], test_ls[index][1], test_ls[index][2]);
                  },
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  SizedBox(height: 10.0),
                  Divider(
                    height:20.0,
                    color: Colors.black,
                  ),
                  _buildRow(context, "Recently Viewed", "See All", "blank"),
                ]
              ),
            ),
            SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                //crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
                crossAxisCount: 2,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) => 
                _cardBoardMain(context, index),
                  childCount: recents_ls.length,
              ),
            ),
            // SliverList(
            //   delegate: SliverChildBuilderDelegate(
            //     (BuildContext context, int index) =>
            //     _buildCard(context, test_ls[index][0], test_ls[index][1], test_ls[index][2]),
            //     childCount: test_ls.length,
            //   ),
            // )
          ],
        ),
      )
      // ListView(
      //   children: <Widget>[
      //     SizedBox(height: 10.0),
      //     _buildRow(BuildContext, "My Classes", "See All", "blank"),
      //      Container(
      //        margin: EdgeInsets.symmetric(vertical:10.0),
      //        height: 200,
      //       child: ListView(
      //         scrollDirection: Axis.horizontal,
      //         children: <Widget>[
      //           _buildCard(context, test_ls[0][0], test_ls[0][1], test_ls[0][2]),
      //           _buildCard(context, test_ls[1][0], test_ls[1][1], test_ls[1][2]),
      //           _buildCard(context, test_ls[2][0], test_ls[2][1], test_ls[2][2]),
      //         ],
      //       ), 
      //      ),  
      //     SizedBox(height: 10.0),
      //     Divider(
      //       height:20.0,
      //       color: Colors.black,
      //     ),
      //     _buildRow(BuildContext, "Recently Viewed", "See All", "blank"),
      //       Column(
      //         children: <Widget>[
      //           Row(
      //             children: <Widget>[
      //               _cardBoardMain(context, 0),
      //               _cardBoardMain(context, 1),
      //             ],
      //           ),
      //           Row(
      //             children: <Widget>[
      //               _cardBoardMain(context, 1),
      //             ],
      //           ),
      //         ],
      //       ),
      //   ],
      // ),
    ); 
  }   
  Widget _buildTile(textLabel, newPage){
    return new ListTile(
      dense: true,
      title: new Text(textLabel,
        style: TextStyle(
          color: Color(getColorHexFromStr("#606060")),
          fontFamily: 'QuickSand',),
      ),
      contentPadding: EdgeInsets.only(left: 30.0),
      onTap: () => Navigator.of(context).push(new MaterialPageRoute
        (builder: (BuildContext context) =>
      new ProfilePageNav(newPage)))
    );// ListTile
  }  
   Widget _buildTileLeader(textLabel, newPage){
    return new ListTile(
      dense: true,
      title: new Text(textLabel,
        style: TextStyle(
          color: Color(getColorHexFromStr("#606060")),
          fontFamily: 'QuickSand',),
      ),
      contentPadding: EdgeInsets.only(left: 30.0),
      onTap: () => Navigator.of(context).push(new MaterialPageRoute
        (builder: (BuildContext context) =>
      new LeaderboardNav(newPage)))
    );// ListTile
  }  
  Widget _buildCard(BuildContext context, firstText, subText, imagePath){
    return new 
    Card(
      color: Colors.white,//Color(getColorHexFromStr("#A6C5F2")),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(new MaterialPageRoute
        (builder: (BuildContext context) =>
          new SubjectsNav()));
        },
      child: Container(
        height: 190.0,
        width: 200.0,
        
        decoration: new BoxDecoration(
          borderRadius: new BorderRadius.circular(20.0),
          // gradient: RadialGradient(
          //         // begin: FractionalOffset.bottomCenter,
          //         // end: FractionalOffset.topCenter,
          //         colors: [
          //           Colors.grey.withOpacity(0.0001),
          //           Colors.black26,
          //         ],
          //         stops: [
          //           0.1,
          //           1.0
          //         ]),
          image: DecorationImage(
            //image: new NetworkImage("https://images.unsplash.com/photo-1503875154399-95d2b151e3b0?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
            image: new AssetImage(imagePath),
            colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.4), BlendMode.dstATop),
            
            fit: BoxFit.fill,
          ),
          shape: BoxShape.rectangle,
        ),
        alignment: Alignment.bottomCenter,
        padding: new EdgeInsets.only(top: 140.0),
        child: new Column(
          children: <Widget>[
            new Text(firstText,
              style: TextStyle(
                color: Color(getColorHexFromStr("#606060")),
                fontSize: 18.0,
                fontFamily: 'QuickSand Bold',
                fontWeight: FontWeight.bold,
              ),
            ),
            new Text(subText,
              style: TextStyle(
                color: Color(getColorHexFromStr("#606060")),
                fontSize: 15.0,
                fontFamily: 'QuickSand Bold',
              ),
            ),
          ],
        ) 
      ),
      ),
    );
  }  // widget
  Widget _buildRow(BuildContext context, firstText, secondText, linkPage){
    return new
    Row(
      //mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        SizedBox(width: 30.0,),
        Container(
          width: MediaQuery.of(context).size.width/2,
          child: Text(
            firstText,
            style: TextStyle(
              color: Color(getColorHexFromStr("#606060")),
              fontSize: 23.0,
              fontFamily: 'Futura',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(width:MediaQuery.of(context).size.width/6),
        FlatButton(
            color: Colors.transparent,
            onPressed: () => Navigator.push(context, new MaterialPageRoute
                (builder: (BuildContext context) => new SeeAllSubNav("REPLACE THIS WITH USER ID"))),
            child: Row(
              children: <Widget>[
                Text(
                  secondText,
                  style: TextStyle(
                    color: Color(getColorHexFromStr("#606060")),
                    fontSize: 15.0,
                    fontFamily: 'Futura',
                  ),
                ),
                Icon(Icons.chevron_right),
              ],
            )
        ),
      ],
    );
  }
  Widget _horiListView(BuildContext context){
    
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: test_ls.length,
      itemBuilder: (context, index) {
      return _buildCard(context, test_ls[index][0], test_ls[index][1], test_ls[index][0]);        
        },
    );
  }
  Widget _cardBoardMain(BuildContext context, index){
    return Card(
      elevation: 0.0,
      //color: Color(getColorHexFromStr("#C5B7E8")),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 14.0),
          Container(
            height: 126.0,
            width: 180.0,
            decoration: new BoxDecoration(
              borderRadius: new BorderRadius.circular(10.0),
              border: Border.all(
                  width: 10, //
                  color: Color(getColorHexFromStr("#D7D7D7"))
              ),
              image: DecorationImage(
                image: new AssetImage(recents_ls[index][1]),
                fit: BoxFit.fill,
              ),
              shape: BoxShape.rectangle,
            ),
          ),
          new SizedBox(height:10.0),
          new Row(
            //mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              //new SizedBox(width: 45,),
              new Text(recents_ls[index][0],
              style: TextStyle(
                color: Color(getColorHexFromStr("#606060")),
                fontSize: 10.0,
                fontFamily: 'QuickSand',
                fontWeight: FontWeight.bold,
              ),
            ),
            new SizedBox(width: 25,),
            new Icon(Icons.more_vert, color: Colors.grey)
              ],
          ),
        ],
      )
    );
  }
}