import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shrimpy/constants/articles_constant.dart';
import 'package:shrimpy/constants/yt_video_constant.dart';
import 'package:shrimpy/widgets/article_tile.dart';
import 'package:shrimpy/widgets/video_tile.dart';

class Info extends StatefulWidget {
  const Info({Key? key}) : super(key: key);

  @override
  State<Info> createState() => _InfoState();
}

class _InfoState extends State<Info> {
  var articleData = carouselArticleData;
  var carouselData = carouselVideoData;
  int? currentPage;

  @override
  void initState() {
    super.initState();
    currentPage = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          const SliverAppBar(
            pinned: true,
            title: Text("Information"),
            actions: [
              Icon(Icons.search),
              SizedBox(
                width: 10,
              ),
            ],
            backgroundColor: Colors.blue,
            centerTitle: true,
            elevation: 0.0,
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 10,
            ),
          ),
          //Add the video carousel here
          SliverToBoxAdapter(
            child: Row(
              children: const [
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Trending Videos",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 10,
            ),
          ),
          SliverToBoxAdapter(
            child: LimitedBox(
              maxHeight: 275,
              child: CarouselSlider.builder(
                  itemCount: carouselData.length,
                  itemBuilder: (context, index, index2) {
                    return YoutubeVideoTile(
                        imgUrl: carouselData[index]["imgUrl"].toString(),
                        title: carouselData[index]["title"].toString(),
                        postUrl: carouselData[index]["postUrl"].toString(),
                        channelName:
                            carouselData[index]["channelName"].toString(),
                        logoUrl: carouselData[index]["logoUrl"].toString());
                  },
                  options: CarouselOptions(
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 3),
                      enableInfiniteScroll: true,
                      height: 275,
                      viewportFraction: 1,
                      onPageChanged: (index, CarouselPageChangedReason text) {
                        setState(() {
                          currentPage = index;
                        });
                      })),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 10,
            ),
          ),
          SliverToBoxAdapter(
            child: LimitedBox(
              maxHeight: 10,
              maxWidth: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: carouselData.length,
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            Container(
                              height: 6,
                              width: 6,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: currentPage == index
                                    ? Colors.black45
                                    : Colors.black26,
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                          ],
                        );
                      }),
                ],
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 10,
            ),
          ),
          SliverToBoxAdapter(
            child: Row(
              children: const [
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Recommended Articles",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 10,
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return ArticleTile(
                    imgUrl: articleData[index]['imgUrl'].toString(),
                    title: articleData[index]['title'].toString(),
                    source: articleData[index]['source'].toString(),
                    postUrl: articleData[index]['postUrl'].toString());
              },
              childCount: articleData.length,
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 20,
            ),
          ),
        ],
      ),
    );
  }
}
