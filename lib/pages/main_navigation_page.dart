import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import '../pages/pages.dart';
import '../utils/utilities.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({Key? key}) : super(key: key);
  @override
  _MainNavigationState createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const CharactersPage(),
    const ChatRoomsPage(),
    const MorePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
      Utilities.closeKeyboard(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack( //this will call onBackPress() from FriendsPage() in every page
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.group),
            label: Intl.message("chatterTitle"),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.chat_bubble),
            label: Intl.message("chatTitle"),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.more_horiz),
            label: Intl.message("moreTitle"),
          ),
        ],
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
