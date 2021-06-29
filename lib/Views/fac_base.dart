import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tms/constants.dart';
import 'package:universal_html/html.dart' as uh;
import 'package:desktop_window/desktop_window.dart';

import 'dart:io' show Platform;

class FacBase extends StatefulWidget {
  @override
  _FacBaseState createState() => _FacBaseState();
}

void goFullScreen() async {
  //website or Desktop only feature... Full screen mode
  if (kIsWeb)
    uh.document.documentElement!.requestFullscreen();
  else if (Platform.isWindows) {
    await DesktopWindow.toggleFullScreen();
  }
}

class _FacBaseState extends State<FacBase> {
  int _selectedDestination = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    void selectDestination(int index) {
      setState(() {
        _selectedDestination = index;
      });
    }

    Widget navdraw = Theme(
      data: Theme.of(context).copyWith(
        canvasColor: kGlacier,
      ),
      child: ListTileTheme(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        iconColor: kMatte,
        selectedColor: kMatte,
        textColor: kMatte,
        selectedTileColor: kMikado,
        child: Drawer(
          elevation: 2,
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 16.0),
                child: Text(
                  "TMS",
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                      color: MediaQuery.of(context).size.width > 1239
                          ? kCastelon
                          : kGlacier),
                ),
              ),
              Container(
                height: 162,
                width: 304,
                color: kFrost,
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 16.0),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                child: ListTile(
                  leading: Icon(Icons.home),
                  title: Text(
                    'Home',
                    style: Theme.of(context).textTheme.button,
                  ),
                  selected: _selectedDestination == 0,
                  onTap: () => selectDestination(0),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                child: ListTile(
                  leading: Icon(Icons.calendar_today),
                  title: Text(
                    'Calendar',
                    style: Theme.of(context).textTheme.button,
                  ),
                  selected: _selectedDestination == 1,
                  onTap: () => selectDestination(1),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                child: ListTile(
                  leading: Icon(Icons.alarm),
                  title: Text(
                    'Timesheet',
                    style: Theme.of(context).textTheme.button,
                  ),
                  selected: _selectedDestination == 2,
                  onTap: () => selectDestination(2),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 16),
                child: ListTile(
                  leading: Icon(Icons.settings),
                  title: Text(
                    'Settings',
                    style: Theme.of(context).textTheme.button,
                  ),
                  selected: _selectedDestination == 3,
                  onTap: () => selectDestination(3),
                ),
              ),
              Divider(
                height: 1,
                thickness: 1,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.fromLTRB(8, 16, 8, 16),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: kCastelon,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  onPressed: () {},
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    child: Text(
                      'Sign Out',
                      style: Theme.of(context)
                          .textTheme
                          .button!
                          .copyWith(color: kGlacier),
                    ),
                  ),
                ),
              ),
              Divider(
                height: 1,
                thickness: 1,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 16, 8, 8),
                child: ListTile(
                  leading: Icon(Icons.help),
                  title: Text(
                    'Help',
                    style: Theme.of(context).textTheme.button,
                  ),
                  selected: _selectedDestination == 4,
                  onTap: () => selectDestination(4),
                ),
              ),
            ],
          ),
        ),
      ),
    );
    return WillPopScope(
      onWillPop: () async => false,
      child: SafeArea(
        child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth > 1239)
            return Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 304.0),
                  child: Scaffold(
                    body: Center(
                      child: Container(
                        child: Text("$_selectedDestination"),
                      ),
                    ),
                  ),
                ),
                navdraw,
              ],
            );
          else
            return Scaffold(
              appBar: AppBar(
                elevation: 2,
                title: Text(
                  "TMS",
                  style: Theme.of(context)
                      .textTheme
                      .headline5!
                      .copyWith(color: kCastelon),
                ),
                centerTitle: true,
                // actions: [],
                backgroundColor: kCream,
                iconTheme: IconThemeData(color: kCastelon),
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.notifications,
                        color: kCastelon,
                      ),
                    ),
                  ),
                ],
              ),
              backgroundColor: kFrost,
              drawer: navdraw,
              body: Container(),
            );
        }),
      ),
    );
  }
}
