import 'package:flutter/material.dart';
import './tabview.dart';


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
      backgroundColor: Colors.black,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          automaticallyImplyLeading: false, // hides leading widget
          flexibleSpace: new Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
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
                    // Container(width: 200.0,
                    //   child: const Text('Physics Week 1 Cohort 1 10:32',
                    //   style: TextStyle(
                    //       color: Colors.white,
                    //       //fontSize: 20.0,
                    //       fontFamily: 'Futura',
                    //       //fontWeight: FontWeight.bold,
                    //       letterSpacing: 1.0,
                    //   ),
                    // ),
                    // ),
                    const Text('Physics Week 1 Cohort 1 10:32',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontFamily: 'Futura',
                          //fontWeight: FontWeight.bold,
                          letterSpacing: 1.0,
                      ),
                    ),
                    
                    SizedBox(width: MediaQuery.of(context).size.width/16,),
                    IconButton(
                      icon: Icon(Icons.star_border, color: Colors.white),
                      onPressed: null,//() {
                        //_select(choices[0]);
                      //},
                    ),
                  ],
                ) 
              ],
            ),  
          ),
        ),
      body:
      Column(
        mainAxisSize: MainAxisSize.max,
        //padding: EdgeInsets.only(top:80.0),
        children: <Widget>[
          SizedBox(height: 50.0),
          Container(
            margin: EdgeInsets.symmetric(vertical:10.0),
            height: 250,
            child:
                    Container(
                      height: MediaQuery.of(context).size.width,
                      width: MediaQuery.of(context).size.width,
                      decoration: new BoxDecoration(
                        //borderRadius: new BorderRadius.circular(20.0),
                        color: Colors.white,
                        image: DecorationImage(
                          //                            image: new AssetImage(
                          //                                'assets/assets/alucard.jpg'),
                          //image: new NetworkImage("https://images.unsplash.com/photo-1503875154399-95d2b151e3b0?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
                          image: new AssetImage("assets/board1.png"),
                          fit: BoxFit.fitHeight,
                        ),
                        //shape: BoxShape.rectangle,
                      ),
                    ),
          ),
          SizedBox(height: 10.0),
          Row(
            children: <Widget>[
              //SizedBox(width: 30.0),
              IconButton(
                      icon: Icon(Icons.favorite_border, color: Colors.grey),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ), 
                    IconButton(
                      icon: Icon(Icons.comment, color: Colors.grey),
                      onPressed: () {
                        Navigator.pop(context);
                      },
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
          Row(
            children: <Widget>[
              SizedBox(width:10.0),
               new RichText(
                text: new TextSpan(
                  // Note: Styles for TextSpans must be explicitly defined.
                  // Child text spans will inherit styles from parent
                  style: new TextStyle(
                    fontSize: 14.0,
                    color: Colors.white,
                  ),
                  children: <TextSpan>[
                    new TextSpan(text: 'Claire Tan', style: new TextStyle(fontWeight: FontWeight.bold)),
                    new TextSpan(text: ' '),
                    new TextSpan(text: 'Lionell is so cool'),
                    //new TextSpan(text: 'World', style: new TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              FlatButton(
                padding: EdgeInsets.all(10.0),
                onPressed: () => Navigator.push(context, new MaterialPageRoute
                (builder: (BuildContext context) => new Tabview())),
                child: Text(
                  "View all comments",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.0,
                      fontFamily: 'Futura',
                      fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ],
          )  
        ],
      ),
    );  // Scaffold
  }
}