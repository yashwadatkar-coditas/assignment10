import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class ScaffoldWithNavBar extends StatefulWidget {
  /// Constructs an [ScaffoldWithNavBar].
   ScaffoldWithNavBar({
    required this.navigationShell,
    Key? key,
  }) : super(key: key ?? const ValueKey<String>('ScaffoldWithNavBar'));

  /// The navigation shell and container for the branch Navigators.
  final StatefulNavigationShell navigationShell;

  @override
  State<ScaffoldWithNavBar> createState() => _ScaffoldWithNavBarState();
}

class _ScaffoldWithNavBarState extends State<ScaffoldWithNavBar> {
  final FirebaseAnalytics analytics = FirebaseAnalytics.instance;

@override
  void initState() {
    // TODO: implement initState
    analytics.setAnalyticsCollectionEnabled(true);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        // Here, the items of BottomNavigationBar are hard coded. In a real
        // world scenario, the items would most likely be generated from the
        // branches of the shell route, which can be fetched using
        // `navigationShell.route.branches`.
        items:  <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: SvgPicture.asset('assets/icons/home_icon.svg'), label: 'Home',),
          BottomNavigationBarItem(icon: SvgPicture.asset('assets/icons/author_icon.svg'), label: 'Author'),
          BottomNavigationBarItem(icon: SvgPicture.asset('assets/icons/book_icon.svg'), label: 'Books'),
          BottomNavigationBarItem(icon: SvgPicture.asset('assets/icons/setting_icon.svg'), label: 'Setting'),
        
        ],
      
        currentIndex: widget.navigationShell.currentIndex,
        onTap: (int index){ 
            final label = ['Home', 'Author', 'Books', 'Setting'][index];
          analytics.logEvent(
            name: 'page_tracked',
            parameters: {
              "page_name": label[index],
              "page_index": index,
            },
        );
 print('Current page: $label');
          return _onTap(context, index);},
      ),
    );
  }

  /// Navigate to the current location of the branch at the provided index when
  /// tapping an item in the BottomNavigationBar.
  void _onTap(BuildContext context, int index) {
    // When navigating to a new branch, it's recommended to use the goBranch
    // method, as doing so makes sure the last navigation state of the
    // Navigator for the branch is restored.
    widget.navigationShell.goBranch(
      index,
      // A common pattern when using bottom navigation bars is to support
      // navigating to the initial location when tapping the item that is
      // already active. This example demonstrates how to support this behavior,
      // using the initialLocation parameter of goBranch.
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }
}