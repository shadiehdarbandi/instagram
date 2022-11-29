import 'dart:ui';

import 'package:flutter/material.dart';

class shareBottomSheet extends StatelessWidget {
  const shareBottomSheet({this.controller, Key? key}) : super(key: key);
  final ScrollController? controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: ClipRRect(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
          child: Container(
            color: Color.fromRGBO(255, 255, 255, 0.09),
            padding: EdgeInsets.symmetric(horizontal: 40),
            height: 300,
            child: _getContent(context),
          ),
        ),
      ),
    );
  }

  Widget _getContent(BuildContext context) {
    // return GridView.builder(
    //   controller: controller,
    //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    //     mainAxisSpacing: 20,
    //     crossAxisSpacing: 20,
    //     crossAxisCount: 4,
    //   ),
    //   itemCount: 32,
    //   itemBuilder: (BuildContext context, int index) {
    //     return Container(
    //       color: Colors.amber,
    //     );
    //   },
    // );
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        CustomScrollView(
          controller: controller,
          slivers: [
            SliverToBoxAdapter(
              child: Column(children: [
                Container(
                  margin: EdgeInsets.only(top: 10, bottom: 22),
                  height: 5,
                  width: 67,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(100),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'share ',
                      style: TextStyle(
                          fontFamily: 'GB', fontSize: 20, color: Colors.white),
                    ),
                    Image.asset('images/icon_share_bottomsheet.png')
                  ],
                ),
                SizedBox(
                  height: 32,
                ),
                Container(
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Row(
                      children: [
                        Image.asset('images/icon_search.png'),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                hintText: 'Search Users'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  height: 46,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(13)),
                    color: Color.fromRGBO(255, 255, 255, 0.4),
                  ),
                ),
                SizedBox(
                  height: 32,
                )
              ]),
            ),
            SliverGrid(
                delegate: SliverChildBuilderDelegate(((context, index) {
                  return _getItemGride();
                }), childCount: 31),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 10,
                    mainAxisExtent: 110)),
            SliverPadding(padding: EdgeInsets.only(top: 88))
          ],
        ),
        Positioned(
            bottom: 47,
            child: ElevatedButton(
                onPressed: () {},
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 13),
                    child: Text(
                      'send',
                      style: TextStyle(fontFamily: 'GB', fontSize: 16),
                    ))))
      ],
    );
  }

  Widget _getItemGride() {
    return Column(children: [
      Container(
        height: 60,
        width: 60,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.asset('images/profile.png'),
        ),
      ),
      SizedBox(
        height: 10,
      ),
      Text(
        'shadieh darbandi',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: 'GB',
          color: Colors.white,
          fontSize: 12,
        ),
      )
    ]);
  }
}
