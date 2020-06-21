import 'package:flutter/material.dart';
import 'package:ummense_app/src/resources/home/home_bottom_navigation_bar.dart';
import 'package:ummense_app/src/resources/home/home_sliver_app_bar.dart';
import 'package:ummense_app/src/resources/home/home_tab_bar_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen();

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  ScrollController _scrollViewController;
  TabController _tabController;
  String _headerTitle;
  bool showSubHeader = true;

  @override
  void initState() {
    _tabController = TabController(vsync: this, length: 4);
    _tabController.addListener(_setCurrentTabTitle);
    _scrollViewController = ScrollController(initialScrollOffset: 0.0);
    _setCurrentTabTitle();
    showOrHideSubHeader();
    super.initState();
  }

  void showOrHideSubHeader() {
    if (_tabController.index != 0) {
      showSubHeader = false;
    } else {
      showSubHeader = true;
    }
  }

  void _setCurrentTabTitle() {
    String currentHeaderTitle = 'Todos';

    switch (_tabController.index) {
      case 1:
        currentHeaderTitle = 'Ummi';
        break;
      case 2:
        currentHeaderTitle = 'Notificações';
        break;
      case 3:
        currentHeaderTitle = 'Configurações';
        break;
    }

    setState(() {
      _headerTitle = currentHeaderTitle;
      showOrHideSubHeader();
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Scaffold(
          body: NestedScrollView(
            controller: _scrollViewController,
            headerSliverBuilder: (BuildContext context, bool boxIsScrolled) {
              return <Widget>[
                HomeSliverAppBar(headerTitle: _headerTitle, tabController: _tabController),
              ];
            },
            body: HomeTabBarView(tabController: _tabController),
          ),
          bottomNavigationBar: HomeBottomNavigationBar(tabController: _tabController),
        );
      },
    );
  }
}