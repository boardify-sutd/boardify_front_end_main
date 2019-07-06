import 'package:flutter/material.dart';
import './comments.dart';
import './captions.dart';

class Tabview extends StatefulWidget{
  @override
  _Tabview createState() => _Tabview();

  // final String pageText;

  // const Tabview({Key key, this.pageText}): super(key: key);

}

class _Tabview extends State<Tabview>{


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
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          //automaticallyImplyLeading: false,
          leading: new IconButton(
            icon: new Icon(Icons.clear, color: Colors.white),
            iconSize: 30.0,
            onPressed: () => Navigator.of(context).pop(),
          ), 
          backgroundColor: Colors.black,
          bottom: TabBar(
            indicatorColor: Colors.white,
            indicatorWeight: 5.0, 
            //indicatorPadding:  EdgeInsets.bottom,
            // labelPadding: 10.0,
            tabs: [
              Container(
                //width: MediaQuery.of(context).size.width/2.2,
                height: 60.0,
                child: Text("Comments",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                    fontFamily: 'Futura',
                    fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                //width: MediaQuery.of(context).size.width/2.2,
                height: 60.0,
                child: Text("Captions",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                    fontFamily: 'Futura',
                    fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Comments(),
            Captions(),
          ],
        ),
      ),
    );
  }
}

      