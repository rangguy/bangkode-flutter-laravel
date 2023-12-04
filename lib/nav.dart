import 'package:bangkode/ui/dashboard.dart';
import 'package:bangkode/ui/kategori_page.dart';
import 'package:bangkode/ui/profile_page.dart';
import 'package:flutter/material.dart';

class Nav extends StatefulWidget {
  final String userEmail;
  final String userName;

  const Nav({Key? key, required this.userEmail, required this.userName}) : super(key: key);

  @override
  State<Nav> createState() => _NavState();
}

class _NavState extends State<Nav> {
  int currentTab = 0;
  late final List<Widget> screens;

  late final PageStorageBucket bucket;
  late Widget currentScreen;

  @override
  void initState() {
    super.initState();
    currentScreen = Dashboard();
    screens = [
      Dashboard(),
      KategoriPage(),
      ProfilePage(userEmail: widget.userEmail, userName: widget.userName),
    ];
    bucket = PageStorageBucket();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        bucket: bucket,
        child: currentScreen,
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              MaterialButton(
                minWidth: 40,
                onPressed: () {
                  setState(() {
                    currentScreen = screens[0];
                    currentTab = 0;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.home,
                      color: currentTab == 0 ? Colors.deepPurple : Colors.grey,
                    ),
                    Text(
                      'Home',
                      style: TextStyle(
                        color:
                            currentTab == 0 ? Colors.deepPurple : Colors.grey,
                      ),
                    )
                  ],
                ),
              ),
              MaterialButton(
                minWidth: 40,
                onPressed: () {
                  setState(() {
                    currentScreen = screens[1];
                    currentTab = 1;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.menu_book,
                      color: currentTab == 1 ? Colors.deepPurple : Colors.grey,
                    ),
                    Text(
                      'Course',
                      style: TextStyle(
                        color:
                            currentTab == 1 ? Colors.deepPurple : Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              MaterialButton(
                minWidth: 40,
                onPressed: () {
                  setState(() {
                    currentScreen = screens[2];
                    currentTab = 2;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.account_circle,
                      color: currentTab == 2 ? Colors.deepPurple : Colors.grey,
                    ),
                    Text(
                      'Account',
                      style: TextStyle(
                        color:
                            currentTab == 2 ? Colors.deepPurple : Colors.grey,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
