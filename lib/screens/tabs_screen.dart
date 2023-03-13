// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';
import '../screens/categories_screen.dart';
import '../screens/favorites_screen.dart';

class TabsScreen extends StatefulWidget {
  final Function saveFilters;
  const TabsScreen(this.saveFilters, {super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, dynamic>> _pages = [
    {
      'page': CategoriesScreen(),
      'title': 'Categories',
    },
    {
      'page': FavoritesScreen(),
      'title': 'Your Favorite',
    },
  ];
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      drawer: MainDrawer(widget.saveFilters),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            backgroundColor: Theme.of(context).colorScheme.primary,
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            backgroundColor: Theme.of(context).colorScheme.primary,
            label: 'Favorites',
          ),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedPageIndex,
        unselectedItemColor: Colors.white,
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}
