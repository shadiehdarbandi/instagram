import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class searchScreen extends StatelessWidget {
  const searchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1C1F2E),
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: _getSearch(),
            ),
            SliverToBoxAdapter(
              child: _getStoryList(),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 17),
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
                    QuiltedGridTile(2, 1),
                    QuiltedGridTile(2, 2),
                    QuiltedGridTile(1, 1),
                    QuiltedGridTile(1, 1),
                    QuiltedGridTile(1, 1),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getcontent() {
    return Column(
      children: [
        _getStoryList(),
      ],
    );
  }

  Widget _getSearch() {
    return Container(
      margin: EdgeInsets.only(left: 18, top: 8, right: 18),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 4, horizontal: 15),
        child: Row(
          children: [
            Image.asset('images/icon_search.png'),
            SizedBox(
              width: 15,
            ),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    hintText: 'Search Users',
                    hintStyle: TextStyle(
                      color: Colors.white,
                    )),
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Image.asset('images/icon_share_bottomsheet.png'),
          ],
        ),
      ),
      height: 46,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(13)),
        color: Color.fromRGBO(255, 255, 255, 0.4),
      ),
    );
  }

  Widget _getStoryList() {
    return Container(
      height: 28,
      margin: EdgeInsets.only(
        top: 20,
        bottom: 20,
      ),
      child: ListView.builder(
        itemCount: 7,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              color: Color(0xff272B40),
            ),
            child: Center(
                child: Padding(
              padding: EdgeInsets.only(top: 5, bottom: 5, left: 16, right: 16),
              child: Text(
                'shadi$index',
                style: TextStyle(
                    color: Colors.white, fontFamily: 'GM', fontSize: 12),
              ),
            )),
          );
        },
      ),
    );
  }
}
