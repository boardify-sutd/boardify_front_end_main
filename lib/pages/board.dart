import 'package:flutter/material.dart';
import './my_profile_page.dart';

class Board extends StatefulWidget{
  @override
  _Board createState() => _Board();
}

class _Board extends State<Board>{

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
      body:
      Column(
        mainAxisSize: MainAxisSize.max,
        //padding: EdgeInsets.only(top:80.0),
        children: <Widget>[
          SizedBox(height: 10.0),
          Row(
            children: <Widget>[
              SizedBox(width: 20.0),
              Text(
                "Physics | Quantum Physics",
                style: TextStyle(
                  color: Color(getColorHexFromStr("#606060")),
                  fontSize: 20.0,
                  fontFamily: 'QuickSand',
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width:10.0),
              FlatButton(
                  color: Colors.transparent,
                  onPressed: null,
                  child: Row(
                    children: <Widget>[
                      Text(
                        "23/1/19",
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
            height: 250,
            child:Card(
                //color: Color(getColorHexFromStr("#A6C5F2")),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 10.0),
                    Container(
                      height: 180.0,
                      width: 280.0,
                      decoration: new BoxDecoration(
                        borderRadius: new BorderRadius.circular(20.0),
                        image: DecorationImage(
                          //                            image: new AssetImage(
                          //                                'assets/assets/alucard.jpg'),
                          //image: new NetworkImage("https://images.unsplash.com/photo-1503875154399-95d2b151e3b0?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
                          image: new AssetImage("assets/board1.png"),
                          fit: BoxFit.fill,
                        ),
                        shape: BoxShape.rectangle,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    new Text("By Prof Dorrien",
                      style: TextStyle(
                        color: Color(getColorHexFromStr("#606060")),
                        fontSize: 18.0,
                        fontFamily: 'QuickSand',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    new Text("Tags: Proton, Neutron",
                      style: TextStyle(
                        color: Color(getColorHexFromStr("#606060")),
                        fontSize: 15.0,
                        fontFamily: 'QuickSand',
                      ),
                    ),
                  ],
                )
            ),
          ),
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
                "Comments",
                style: TextStyle(
                  color: Color(getColorHexFromStr("#606060")),
                  fontSize: 23.0,
                  fontFamily: 'QuickSand',
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width:80.0),
//              FlatButton(
//                  color: Colors.transparent,
//                  onPressed: null,
//                  child: Row(
//                    children: <Widget>[
//                      Text(
//                        "See All",
//                        style: TextStyle(
//                          color: Color(getColorHexFromStr("#606060")),
//                          fontSize: 15.0,
//                          fontFamily: 'QuickSand',
//                        ),
//                      ),
//                      Icon(Icons.chevron_right),
//                    ],
//                  )
//              ),
            ],
          ),
        ],
      ),
    );  // Scaffold
  }
}