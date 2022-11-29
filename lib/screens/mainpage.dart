import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class main_page extends StatelessWidget {
  const main_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1C1F2E),
      body: SafeArea(
        child: Stack(
          children: [
            CustomScrollView(
              slivers: <Widget>[
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Text(
                          'Post',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'GB',
                              fontSize: 18),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Image.asset('images/icon_arrow_down.png'),
                        Spacer(),
                        Text(
                          'Next',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'GB',
                              fontSize: 18),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Image.asset('images/icon_arrow_right_box.png'),
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                    child: Container(
                  height: 400,
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: Image.asset('images/item9.png'),
                    ),
                  ),
                )),
                SliverPadding(
                  padding: EdgeInsets.all(10),
                  sliver: SliverGrid(
                    delegate: SliverChildBuilderDelegate(
                        (context, index) => Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                child: FittedBox(
                                  fit: BoxFit.cover,
                                  child: Image.asset('images/item$index.png'),
                                ),
                              ),
                            ),
                        childCount: 10),
                    gridDelegate: SliverQuiltedGridDelegate(
                      crossAxisCount: 3,
                      mainAxisSpacing: 5,
                      crossAxisSpacing: 5,
                      repeatPattern: QuiltedGridRepeatPattern.inverted,
                      pattern: [
                        QuiltedGridTile(1, 1),
                        QuiltedGridTile(1, 1),
                        QuiltedGridTile(1, 1),
                      ],
                    ),
                  ),
                ),
                SliverPadding(
                    padding: EdgeInsets.only(
                  bottom: 83,
                ))
              ],
            ),
            Container(
              child: Padding(
                padding: EdgeInsets.only(top: 18, left: 18, right: 18),
                child: Row(
                  children: [
                    Text(
                      'Gallery',
                      style: TextStyle(
                          color: Colors.white, fontFamily: 'GB', fontSize: 18),
                    ),
                    Text(
                      'Next',
                      style: TextStyle(
                          color: Colors.white, fontFamily: 'GB', fontSize: 18),
                    ),
                    Text(
                      'draft',
                      style: TextStyle(
                          color: Color.fromARGB(255, 211, 91, 91),
                          fontFamily: 'GB',
                          fontSize: 18),
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                ),
              ),
              height: 83,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xff1C1F2e),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
              ),
            )
          ],
          alignment: AlignmentDirectional.bottomCenter,
        ),
      ),
    );
  }
}
