import 'package:flutter/material.dart';

//From nasaAcadamy package.
import 'package:nasaadmin/Presentation/common/basicappbar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(235, 237, 240, 1.0),
      appBar: BasicAppBar.getAppBar(context),
      body: Container(),
      // drawer: SideBarDrawer(),
      // bottomNavigationBar: ButtomNavigationBarContainer(),
    );
  }
}
