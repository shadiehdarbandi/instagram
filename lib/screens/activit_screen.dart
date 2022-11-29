import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:instagram/models/enums/avtivity_type_enum.dart';

class activityScreen extends StatefulWidget {
  activityScreen({Key? key}) : super(key: key);

  @override
  State<activityScreen> createState() => _activityScreenState();
}

class _activityScreenState extends State<activityScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1C1F2E),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: Color(0xff1C1F2E),
              height: 60,
              child: TabBar(
                labelColor: Color.fromARGB(255, 255, 255, 255),
                labelStyle: TextStyle(fontSize: 20, fontFamily: 'GB'),
                indicatorColor: Color(0xffF35383),
                indicatorPadding: EdgeInsets.symmetric(horizontal: 15),
                indicatorWeight: 3,
                controller: _tabController,
                tabs: [
                  Tab(
                    text: 'Following',
                  ),
                  Tab(
                    text: 'You',
                  ),
                ],
              ),
            ),
            Expanded(
                child: TabBarView(controller: _tabController, children: [
              _getSampleTab(),
              _getSampleTab(),
              // Container(
              //   child: CustomScrollView(
              //     slivers: <Widget>[
              //       SliverList(
              //         delegate: SliverChildBuilderDelegate(((context, index) {
              //           return Text('data');
              //         }), childCount: 20),
              //       ),
              //     ],
              //   ),
              // ),
            ]))
          ],
        ),
      ),
    );
  }

  CustomScrollView _getSampleTab() {
    return CustomScrollView(
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(top: 20, left: 30),
            child: Text(
              'new',
              style: TextStyle(
                  fontFamily: 'GB', fontSize: 16, color: Colors.white),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(((context, index) {
            return _getRow(avtivityStatus.like);
          }), childCount: 2),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(top: 20, left: 30),
            child: Text(
              'today',
              style: TextStyle(
                  fontFamily: 'GB', fontSize: 16, color: Colors.white),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(((context, index) {
            return _getRow(avtivityStatus.followBack);
          }), childCount: 7),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(top: 20, left: 30),
            child: Text(
              'this week',
              style: TextStyle(
                  fontFamily: 'GB', fontSize: 16, color: Colors.white),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(((context, index) {
            return _getRow(avtivityStatus.following);
          }), childCount: 5),
        ),
      ],
    );
  }

  Widget _getRow(avtivityStatus status) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 18),
      child: Row(
        children: [
          Container(
            height: 6,
            width: 6,
            decoration:
                BoxDecoration(color: Color(0xffF35383), shape: BoxShape.circle),
          ),
          SizedBox(
            width: 8,
          ),
          SizedBox(
            height: 40,
            width: 40,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: FittedBox(
                fit: BoxFit.cover,
                child: Image.asset('images/item4.png'),
              ),
            ),
          ),
          SizedBox(
            width: 8,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'shadieh.darbandi',
                    style: TextStyle(
                        fontFamily: 'GB', fontSize: 12, color: Colors.white),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    'started following',
                    style: TextStyle(
                        fontFamily: 'GB', fontSize: 10, color: Colors.white),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    ' 3 min',
                    style: TextStyle(
                        fontFamily: 'GM',
                        fontSize: 12,
                        color: Color.fromARGB(255, 194, 186, 186)),
                  ),
                  Text(
                    ' you',
                    style: TextStyle(
                        fontFamily: 'GM',
                        fontSize: 12,
                        color: Color.fromARGB(255, 194, 186, 186)),
                  )
                ],
              )
            ],
          ),
          Spacer(),
          _getActionActivitRow(status)
        ],
      ),
    );
  }

  Widget _getActionActivitRow(avtivityStatus status) {
    switch (status) {
      case avtivityStatus.followBack:
        return ElevatedButton(
          onPressed: () {},
          child: Text('follow'),
          style: Theme.of(context).elevatedButtonTheme.style,
        );
      case avtivityStatus.following:
        return OutlinedButton(
          onPressed: () {},
          child: Text(
            'Massege',
            style:
                TextStyle(color: Colors.white, fontFamily: 'GB', fontSize: 12),
          ),
          style: OutlinedButton.styleFrom(
              side: BorderSide(color: Colors.white, width: 2)),
        );
      case avtivityStatus.like:
        return SizedBox(
          height: 40,
          width: 40,
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: FittedBox(
              fit: BoxFit.cover,
              child: Image.asset('images/item1.png'),
            ),
          ),
        );

      default:
        return SizedBox(
          height: 40,
          width: 40,
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: FittedBox(
              fit: BoxFit.cover,
              child: Image.asset('images/item1.png'),
            ),
          ),
        );
    }
  }
}
