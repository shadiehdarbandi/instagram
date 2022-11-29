import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class userProfile extends StatelessWidget {
  const userProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1C1F2E),
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                toolbarHeight: 80,
                // pinned: true,
                actions: [
                  Padding(
                      padding: EdgeInsets.only(top: 17, right: 17),
                      child: Icon(Icons.menu))
                ],
                bottom: PreferredSize(
                    child: Container(
                      height: 14,
                      decoration: BoxDecoration(
                        color: Color(0xff1C1F2E),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15)),
                      ),
                    ),
                    preferredSize: Size.fromHeight(14)),
                expandedHeight: 170,
                backgroundColor: Colors.black,
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.asset(
                    'images/item1.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: _getHeaderProfile(),
              ),
              SliverPersistentHeader(
                floating: true,
                pinned: true,
                delegate: tabbarViewDeligate(
                  TabBar(
                      indicatorColor: Color(0xffF35383),
                      indicatorPadding: EdgeInsets.symmetric(horizontal: 6),
                      indicatorWeight: 3,
                      tabs: [
                        Image.asset('images/icon_share.png'),
                        Image.asset('images/icon_tab_bookmark.png')
                      ]),
                ),
              )
            ];
          },
          body: TabBarView(children: [
            CustomScrollView(
              slivers: [
                SliverGrid(
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
                      QuiltedGridTile(1, 1),
                      QuiltedGridTile(1, 1),
                      QuiltedGridTile(1, 1),
                      QuiltedGridTile(1, 1),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              color: Colors.red,
            )
          ]),
        ),
      ),
    );
  }

  Widget _getHeaderProfile() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 70,
            width: 70,
            child: Padding(
              padding: EdgeInsets.all(2),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                child: FittedBox(
                  child: Image.asset('images/profile.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(17)),
              border: Border.all(
                width: 2,
                color: Color(0xffF35383),
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Container(
            height: 70,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'شادیه دربندی ',
                    style: TextStyle(
                        fontFamily: 'SM', color: Colors.white, fontSize: 16),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'shadie darbandi',
                    style: TextStyle(
                        fontFamily: 'GM', color: Colors.white, fontSize: 12),
                  )
                ],
              ),
            ),
          ),
          Spacer(),
          Image.asset('images/icon_profile_edit.png'),
        ],
      ),
    );
  }
}

class tabbarViewDeligate extends SliverPersistentHeaderDelegate {
  tabbarViewDeligate(this._tabBar);
  final TabBar _tabBar;
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      child: _tabBar,
      color: Color(0xff1C1F2E),
    );
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => _tabBar.preferredSize.height + 10;

  @override
  // TODO: implement minExtent
  double get minExtent => _tabBar.preferredSize.height + 10;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
