import 'package:flutter/material.dart';
import 'package:flutter_chat/pages/camera_alt.dart';
import 'package:flutter_chat/pages/chat_list.dart';
import 'package:flutter_chat/pages/calls.dart';
import 'package:flutter_chat/pages/status_screen.dart';
import 'package:flutter_chat/pages/contacts.dart';
import 'package:flutter_chat/pages/new_contact.dart';

class WhatsAppHome extends StatefulWidget {
  @override
  _WhatsAppHomeState createState() => new _WhatsAppHomeState();
 }
class _WhatsAppHomeState extends State<WhatsAppHome> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override



  void initState(){
    super.initState();
    _tabController = new TabController(vsync: this, initialIndex: 1, length: 4);
    _tabController.addListener(_handleTabIndex);
  }


  void _handleTabIndex() {
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
   return new Scaffold(
     appBar: new AppBar(
       title: new Text("FlutterChat"),
       bottom: new TabBar(
         controller: _tabController,
         tabs: <Widget>[
           new Tab(icon: new Icon(Icons.camera_alt)),
           new Tab(text: "CHATS"),
           new Tab(text: "ESTADOS"),
           new Tab(text: "LLAMADAS",)
         ],
       ),
     ),
     body: new TabBarView(
      controller: _tabController,
       children: <Widget>[
         new Camera(),
         new ChatList(),
         new Status(),
         new Calls()
       ],
     ),
     floatingActionButton: _bottomButtons(),
   );
  }








  Widget _bottomButtons() {

    FloatingActionButton boton;

    switch (_tabController.index) {
      case 0: boton = FloatingActionButton(
                backgroundColor: Theme.of(context).accentColor,
                child: new Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                onPressed: () {

                  Navigator.push(context,
                    new MaterialPageRoute(builder: (context) => new NewContact())
                  );


                  // var route = new MaterialPageRoute(
                  //   builder: (BuildContext context) => new Contacts());
                  //   Navigator.of(context).push(route);
                  
                }
              );
        
      break;

      case 1: boton = FloatingActionButton(
                backgroundColor: Theme.of(context).accentColor,
                child: new Icon(
                  Icons.chat,
                  color: Colors.white,
                ),
                onPressed: () {
                  var route = new MaterialPageRoute(
                    builder: (BuildContext context) => new Contacts());
                    Navigator.of(context).push(route);
                  
                }
              );
        
      break;

      case 2: boton = FloatingActionButton(
                backgroundColor: Theme.of(context).accentColor,
                child: new Icon(
                  Icons.camera_alt,
                  color: Colors.white,
                ),
                onPressed: () {
                  // var route = new MaterialPageRoute(
                  //   builder: (BuildContext context) => new Contacts());
                  //   Navigator.of(context).push(route);
                  
                }
              );
        
      break;

      case 3: boton = FloatingActionButton(
                backgroundColor: Theme.of(context).accentColor,
                child: new Icon(
                  Icons.call,
                  color: Colors.white,
                ),
                onPressed: () {
                  // var route = new MaterialPageRoute(
                  //   builder: (BuildContext context) => new Contacts());
                  //   Navigator.of(context).push(route);
                  
                }
              );
        
      break;
    }


    return boton;


  }




}

