import 'package:flutter/material.dart';

class Captions extends StatefulWidget{
  @override
  _Captions createState() => _Captions();

  // final String pageText;

  // const Captions({Key key, this.pageText}): super(key: key);

}

class _Captions extends State<Captions>{

  List notif_ls = [["assets/medal.png", "Introduction to Electricity and Magnetism", "by pencillead", 201, 1], 
                    ["", "Electromagnetism", "by edafruit", 188, 8],
                    ["", "Electromagnetism", "by lewlian", 190, 4],
                    ];
  // final String pageText;

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
        
      body: Column(
        children: <Widget>[
          Expanded(
            child: SizedBox(
              height: 150.0,
              child: new ListView.builder(
                itemCount: notif_ls.length,
                itemBuilder: (BuildContext ctxt, int index){
                  return _indivCaptions(notif_ls[index][0], notif_ls[index][1], notif_ls[index][2], notif_ls[index][3], notif_ls[index][4], index);
                },
              )
            ),
          ),
          new Divider(
              color: Colors.black,
              height: 30.0,
              //indent: 20.0,
            ),
          new Container(
            margin: const EdgeInsets.only(left: 10.0, bottom: 10.0),
            child: Row(
              children: <Widget>[
                new CircleAvatar(
                  backgroundImage: AssetImage("assets/aus.png"),
                  radius: 25.0,
                ),
                new SizedBox(width: 10.0,),
               new Flexible(
                  child: new TextFormField(
                   decoration: InputDecoration(
                    hintText: "Caption...",
                    hintStyle: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 20.0,
                      fontFamily: 'Futura',
                    ),
                  ),
                  ),
                ),
                new FlatButton(
                  onPressed: (){
                    notif_ls.add(["assets/physics.jpg", "Sean", "He is an all star in my eyes", false, 3]);
                  },
                  child: Text("Post",
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 20.0,
                        fontFamily: 'Futura'
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      )

      // Container(
      //   child: CustomScrollView(
      //     slivers: <Widget>[
      //       SliverList(
      //         delegate: SliverChildBuilderDelegate((BuildContext context, int index){
      //           return _indivCaptions(notif_ls[index][0], notif_ls[index][1], notif_ls[index][2], notif_ls[index][3], notif_ls[index][4]);
      //         },
      //         childCount: notif_ls.length,
      //         ),
      //       )
      //     ],
      //   ),
      // )
    );
  }
  
  Widget _indivCaptions(medal, caption, author, likeCount, dislikeCount, index){

    void _toggleFavorite() {
      setState(() {
        if (notif_ls[index][3]) {
          notif_ls[index][3] = false;
        } else {
          notif_ls[index][3] = true;
        }
      });
    }
    
    if(medal != ""){
      return Container(
      padding: EdgeInsets.all(15.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        new CircleAvatar(
          backgroundImage: AssetImage(medal),
          backgroundColor: Colors.transparent,
          radius: 20.0,
        ),
        SizedBox(width: 10.0,),
        new Container(
          width: MediaQuery.of(context).size.width/2.2,
          //decoration: BoxDecoration(border: Border.all(color: Colors.cyan)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Container(
                height:35.0,
                child: RichText(
                  text: new TextSpan(
                    // Note: Styles for TextSpans must be explicitly defined.
                    // Child text spans will inherit styles from parent
                    style: new TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                    ),
                    children: <TextSpan>[
                      new TextSpan(text: caption, style: new TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
              new Text(author,
              style: new TextStyle(
                      fontSize: 14.0,
                      color: Colors.grey,
                    ),
                  ),
            ],
          )
          
        ),
        //SizedBox(width: MediaQuery.of(context).size.width/50,),
        IconButton(
            // icon: (notif_ls[index][3]  ? Icon(Icons.favorite) : Icon(Icons.favorite_border)),
            // color: Colors.red[500],
            // onPressed: _toggleFavorite,
            icon: Icon(Icons.change_history)
        ),
        Text(likeCount.toString()),
        IconButton(
            // icon: (notif_ls[index][3]  ? Icon(Icons.favorite) : Icon(Icons.favorite_border)),
            // color: Colors.red[500],
            // onPressed: _toggleFavorite,
            icon: Icon(Icons.details)
        ),
        Text(dislikeCount.toString()),
      ],
    )
    );
    }
    else{
      return Container(
      padding: EdgeInsets.all(15.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        new CircleAvatar(
          // backgroundImage: AssetImage(dp),
          backgroundColor: Colors.transparent,
          radius: 20.0,
        ),
        SizedBox(width: 10.0,),
        new Container(
          width: MediaQuery.of(context).size.width/2.2,
          //decoration: BoxDecoration(border: Border.all(color: Colors.cyan)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Container(
                height:35.0,
                child: RichText(
                  text: new TextSpan(
                    // Note: Styles for TextSpans must be explicitly defined.
                    // Child text spans will inherit styles from parent
                    style: new TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                    ),
                    children: <TextSpan>[
                      new TextSpan(text: caption, style: new TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
              new Text(author,
              style: new TextStyle(
                      fontSize: 14.0,
                      color: Colors.grey,
                    ),
                  ),
            ],
          )
          
        ),
        //SizedBox(width: MediaQuery.of(context).size.width/50,),
        IconButton(
            // icon: (notif_ls[index][3]  ? Icon(Icons.favorite) : Icon(Icons.favorite_border)),
            // color: Colors.red[500],
            // onPressed: _toggleFavorite,
            icon: Icon(Icons.change_history)
        ),
        Text(likeCount.toString()),
        IconButton(
            // icon: (notif_ls[index][3]  ? Icon(Icons.favorite) : Icon(Icons.favorite_border)),
            // color: Colors.red[500],
            // onPressed: _toggleFavorite,
            icon: Icon(Icons.details)
        ),
        Text(dislikeCount.toString()),
      ],
    )
    );
    }
    
  }
}

