import 'package:assignment_3/screens/albums_view_screen.dart';
import 'package:assignment_3/screens/photos_view_screen.dart';
import 'package:assignment_3/screens/posts_view_screen.dart';
import 'package:assignment_3/screens/users_view_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int _selectedIndex = 0;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = [
    PostsViewScreen(),
    AlbumsViewScreen(),
    UsersViewScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        PhotosViewScreen.routeName: (context) => const PhotosViewScreen(),
      },
      title: "Assignment 3",
      home: Scaffold(
        body: _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.post_add_rounded), label: 'Posts'),
            BottomNavigationBarItem(
                icon: Icon(Icons.album_rounded), label: 'Albums'),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_rounded), label: 'Users'),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
