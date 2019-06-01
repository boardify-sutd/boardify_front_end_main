import 'package:flutter/material.dart';
import './my_profile_page.dart';
import './page1.dart';
import './page2.dart';
import './page3.dart';
import './page4.dart';
import './board.dart';



class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage>{
  final TextEditingController _filter = new TextEditingController();
  String _searchText = "";
  List names = ["physics","math","econs","chemistry"];//new List();
  List filteredNames = ["physics","math","econs","chemistry"];// new List();
  _HomePageState() {
    _filter.addListener(() {
      if (_filter.text.isEmpty) {
        setState(() {
          _searchText = "";
          filteredNames = names;
        });
      } else {
        setState(() {
          _searchText = _filter.text;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
  }

  String currentProfilePic = "https://images.unsplash.com/photo-1503875154399-95d2b151e3b0?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60";

  Icon _searchIcon = new Icon(Icons.search);
  Widget _appBarTitle = new Text( 'Search Example' );

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  int _currentIndex = 0;
  Widget callPage(int currentIndex){
    switch (currentIndex){
      case 0:
        return Pageone();
      case 1:
        return Pagetwo();
      case 2:
        return Pagethree();
      case 3:
        return Board();//Pagefour();
        break;
      default:
        return Pageone();
    }
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
        key: _scaffoldKey,
        backgroundColor: Colors.white,
        //appBar: _buildBar(context),
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
//          actions: <Widget>[
//            IconButton(
//              icon: _searchIcon,
//            )
//          ],

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
              new ListTile(
                  dense: true,
                  title: new Text("My Profile",
                    style: TextStyle(
                    color: Color(getColorHexFromStr("#606060")),
                    fontFamily: 'QuickSand',),
                  ),
                  contentPadding: EdgeInsets.only(left: 30.0),
                  onTap: () => Navigator.of(context).push(new MaterialPageRoute
                    (builder: (BuildContext context) =>
                  new ProfilePage("Profile Page")))
              ),// ListTile
              new ListTile(
                  dense: true,
                  title: new Text("Notifications",
                    style: TextStyle(
                      color: Color(getColorHexFromStr("#606060")),
                      fontFamily: 'QuickSand',),
                  ),
                  contentPadding: EdgeInsets.only(left: 30.0),
                  onTap: () {
                    //Navigator.of(context).pop();
                    Navigator.of(context).push(new MaterialPageRoute
                      (builder: (BuildContext context) =>
                    new ProfilePage("Notifications")));
                  }
              ),// ListTile
              new ListTile(
                  dense: true,
                  title: new Text("Leaderboard",
                    style: TextStyle(
                      color: Color(getColorHexFromStr("#606060")),
                      fontFamily: 'QuickSand',),
                  ),
                  contentPadding: EdgeInsets.only(left: 30.0),
                  onTap: () => Navigator.of(context).push(new MaterialPageRoute
                    (builder: (BuildContext context) =>
                  new ProfilePage("Leaderboard")))
              ),// ListTile
              new ListTile(
                  dense: true,
                  title: new Text("Recents",
                    style: TextStyle(
                      color: Color(getColorHexFromStr("#606060")),
                      fontFamily: 'QuickSand',),
                  ),
                  contentPadding: EdgeInsets.only(left: 30.0),
                  onTap: () => Navigator.of(context).push(new MaterialPageRoute
                    (builder: (BuildContext context) =>
                  new ProfilePage("Recents")))
              ),// ListTile
              new ListTile(
                  dense: true,
                  title: new Text("Starred",
                    style: TextStyle(
                      color: Color(getColorHexFromStr("#606060")),
                      fontFamily: 'QuickSand',),
                  ),
                  contentPadding: EdgeInsets.only(left: 30.0),
                  onTap: () => Navigator.of(context).push(new MaterialPageRoute
                    (builder: (BuildContext context) =>
                  new ProfilePage("Starred")))
              ),// ListTile
              new ListTile(
                  dense: true,
                  title: new Text("Settings",
                    style: TextStyle(
                      color: Color(getColorHexFromStr("#606060")),
                      fontFamily: 'QuickSand',),
                  ),
                  contentPadding: EdgeInsets.only(left: 30.0),
                  onTap: () => Navigator.of(context).push(new MaterialPageRoute
                    (builder: (BuildContext context) =>
                  new ProfilePage("Settings")))
              ),// ListTile
              new ListTile(
                  dense: true,
                  title: new Text("Help",
                    style: TextStyle(
                      color: Color(getColorHexFromStr("#606060")),
                      fontFamily: 'QuickSand',),
                  ),
                  contentPadding: EdgeInsets.only(left: 30.0),
                  onTap: () => Navigator.of(context).push(new MaterialPageRoute
                    (builder: (BuildContext context) =>
                  new ProfilePage("Help")))
              ),// ListTile
              new ListTile(
                  dense: true,
                  title: new Text("Logout",
                    style: TextStyle(
                      color: Color(getColorHexFromStr("#606060")),
                      fontFamily: 'QuickSand',),
                  ),
                  contentPadding: EdgeInsets.only(left: 30.0),
                  onTap: () => Navigator.of(context).push(new MaterialPageRoute
                    (builder: (BuildContext context) =>
                  new ProfilePage("Logout")))
              ),// ListTile
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
        ),  // Drawer
        body: Container(
          child: callPage(_currentIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: _currentIndex,
            onTap: (value){
              _currentIndex=value;
              setState(() {

              });
            },
            // List of bottom nav bar items
            items:[
              BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  title: Text('Home')
              ),  // BottomNavigationBarItem
              BottomNavigationBarItem(
                  icon: Icon(Icons.star),
                  title: Text('Starred')
              ),  // BottomNavigationBarItem
              BottomNavigationBarItem(
                  icon: Icon(Icons.email),
                  title: Text('Messages')
              ),  // BottomNavigationBarItem
              BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  title: Text('Settings')
              ),  // BottomNavigationBarItem
            ]  // items
        ),  // bottomNavigationBar
    );  // Scaffold
  }
  Widget _buildBar(BuildContext context) {
    return new AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      centerTitle: true,
      title: _appBarTitle,
      leading: IconButton(
        icon: Icon(Icons.menu, color: Colors.grey),
        onPressed: () => _scaffoldKey.currentState.openDrawer(),
      ),
      actions: <Widget>[
        IconButton(
          icon: _searchIcon,
        )
      ],
    );

  }

  Widget _buildList() {
    if (!(_searchText.isEmpty)) {
      List tempList = new List();
      for (int i = 0; i < filteredNames.length; i++) {
        if (filteredNames[i]['name'].toLowerCase().contains(_searchText.toLowerCase())) {
          tempList.add(filteredNames[i]);
        }
      }
      filteredNames = tempList;
    }
    return ListView.builder(
      itemCount: names == null ? 0 : filteredNames.length,
      itemBuilder: (BuildContext context, int index) {
        return new ListTile(
          title: Text(filteredNames[index]['name']),
          onTap: () => print(filteredNames[index]['name']),
        );
      },
    );
  }
}
