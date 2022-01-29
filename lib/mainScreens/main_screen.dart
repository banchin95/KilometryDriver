import 'package:flutter/material.dart';
import 'package:kilometry_driver/tabPages/earning_tab.dart';
import 'package:kilometry_driver/tabPages/home_tab.dart';
import 'package:kilometry_driver/tabPages/profile_tab.dart';
import 'package:kilometry_driver/tabPages/ratings_tab.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  int selectedIndex = 0;

  onItemClicked(int index) {
    setState(() {
      selectedIndex = index;
      tabController!.index = selectedIndex;
    });
  }

  @override
  void initState() {
    super.initState();

    tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: tabController,
        children: const [
          HomeTabPage(),
          EarningTabPage(),
          RatingsTabPage(),
          ProfileTabPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Маршруты",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.credit_card),
            label: "Оплата",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: "Рейтинг",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Профиль",
          ),
        ],
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.black54,
        backgroundColor: Colors.blueGrey,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: const TextStyle(fontSize: 14),
        showUnselectedLabels: true,
        currentIndex: selectedIndex,
        onTap: onItemClicked,
      ),
    );
  }
}
