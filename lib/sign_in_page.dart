import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:sign/custom_tab.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: _appBarWidget(),
        body: _bodyWidget(),
      ),
    );
  }

  _bodyWidget() {
    return TabBarView(
      children: [
        Icon(Icons.flight, size: 350),
        Icon(Icons.directions_transit, size: 350),
      ],
    );
  }

  PreferredSize _appBarWidget() {
    return PreferredSize(
      preferredSize: Size.fromHeight(200.0),
      child: Theme(
        data: ThemeData(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
        ),
        child: AppBar(
          elevation: 0,
          bottomOpacity: 1,
          backgroundColor: Colors.white,
          bottom: TabBar(
            padding: EdgeInsets.symmetric(vertical: 11),
            labelColor: Colors.black,
            indicatorColor: Colors.white,
            labelStyle: TextStyle(fontSize: 40),
            unselectedLabelStyle: TextStyle(fontSize: 20),
            tabs: [
              CustomTab(text: '로그인'),
              CustomTab(text: '회원가입'),
            ],
          ),
        ),
      ),
    );
  }
}
