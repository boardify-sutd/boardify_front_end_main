import 'package:flutter/material.dart';

class Comments extends StatefulWidget{
  @override
  _Comments createState() => _Comments();

  // final String pageText;

  // const Comments({Key key, this.pageText}): super(key: key);

}

class _Comments extends State<Comments>{

  List notif_ls = [["assets/aus.png", "pencillead", "Hey @Glenn I think you are so cool, cooler than Lionell", true, 1], 
                    ["assets/physics.jpg", "Eda", "I agree, Glenn is a 5 Star Basketball player", false, 2],
                    ["assets/physics.jpg", "Sean", "He is an all star in my eyes", true, 3],
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
                  return _indivComments(notif_ls[index][0], notif_ls[index][1], notif_ls[index][2], notif_ls[index][3], notif_ls[index][4], index);
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
                    hintText: "Comment...",
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
      //           return _indivComments(notif_ls[index][0], notif_ls[index][1], notif_ls[index][2], notif_ls[index][3], notif_ls[index][4]);
      //         },
      //         childCount: notif_ls.length,
      //         ),
      //       )
      //     ],
      //   ),
      // )
    );
  }
  
  Widget _indivComments(dp, name, text, likeStatus,likeCount, index){
     bool _likeStatus = likeStatus;

    // void _toggleFavorite() {
    //   setState(() {
    //     if (_likeStatus) {
    //       _likeStatus = false;
    //     } else {
    //       _likeStatus = true;
    //     }
    //   });
    // }

    void _toggleFavorite() {
      setState(() {
        if (notif_ls[index][3]) {
          notif_ls[index][3] = false;
        } else {
          notif_ls[index][3] = true;
        }
      });
    }
    
    if(dp != ""){
      return Container(
      padding: EdgeInsets.all(15.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        new CircleAvatar(
          backgroundImage: AssetImage(dp),
          radius: 25.0,
        ),
        SizedBox(width: 10.0,),
        new Container(
          width: MediaQuery.of(context).size.width/1.55,
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
                      new TextSpan(text: name, style: new TextStyle(fontWeight: FontWeight.bold)),
                      new TextSpan(text: " "),
                      new TextSpan(text: text),
                      //new TextSpan(text: 'World', style: new TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
              Row(
                children: <Widget>[
                  Text(likeCount.toString() + " Likes", 
                  style: new TextStyle(
                      fontSize: 14.0,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    height: 14.0,
                    child:FlatButton(
                      onPressed: null,
                    padding: EdgeInsets.all(0),
                      child: Text("Reply", 
                      style: new TextStyle(
                          fontSize: 12.0,
                          color: Colors.grey,
                        ),
                      ),
                    )
                  )
                ],
              )
              
            ],
          )
          
        ),
        //SizedBox(width: MediaQuery.of(context).size.width/50,),
        IconButton(
            icon: (notif_ls[index][3]  ? Icon(Icons.favorite) : Icon(Icons.favorite_border)),
            color: Colors.red[500],
            onPressed: _toggleFavorite,
        ),
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
          backgroundColor: Colors.blue,
          radius: 25.0,
        ),
        SizedBox(width: 10.0,),
        new Container(
          width: MediaQuery.of(context).size.width/1.55,
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
                      new TextSpan(text: name, style: new TextStyle(fontWeight: FontWeight.bold)),
                      new TextSpan(text: " "),
                      new TextSpan(text: text),
                      //new TextSpan(text: 'World', style: new TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
              Row(
                children: <Widget>[
                  Text("Likes", 
                  style: new TextStyle(
                      fontSize: 14.0,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    height: 14.0,
                    child:FlatButton(
                      onPressed: null,
                    padding: EdgeInsets.all(0),
                      child: Text("Reply", 
                      style: new TextStyle(
                          fontSize: 12.0,
                          color: Colors.grey,
                        ),
                      ),
                    )
                  )
                ],
              )
            ],
          )
        ),
        IconButton(
            icon: (likeStatus ? Icon(Icons.favorite) : Icon(Icons.favorite_border)),
            color: Colors.red[500],
            onPressed: _toggleFavorite,
        ),
      ],
    )
    );
    }
    
  }
}

