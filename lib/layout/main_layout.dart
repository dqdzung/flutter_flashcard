import 'package:flutter/material.dart';
import 'package:flutter_tutorial/page/favorites_page.dart';
import 'package:flutter_tutorial/page/home_page.dart';

class MainLayout extends StatefulWidget {
  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  Set<String> selected = {'home'};

  @override
  Widget build(BuildContext context) {
    Widget page;

    switch (selected.first) {
      case "home":
        page = HomePage();
      case "fav":
        page = FavoritesPage();
      default:
        throw UnimplementedError('no widget for $selected');
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          backgroundColor: Colors.purple[100],
          body: Column(
            children: [
              SizedBox(height: 75),
              SegmentedButton(
                showSelectedIcon: false,
                style: ButtonStyle(
                  iconColor: WidgetStateProperty.resolveWith<Color?>((states) {
                    return states.contains(WidgetState.selected)
                        ? Colors.purple
                        : null;
                  }),
                ),
                segments: [
                  ButtonSegment(
                    value: "home",
                    tooltip: "Home",
                    icon: const Icon(Icons.home),
                  ),
                  ButtonSegment(
                    value: "fav",
                    tooltip: "Favorite",
                    icon: const Icon(Icons.favorite),
                  ),
                ],
                selected: selected,
                onSelectionChanged: (value) {
                  setState(() {
                    selected = value;
                  });
                },
              ),

              Expanded(
                child: AnimatedSwitcher(
                  duration: Duration(milliseconds: 200),
                  child: page,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
