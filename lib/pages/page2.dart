import 'package:flutter/material.dart';
import './my_profile_page.dart';

class Pagetwo extends StatefulWidget{
  @override
  _Pagetwo createState() => _Pagetwo();
}

class _Pagetwo extends State<Pagetwo>{

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  var sample_ls =[
      ["23/1/19 08:52", "10", "98", "assets/board1.png"],
      ["24/1/19 08:53", "11", "12", "assets/board2.png"],
      ["25/1/19 08:54", "42", "54", "assets/board1.png"],
      ["25/1/19 08:54", "62", "14", "assets/board1.png"],
    ];

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
      appBar: AppBar(title: Text("test")),
      body:
      OrientationBuilder(
        builder: (context, orientation) {
          return GridView.count(
            // Create a grid with 2 columns in portrait mode, or 3 columns in
            // landscape mode.
            crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
            // Generate X Widgets that display their index in the List
            children: List.generate(sample_ls.length, (index) {
              return _cardBoard(context, index);
            }),
          );
        },
      ),
    //   new GridView.builder(
    //       itemCount: data.length
    //       gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: (orientation == Orientation.portrait) ? 2 : 3),
    //       itemBuilder: (BuildContext context, int index) {
    //         return new Card(
    //           child: new GridTile(
    //             footer: new Text(data[index]['name']),
    //               child: new Text(data[index]['image']), //just for testing, will fill with image later
    //           ),
    //         );
    //       },
    );  // Scaffold
  }
    Widget _cardBoard(BuildContext context, index){
    return Card(
      elevation: 0.0,
      //color: Color(getColorHexFromStr("#C5B7E8")),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
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
                image: new AssetImage(sample_ls[index][3]),
                fit: BoxFit.fill,
              ),
              shape: BoxShape.rectangle,
            ),
          ),
          //SizedBox(height: 10.0),
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new SizedBox(width: 45,),
              new Text(sample_ls[index][0],
              style: TextStyle(
                color: Color(getColorHexFromStr("#606060")),
                fontSize: 12.0,
                fontFamily: 'QuickSand',
                fontWeight: FontWeight.bold,
              ),
            ),
            new SizedBox(width: 25,),
            new Icon(Icons.more_vert, color: Colors.grey)
              ],
          ),
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new Icon(Icons.favorite_border, size: 14,),
              SizedBox(width: 6.0),
              new Text(sample_ls[index][1],
                style: TextStyle(
                  color: Color(getColorHexFromStr("#606060")),
                  fontSize: 10.0,
                  fontFamily: 'QuickSand',
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 8.0),
              new Icon(Icons.comment, color: Colors.grey, size: 14,),
              SizedBox(width: 8.0),
              new Text(sample_ls[index][2],
                style: TextStyle(
                  color: Color(getColorHexFromStr("#606060")),
                  fontSize: 10.0,
                  fontFamily: 'QuickSand',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      )
    );
  }
}