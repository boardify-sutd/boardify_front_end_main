import 'package:flutter/material.dart';
import './week.dart'; 
import './page1.dart';
import './page2.dart';
import './page3.dart';
import './page4.dart';
import './board.dart';
import './my_profile_page.dart';

class ProfilePageNav extends StatefulWidget{

  final String pageText;

  //const ProfilePage({Key key, this.pageText}): super(key: key);
  ProfilePageNav(this.pageText, {Key key}): super(key: key);

  @override
  _ProfilePageNav createState() => _ProfilePageNav();

  // final String pageText;

  // const Subjects({Key key, this.pageText}): super(key: key);

}

class _ProfilePageNav extends State<ProfilePageNav>{



  // _Subjects(this.pageText);
  int _currentIndex = 0;
  int _currentIndexPage = 4;
  Widget callPage(int currentIndex){
    switch (currentIndex){
      case 0:
        return Pageone();
      case 1:
        return Pagetwo();
      case 2:
        return Notifications();
      case 3:
        return Board();//Pagefour();
      case 4:
        return ProfilePage(widget.pageText);
        break;
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
      backgroundColor: Colors.white,
      body:
      callPage(_currentIndexPage),
      bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: _currentIndex,
            onTap: (value){
              _currentIndex=value;
              _currentIndexPage = value;
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
        ), 
    );  // Scaffold
  }
}

