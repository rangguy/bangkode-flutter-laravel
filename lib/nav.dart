import 'package:bangkode/ui/dashboard.dart';
import 'package:bangkode/ui/kategori_page.dart';
import 'package:flutter/material.dart';

class Nav extends StatefulWidget {
  const Nav({super.key});

  @override
  State<Nav> createState() => _NavState();
}

class _NavState extends State<Nav> {
  int currentTab = 0;
  final List<Widget> screens = [Dashboard(), KategoriPage()];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = Dashboard();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(bucket: bucket, child: currentScreen),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = Dashboard();
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
                                  currentTab == 0 ? Colors.deepPurple : Colors.grey),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = KategoriPage();
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
                                  currentTab == 1 ? Colors.deepPurple : Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              // Row(
              //   crossAxisAlignment: CrossAxisAlignment.stretch,
              //   children: [
              //     MaterialButton(
              //       minWidth: 40,
              //       onPressed: () {
              //         setState(() {
              //           currentScreen = Profile();
              //           currentTab = 2;
              //         });
              //       },
              //       child: Column(
              //         mainAxisAlignment: MainAxisAlignment.center,
              //         children: [
              //           Icon(
              //             Icons.account_circle,
              //             color: currentTab == 2 ? Colors.deepPurple : Colors.grey,
              //           ),
              //           Text(
              //             'Account',
              //             style: TextStyle(
              //                 color:
              //                     currentTab == 2 ? Colors.deepPurple : Colors.grey),
              //           ),
              //         ],
              //       ),
              //     ),
              //   ],
              // )
            ],
          ),
        ),
      ),
    );
  }
}