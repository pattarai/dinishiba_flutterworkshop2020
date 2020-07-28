import 'package:flutter/material.dart';
import 'login.dart';
import 'snackbar.dart';
import 'webview.dart';
import 'main.dart';


class DrawerItem {
  String title;
  IconData icon;

  DrawerItem(this.title, this.icon);
}

class HomeScreen extends StatefulWidget {

  var drawerItems = [
    new DrawerItem("Login", Icons.account_circle),
    new DrawerItem("Stack", Icons.storage),
    new DrawerItem("SnackBar", Icons.notifications),
    new DrawerItem("Web View", Icons.web),
    new DrawerItem("Contact me", Icons.call),
  ];

  @override
  State<StatefulWidget> createState() {
    return new HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  BuildContext _ctx;
  final scaffoldKey = new GlobalKey<ScaffoldState>();

  int _selectedDrawerIndex = 0;

  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return LoginPage();
        break;
      case 1:
        return StackList();
        break;
      case 2:
        return Snackbar();
        break;  
      case 3:
        return WebViewDemo();
        break;
      default:
        return new Text("Error");
        break;
    }
  }

  _onSelectItem(int index) {
    setState(() => _selectedDrawerIndex = index);
    Navigator.of(context).pop(); // close the drawer
  }

  @override
  Widget build(BuildContext context) {
    _ctx = context;
    var drawerOptions = <Widget>[];

    for (var i = 0; i < widget.drawerItems.length; i++) {
        var d = widget.drawerItems[i];
        if (i == 7) {
          drawerOptions.add(
            const Divider(height: 1.0, color: Colors.tealAccent),
          );
        }
        drawerOptions.add(new ListTile(
          leading: new Icon(d.icon),
          title: new Text(d.title),
          selected: i == _selectedDrawerIndex,
          onTap: () => _onSelectItem(i),
        ));
      }
      return new Scaffold(
        key: scaffoldKey,
        appBar: new AppBar(
          backgroundColor: Colors.teal,
          // here we display the title corresponding to the fragment
          // you can instead choose to have a static title
          title: new Text(
            widget.drawerItems[_selectedDrawerIndex].title,
          ),
        ),
        drawer: new Drawer(
          child: SingleChildScrollView(
            child: new Column(
              children: <Widget>[
                new UserAccountsDrawerHeader(
                  accountName: new Text("DINI SHIBA S"),
                  accountEmail: new Text("dini@gmail.com"),
                  currentAccountPicture: CircleAvatar(
                    radius: 60.0,
                    backgroundColor: const Color(0xFF4DB6AC),
                    backgroundImage: NetworkImage("https://avatars2.githubusercontent.com/u/67852680?s=400&u=c0318d50999f27b005c17dcefba7d113cde8bb1b&v=4") // for Network image
                  ),
                  decoration: new BoxDecoration(
                    color: Colors.teal,
                  ),
                ),
                new Column(children: drawerOptions)
              ],
            ),
          ),
        ),
        body: _getDrawerItemWidget(_selectedDrawerIndex),
      );
    }
  }