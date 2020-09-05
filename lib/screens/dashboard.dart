import 'package:flutter/material.dart';
import './dashboardappbar.dart';
import './notification.dart';
import './ticket.dart';

class DashBoard extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  TabController tabController;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: dashboardAppBar(tabController),
        body: TabBarView(
          controller: tabController,
          children: <Widget>[
            Container(
              child: NotificationPage(),
            ),
            Container(
              child: TicketPage(),
            ),
          ],
        ),
      ),
    );
  }
}
