import 'package:flutter/material.dart';

AppBar dashboardAppBar(tabController) {
  return AppBar(
    title: Text(
      "Mobil Uygulama Yönetim Paneli",
    ),
    centerTitle: true,
    bottom: TabBar(
      controller: tabController,
      tabs: <Widget>[
        Tab(
          text: "Bildirim",
        ),
        Tab(
          text: "Yardım Biletleri",
        ),
      ],
    ),
  );
}
