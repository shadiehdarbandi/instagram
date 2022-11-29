import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:instagram/screens/share_bottomSheet.dart';

class homeScreen extends StatelessWidget {
  const homeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        actions: [
          Container(
              width: 24,
              height: 24,
              margin: EdgeInsets.only(right: 18),
              child: Image.asset('images/icon_direct.png')),
        ],
        backgroundColor: Color(0xff1C1F2E),
        title: Container(
            width: 128, height: 24, child: Image.asset('images/mood.png')),
      ),
      backgroundColor: Color(0xff1C1F2E),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: ElevatedButton(
                  onPressed: () {
                    showModalBottomSheet(
                        barrierColor: Colors.transparent,
                        backgroundColor: Colors.transparent,
                        isScrollControlled: true,
                        context: context,
                        builder: (BuildContext Contex) {
                          return Padding(
                            padding: EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(context).viewInsets.bottom),
                            child: DraggableScrollableSheet(
                                initialChildSize: 0.5,
                                minChildSize: 0.3,
                                maxChildSize: 0.7,
                                builder: (context, controller) {
                                  return shareBottomSheet(
                                    controller: controller,
                                  );
                                }),
                          );
                        });
                  },
                  child: Text('BSH')),
            ),
            SliverToBoxAdapter(
              child: _getStoryList(),
            ),
            SliverList(delegate: SliverChildBuilderDelegate((context, index) {
              return Column(
                children: [
                  _getHeaderPoste(),
                  SizedBox(
                    height: 24,
                  ),
                  _getPost(),
                  SizedBox(
                    height: 34,
                  ),
                ],
              );
            }))
          ],
        ),
      ),
    );
  }

  Container _getStoryList() {
    return Container(
      height: 120,
      child: ListView.builder(
        itemCount: 7,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return index == 0 ? _getAddStoryBox() : _getStorryBox(58);
        },
      ),
    );
  }

  ListView _getPostList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 6,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                      barrierColor: Colors.transparent,
                      backgroundColor: Colors.transparent,
                      isScrollControlled: true,
                      context: context,
                      builder: (BuildContext Contex) {
                        return DraggableScrollableSheet(
                            initialChildSize: 0.5,
                            minChildSize: 0.3,
                            maxChildSize: 0.7,
                            builder: (context, controller) {
                              return shareBottomSheet(
                                controller: controller,
                              );
                            });
                      });
                },
                child: Text('BSH')),
            _getHeaderPoste(),
            SizedBox(
              height: 24,
            ),
            _getPost(),
            SizedBox(
              height: 34,
            ),
          ],
        );
      },
    );
  }

  Widget _getPost() {
    return Container(
      height: 440,
      width: 394,
      child: Stack(alignment: AlignmentDirectional.bottomCenter, children: [
        Positioned(
          top: 0,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset('images/post_cover.png'),
          ),
        ),
        Positioned(
          top: 15,
          right: 15,
          child: Image.asset('images/icon_video.png'),
        ),
        Positioned(
            bottom: 15,
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                child: Container(
                  child: Row(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 6,
                          ),
                          Image.asset('images/icon_hart.png'),
                          SizedBox(
                            width: 6,
                          ),
                          Text(
                            '2.5K',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'GB',
                                fontSize: 14),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 42,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 6,
                          ),
                          Image.asset('images/icon_comments.png'),
                          SizedBox(
                            width: 6,
                          ),
                          Text(
                            '1.6K',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'GB',
                                fontSize: 14),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 42,
                      ),
                      Image.asset('images/icon_share.png'),
                      SizedBox(
                        width: 59,
                      ),
                      Image.asset('images/icon_save.png'),
                    ],
                  ),
                  width: 340,
                  height: 46,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerRight,
                      end: Alignment.centerLeft,
                      colors: [
                        Color.fromRGBO(255, 255, 255, 0.5),
                        Color.fromRGBO(255, 255, 255, 0.2),
                      ],
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                ),
              ),
            )),
      ]),
    );
  }

  Widget _getHeaderPoste() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18),
      child: Row(
        children: [
          _getStorryBox(58),
          Padding(
            padding: EdgeInsets.only(left: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'shadieh.darbandi',
                  style: TextStyle(color: Colors.white, fontFamily: 'GB'),
                ),
                Text(
                  'شادیه دربندی برنامه نویس موبایل',
                  style: TextStyle(color: Colors.white, fontFamily: 'SM'),
                )
              ],
            ),
          ),
          Spacer(),
          Image.asset('images/icon_menu.png')
        ],
      ),
    );
  }

  Widget _getStorryBox(double size) {
    return Column(children: [
      Container(
        margin: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        child: DottedBorder(
          borderType: BorderType.RRect,
          radius: Radius.circular(17),
          padding: EdgeInsets.all(4),
          color: Color(0xfff35383),
          strokeWidth: 2,
          dashPattern: [10, 5],
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            child: Container(
              width: size,
              height: size,
              child: Image.asset('images/profile.png'),
            ),
          ),
        ),
      ),
      SizedBox(
        height: 4,
      ),
      Text(
        'data',
        style: TextStyle(color: Colors.white),
      )
    ]);
  }

  Widget _getAddStoryBox() {
    return Column(children: [
      Container(
        margin: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        width: 64,
        height: 64,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(17), color: Colors.white),
        child: Padding(
          padding: EdgeInsets.all(2),
          child: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Color(0xff1C1F2E),
            ),
            child: Image.asset('images/icon_plus.png'),
          ),
        ),
      ),
      SizedBox(
        height: 4,
      ),
      Text(
        'data',
        style: TextStyle(color: Colors.white),
      )
    ]);
  }
}
