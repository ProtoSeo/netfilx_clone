import 'package:flutter/material.dart';
import 'package:netflix_clone/model/model_movie.dart';
import 'package:netflix_clone/widget/box_slider.dart';
import 'package:netflix_clone/widget/carousel_slider.dart';
import 'package:netflix_clone/widget/circle_slider.dart';

class HomeScreen extends StatefulWidget {
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Movie> movies = [
    //영화 더미데이터 생성하기
    Movie.fromMap({
      'title': '사랑의 불시착',
      'keyword': '사랑/로맨스/판타지',
      'poster': 'test_movie_1.png',
      'like': false
    }),
    Movie.fromMap({
      'title': '사랑의 불시착',
      'keyword': '사랑/로맨스/판타지',
      'poster': 'test_movie_1.png',
      'like': false
    }),
    Movie.fromMap({
      'title': '사랑의 불시착',
      'keyword': '사랑/로맨스/판타지',
      'poster': 'test_movie_1.png',
      'like': true
    }),
    Movie.fromMap({
      'title': '사랑의 불시착',
      'keyword': '사랑/로맨스/판타지',
      'poster': 'test_movie_1.png',
      'like': false
    })
  ];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Stack(children: <Widget>[
          CarouselImage(movies: movies),
          TopBar(),
        ]),
        CircleSlider(movies: movies,),
        BoxSlider(movies: movies,)
      ],
    );
  }
}

class TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 7, 20, 7),
      child: Row(
          mainAxisAlignment:
              MainAxisAlignment.spaceBetween, //사이에 간격을 넣어주기 위해서 사용함
          children: <Widget>[
            Image.asset(
              'images/bbongflix_logo.png',
              fit: BoxFit.contain,
              height: 25,
            ),
            Container(
                padding: EdgeInsets.only(right: 1),
                child: Text(
                  'TV 프로그램',
                  style: TextStyle(fontSize: 14),
                )),
            Container(
                padding: EdgeInsets.only(right: 1),
                child: Text(
                  '영화',
                  style: TextStyle(fontSize: 14),
                )),
            Container(
                padding: EdgeInsets.only(right: 1),
                child: Text(
                  '내가 찜한 콘텐츠',
                  style: TextStyle(fontSize: 14),
                )),
          ]),
    );
  }
}
