import 'package:flutter/material.dart';
import './my_profile_page.dart';
import './board.dart';

class Pagetwo extends StatefulWidget{
  @override
  _Pagetwo createState() => _Pagetwo();
}

class _Pagetwo extends State<Pagetwo>{

  Choice _selectedChoice = choices[0]; // The app's "state".

  String dropdownValue = 'Date';

  void _select(Choice choice) {
    // Causes the app to rebuild with the new _selectedChoice.
    setState(() {
      _selectedChoice = choice;
    });
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  var sample_ls =[
      ["23/1/19 08:52", "10", "98", "assets/board1.png"],
      ["24/1/19 08:53", "11", "12", "assets/board2.png"],
      ["25/1/19 08:54", "42", "54", "assets/board1.png"],
      ["25/1/19 08:54", "62", "14", "assets/board1.png"],
      ["23/1/19 08:52", "10", "98", "assets/board1.png"],
      ["24/1/19 08:53", "11", "12", "assets/board2.png"],
      ["25/1/19 08:54", "42", "54", "assets/board1.png"],
      ["25/1/19 08:54", "62", "14", "assets/board1.png"],
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
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: AppBar(
          backgroundColor: Color(getColorHexFromStr("#34495E")),
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
                    const Text('Cohort 1',
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
                ) 
              ],
            ),  
          ),
        )
      ),
      body:
      OrientationBuilder(
        builder: (context, orientation) {
          return Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  SizedBox(width: MediaQuery.of(context).size.width/27),
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
                        //hint: Text('Sort By'),
                    ),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width/1.7,),
                  PopupMenuButton<Choice>(
                      icon: new Icon(Icons.menu, color: Colors.grey),
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

                
              Expanded(
                child: SizedBox(
                  height: 200.0,
                  child: new GridView.count(
                // Create a grid with 2 columns in portrait mode, or 3 columns in
                // landscape mode.
                crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
                // Generate X Widgets that display their index in the List
                children: List.generate(sample_ls.length, (index) {
                  return _cardBoard(context, index);
                }),
              )
                )
              )
              ,
            ],
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