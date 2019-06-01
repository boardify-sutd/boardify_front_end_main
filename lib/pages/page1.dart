import 'package:flutter/material.dart';
import './my_profile_page.dart';

class Pageone extends StatefulWidget{
  @override
  _Pageone createState() => _Pageone();
}

class _Pageone extends State<Pageone>{

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
      //appBar: _buildBar(context),
      body: //callPage(_currentIndex),
      Column(
        //mainAxisSize: MainAxisSize.max,
        //padding: EdgeInsets.only(top:80.0),
        children: <Widget>[
          SizedBox(height: 10.0),
          Row(
            children: <Widget>[
              SizedBox(width: 30.0),
              Text(
                "My Classes",
                style: TextStyle(
                  color: Color(getColorHexFromStr("#606060")),
                  fontSize: 23.0,
                  fontFamily: 'QuickSand',
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width:130.0),
              FlatButton(
                  color: Colors.transparent,
                  onPressed: null,
                  child: Row(
                    children: <Widget>[
                      Text(
                        "See All",
                        style: TextStyle(
                          color: Color(getColorHexFromStr("#606060")),
                          fontSize: 15.0,
                          fontFamily: 'QuickSand',
                        ),
                      ),
                      Icon(Icons.chevron_right),
                    ],
                  )
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical:10.0),
            height: 200,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                _buildCard(context, "Physics", "10 Boards", "assets/physics.jpg"),
                _buildCard(context, "Chemistry", "10 Boards", "assets/chem.jpg"),
                _buildCard(context, "Biology", "40 Boards", "assets/bio.jpg"),
              ],
            ),  // ListView
          ),  // Container for slidy
          SizedBox(height: 10.0),
          Divider(
            height:20.0,
            color: Colors.black,
            //indent: 10.0,  // for now cannot indent right
          ),
          Row(
            children: <Widget>[
              SizedBox(width: 30.0),
              Text(
                "Recently Viewed",
                style: TextStyle(
                  color: Color(getColorHexFromStr("#606060")),
                  fontSize: 23.0,
                  fontFamily: 'QuickSand',
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width:80.0),
              FlatButton(
                  color: Colors.transparent,
                  onPressed: null,
                  child: Row(
                    children: <Widget>[
                      Text(
                        "See All",
                        style: TextStyle(
                          color: Color(getColorHexFromStr("#606060")),
                          fontSize: 15.0,
                          fontFamily: 'QuickSand',
                        ),
                      ),
                      Icon(Icons.chevron_right),
                    ],
                  )
              ),
            ],
          ),
          Container(
            height: 243,
            child: ListView(
              scrollDirection: Axis.vertical,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          //color: Colors.transparent,
                          width: 195.0,
                          decoration: new BoxDecoration(
                            //borderRadius: new BorderRadius.circular(30.0),
                          ),
                          child:Card(
                              elevation: 0.0,
                              //color: Color(getColorHexFromStr("#C5B7E8")),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Column(
                                children: <Widget>[
                                  SizedBox(height: 14.0),
                                  Container(
                                    height: 130.0,
                                    width: 180.0,
                                    decoration: new BoxDecoration(
                                      borderRadius: new BorderRadius.circular(10.0),
                                      border: Border.all(
                                          width: 10, //
                                          color: Color(getColorHexFromStr("#D7D7D7"))
                                      ),
                                      image: DecorationImage(
                                        image: new AssetImage("assets/board1.png"),
                                        fit: BoxFit.fill,
                                      ),
                                      shape: BoxShape.rectangle,
                                    ),
                                  ),
                                  //SizedBox(height: 10.0),
                                  new ListTile(
                                    dense: true,
                                    title: Text("Physics 23/1/19 08:51",
                                      style: TextStyle(
                                        color: Color(getColorHexFromStr("#606060")),
                                        fontSize: 10.0,
                                        fontFamily: 'QuickSand',
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    trailing: Icon(Icons.more_vert, color: Colors.grey),
                                  ),
                                ],
                              )
                          ),
                        ), // First Card
                        Container(
                          //color: Colors.transparent,
                          width: 195.0,
                          decoration: new BoxDecoration(
                            //borderRadius: new BorderRadius.circular(30.0),
                          ),
                          child:Card(
                              elevation: 0.0,
                              //color: Color(getColorHexFromStr("#C5B7E8")),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Column(
                                children: <Widget>[
                                  SizedBox(height: 14.0),
                                  Container(
                                    height: 130.0,
                                    width: 180.0,
                                    decoration: new BoxDecoration(
                                      borderRadius: new BorderRadius.circular(10.0),
                                      border: Border.all(
                                          width: 10, //
                                          color: Color(getColorHexFromStr("#D7D7D7"))
                                      ),
                                      image: DecorationImage(
                                        //                            image: new AssetImage(
                                        //                                'assets/assets/alucard.jpg'),
                                        //image: new NetworkImage("https://images.unsplash.com/photo-1503875154399-95d2b151e3b0?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
                                        image: new AssetImage("assets/board2.png"),
                                        fit: BoxFit.fill,
                                      ),
                                      shape: BoxShape.rectangle,
                                    ),
                                  ),
                                  //SizedBox(height: 10.0),
                                  new ListTile(
                                    dense: true,
                                    title: Text("Chemistry 11/5/19 13:01",
                                      style: TextStyle(
                                        color: Color(getColorHexFromStr("#606060")),
                                        fontSize: 10.0,
                                        fontFamily: 'QuickSand',
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    trailing: Icon(Icons.more_vert, color: Colors.grey),
                                  ),
                                ],
                              )
                          ),
                        ), // Second Card
                      ],
                    ), // First Row
                    Row(
                      children: <Widget>[
                        Container(
                          //color: Colors.transparent,
                          width: 195.0,
                          decoration: new BoxDecoration(
                            //borderRadius: new BorderRadius.circular(30.0),
                          ),
                          child:Card(
                              elevation: 0.0,
                              //color: Color(getColorHexFromStr("#C5B7E8")),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Column(
                                children: <Widget>[
                                  SizedBox(height: 14.0),
                                  Container(
                                    height: 130.0,
                                    width: 180.0,
                                    decoration: new BoxDecoration(
                                      borderRadius: new BorderRadius.circular(10.0),
                                      border: Border.all(
                                          width: 10, //
                                          color: Color(getColorHexFromStr("#D7D7D7"))
                                      ),
                                      image: DecorationImage(
                                        image: new AssetImage("assets/board1.png"),
                                        fit: BoxFit.fill,
                                      ),
                                      shape: BoxShape.rectangle,
                                    ),
                                  ),
                                  //SizedBox(height: 10.0),
                                  new ListTile(
                                    dense: true,
                                    title: Text("Physics 23/1/19 08:51",
                                      style: TextStyle(
                                        color: Color(getColorHexFromStr("#606060")),
                                        fontSize: 10.0,
                                        fontFamily: 'QuickSand',
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    trailing: Icon(Icons.more_vert, color: Colors.grey),
                                  ),
                                ],
                              )
                          ),
                        ), // First Card
                        Container(
                          //color: Colors.transparent,
                          width: 195.0,
                          decoration: new BoxDecoration(
                            //borderRadius: new BorderRadius.circular(30.0),
                          ),
                          child:Card(
                              elevation: 0.0,
                              //color: Color(getColorHexFromStr("#C5B7E8")),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Column(
                                children: <Widget>[
                                  SizedBox(height: 14.0),
                                  Container(
                                    height: 130.0,
                                    width: 180.0,
                                    decoration: new BoxDecoration(
                                      borderRadius: new BorderRadius.circular(10.0),
                                      border: Border.all(
                                          width: 10, //
                                          color: Color(getColorHexFromStr("#D7D7D7"))
                                      ),
                                      image: DecorationImage(
                                        //                            image: new AssetImage(
                                        //                                'assets/assets/alucard.jpg'),
                                        //image: new NetworkImage("https://images.unsplash.com/photo-1503875154399-95d2b151e3b0?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
                                        image: new AssetImage("assets/board2.png"),
                                        fit: BoxFit.fill,
                                      ),
                                      shape: BoxShape.rectangle,
                                    ),
                                  ),
                                  //SizedBox(height: 10.0),
                                  new ListTile(
                                    dense: true,
                                    title: Text("Chemistry 11/5/19 13:01",
                                      style: TextStyle(
                                        color: Color(getColorHexFromStr("#606060")),
                                        fontSize: 10.0,
                                        fontFamily: 'QuickSand',
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    trailing: Icon(Icons.more_vert, color: Colors.grey),
                                  ),
                                ],
                              )
                          ),
                        ), // Second Card
                      ],
                    ), // Second Row
                    Row(
                      children: <Widget>[
                        Container(
                          //color: Colors.transparent,
                          width: 195.0,
                          decoration: new BoxDecoration(
                            //borderRadius: new BorderRadius.circular(30.0),
                          ),
                          child:Card(
                              elevation: 0.0,
                              //color: Color(getColorHexFromStr("#C5B7E8")),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Column(
                                children: <Widget>[
                                  SizedBox(height: 14.0),
                                  Container(
                                    height: 130.0,
                                    width: 180.0,
                                    decoration: new BoxDecoration(
                                      borderRadius: new BorderRadius.circular(10.0),
                                      border: Border.all(
                                          width: 10, //
                                          color: Color(getColorHexFromStr("#D7D7D7"))
                                      ),
                                      image: DecorationImage(
                                        image: new AssetImage("assets/board1.png"),
                                        fit: BoxFit.fill,
                                      ),
                                      shape: BoxShape.rectangle,
                                    ),
                                  ),
                                  //SizedBox(height: 10.0),
                                  new ListTile(
                                    dense: true,
                                    title: Text("Physics 23/1/19 08:51",
                                      style: TextStyle(
                                        color: Color(getColorHexFromStr("#606060")),
                                        fontSize: 10.0,
                                        fontFamily: 'QuickSand',
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    trailing: Icon(Icons.more_vert, color: Colors.grey),
                                  ),
                                ],
                              )
                          ),
                        ), // First Card
                        Container(
                          //color: Colors.transparent,
                          width: 195.0,
                          decoration: new BoxDecoration(
                            //borderRadius: new BorderRadius.circular(30.0),
                          ),
                          child:Card(
                              elevation: 0.0,
                              //color: Color(getColorHexFromStr("#C5B7E8")),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Column(
                                children: <Widget>[
                                  SizedBox(height: 14.0),
                                  Container(
                                    height: 130.0,
                                    width: 180.0,
                                    decoration: new BoxDecoration(
                                      borderRadius: new BorderRadius.circular(10.0),
                                      border: Border.all(
                                          width: 10, //
                                          color: Color(getColorHexFromStr("#D7D7D7"))
                                      ),
                                      image: DecorationImage(
                                        //                            image: new AssetImage(
                                        //                                'assets/assets/alucard.jpg'),
                                        //image: new NetworkImage("https://images.unsplash.com/photo-1503875154399-95d2b151e3b0?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
                                        image: new AssetImage("assets/board2.png"),
                                        fit: BoxFit.fill,
                                      ),
                                      shape: BoxShape.rectangle,
                                    ),
                                  ),
                                  //SizedBox(height: 10.0),
                                  new ListTile(
                                    dense: true,
                                    title: Text("Chemistry 11/5/19 13:01",
                                      style: TextStyle(
                                        color: Color(getColorHexFromStr("#606060")),
                                        fontSize: 10.0,
                                        fontFamily: 'QuickSand',
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    trailing: Icon(Icons.more_vert, color: Colors.grey),
                                  ),
                                ],
                              )
                          ),
                        ), // Second Card
                      ],
                    ), // Third Row
                    Row(
                      children: <Widget>[
                        Container(
                          //color: Colors.transparent,
                          width: 195.0,
                          decoration: new BoxDecoration(
                            //borderRadius: new BorderRadius.circular(30.0),
                          ),
                          child:Card(
                              elevation: 0.0,
                              //color: Color(getColorHexFromStr("#C5B7E8")),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Column(
                                children: <Widget>[
                                  SizedBox(height: 14.0),
                                  Container(
                                    height: 130.0,
                                    width: 180.0,
                                    decoration: new BoxDecoration(
                                      borderRadius: new BorderRadius.circular(10.0),
                                      border: Border.all(
                                          width: 10, //
                                          color: Color(getColorHexFromStr("#D7D7D7"))
                                      ),
                                      image: DecorationImage(
                                        image: new AssetImage("assets/board1.png"),
                                        fit: BoxFit.fill,
                                      ),
                                      shape: BoxShape.rectangle,
                                    ),
                                  ),
                                  //SizedBox(height: 10.0),
                                  new ListTile(
                                    dense: true,
                                    title: Text("Physics 23/1/19 08:51",
                                      style: TextStyle(
                                        color: Color(getColorHexFromStr("#606060")),
                                        fontSize: 10.0,
                                        fontFamily: 'QuickSand',
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    trailing: Icon(Icons.more_vert, color: Colors.grey),
                                  ),
                                ],
                              )
                          ),
                        ), // First Card
                        Container(
                          //color: Colors.transparent,
                          width: 195.0,
                          decoration: new BoxDecoration(
                            //borderRadius: new BorderRadius.circular(30.0),
                          ),
                          child:Card(
                              elevation: 0.0,
                              //color: Color(getColorHexFromStr("#C5B7E8")),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Column(
                                children: <Widget>[
                                  SizedBox(height: 14.0),
                                  Container(
                                    height: 130.0,
                                    width: 180.0,
                                    decoration: new BoxDecoration(
                                      borderRadius: new BorderRadius.circular(10.0),
                                      border: Border.all(
                                          width: 10, //
                                          color: Color(getColorHexFromStr("#D7D7D7"))
                                      ),
                                      image: DecorationImage(
                                        //                            image: new AssetImage(
                                        //                                'assets/assets/alucard.jpg'),
                                        //image: new NetworkImage("https://images.unsplash.com/photo-1503875154399-95d2b151e3b0?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
                                        image: new AssetImage("assets/board2.png"),
                                        fit: BoxFit.fill,
                                      ),
                                      shape: BoxShape.rectangle,
                                    ),
                                  ),
                                  //SizedBox(height: 10.0),
                                  new ListTile(
                                    dense: true,
                                    title: Text("Chemistry 11/5/19 13:01",
                                      style: TextStyle(
                                        color: Color(getColorHexFromStr("#606060")),
                                        fontSize: 10.0,
                                        fontFamily: 'QuickSand',
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    trailing: Icon(Icons.more_vert, color: Colors.grey),
                                  ),
                                ],
                              )
                          ),
                        ), // Second Card
                      ],
                    ), // Fourth Row
                  ],
                ),
              ],
            ),  // ListView
          ),  // Container for Vertical

        ],
      ),
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
  Widget _buildCard(BuildContext context, firstText, subText, imagePath){
    return new 
    Card(
      color: Colors.white,//Color(getColorHexFromStr("#A6C5F2")),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
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
    );
  }
}