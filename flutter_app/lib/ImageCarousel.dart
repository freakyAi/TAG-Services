import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:tagservices/Electrical.dart';
import 'package:tagservices/ac.dart';
import 'package:tagservices/cctv.dart';

final List<String> imgList = [
    'assets/images/cctv_2.jpg',
    'assets/images/ac.jpg',
    'assets/images/electrical_3.jpg'
  ];

final List pageList = [
  CCTV(),
  AC(),
  Electrical(),
];

class ImageCarousel extends StatefulWidget {
  @override
  _ImageCarouselState createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          height:180,
          enlargeCenterPage: true,
          autoPlay: true,
          autoPlayCurve: Curves.fastOutSlowIn,
          enableInfiniteScroll: true,
          autoPlayAnimationDuration: Duration(milliseconds: 500),
          viewportFraction: 0.8,
          aspectRatio: 16/9,
          onPageChanged: (index) {
              setState(() {
                _current = index;
                //print("${_current}");
              });
            },
          itemCount: imgList.length,
          itemBuilder: (BuildContext context, int itemIndex) =>
            GestureDetector(
              onTap: () {
                log("message");
                Get.to(pageList[itemIndex]);
              },
              child: Container(
                margin: EdgeInsets.all(10),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  child: Image.asset(imgList[itemIndex], fit: BoxFit.cover, width: 1000))
          ),
            ),
        ),
        //SizedBox(height:5),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          //mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(
              height: 30,
              child: ListView.builder(
              shrinkWrap: true,
              itemCount: imgList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                width: 8.0,
                height: 8.0,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _current == index
                        ? Color.fromRGBO(0, 0, 0, 0.9)
                        : Color.fromRGBO(0, 0, 0, 0.4)),
              );
                }
              ),
            ),
          ],
        )
      ],
    );
  }
}
