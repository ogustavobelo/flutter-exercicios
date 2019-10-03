import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class SliderTest extends StatefulWidget {
  @override
  _SliderTestState createState() => _SliderTestState();
}

class _SliderTestState extends State<SliderTest> {
  List<int> days = List<int>.generate(31, (i) => i + 1);
  List<int> months = List<int>.generate(12, (i) => i + 1);
  List<int> years = List<int>.generate(100, (i) => i);

  CarouselSlider instanceDays;
  CarouselSlider instanceMonths;
  CarouselSlider instanceYears;
  int _currentDay = 1;
  int _currentMonth = 1;
  int _currentYear = 0;

  @override
  Widget build(BuildContext context) {
    instanceDays = new CarouselSlider(
      items: days.map((day) {
        return Center(
          child: Container(
            alignment: Alignment.center,
            height: day == _currentDay ? 200 : 50,
            decoration: day == _currentDay
                ? BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(.2),
                        blurRadius:
                            10.0, // has the effect of softening the shadow
                        spreadRadius:
                            -2.0, // has the effect of extending the shadow
                        offset: Offset(
                          0.0, // horizontal, move right 10
                          5.0, // vertical, move down 10
                        ),
                      )
                    ],
                  )
                : null,
            child: Text(
              '${day < 10 ? '0$day' : '$day'}',
              style: TextStyle(
                  fontSize: day == _currentDay ? 26 : 18,
                  fontWeight:
                      day == _currentDay ? FontWeight.w300 : FontWeight.w100),
              textAlign: TextAlign.center,
            ),
          ),
        );
      }).toList(),
      height: MediaQuery.of(context).size.height,
      viewportFraction: 0.25,
      aspectRatio: 2.0,
      scrollDirection: Axis.vertical,
      onPageChanged: (index) {
        setState(() {
          _currentDay = index + 1;
        });
      },
    );
    instanceMonths = new CarouselSlider(
      items: months.map((month) {
        return Center(
          child: Container(
            alignment: Alignment.center,
            height: month == _currentMonth ? 200 : 50,
            decoration: month == _currentMonth
                ? BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(.2),
                        blurRadius:
                            10.0, // has the effect of softening the shadow
                        spreadRadius:
                            -2.0, // has the effect of extending the shadow
                        offset: Offset(
                          0.0, // horizontal, move right 10
                          5.0, // vertical, move down 10
                        ),
                      )
                    ],
                  )
                : null,
            child: Text(
              '${month < 10 ? '0$month' : '$month'}',
              style: TextStyle(
                  fontSize: month == _currentMonth ? 26 : 18,
                  fontWeight: month == _currentMonth
                      ? FontWeight.w300
                      : FontWeight.w100),
              textAlign: TextAlign.center,
            ),
          ),
        );
      }).toList(),
      // height: MediaQuery.of(context).size.height,
      viewportFraction: 0.25,
      aspectRatio: 2.0,
      scrollDirection: Axis.vertical,
      onPageChanged: (index) {
        setState(() {
          _currentMonth = index + 1;
        });
      },
    );
    instanceYears = new CarouselSlider(
      items: years.map((year) {
        return Center(
          child: Container(
            alignment: Alignment.center,
            height: year == _currentYear ? 200 : 50,
            decoration: year == _currentYear
                ? BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(.2),
                        blurRadius:
                            10.0, // has the effect of softening the shadow
                        spreadRadius:
                            -2.0, // has the effect of extending the shadow
                        offset: Offset(
                          0.0, // horizontal, move right 10
                          5.0, // vertical, move down 10
                        ),
                      )
                    ],
                  )
                : null,
            child: Text(
              '${year < 10 ? '0$year' : '$year'}',
              style: TextStyle(
                  fontSize: year == _currentYear ? 26 : 18,
                  fontWeight:
                      year == _currentYear ? FontWeight.w300 : FontWeight.w100),
              textAlign: TextAlign.center,
            ),
          ),
        );
      }).toList(),
      // height: MediaQuery.of(context).size.height,
      viewportFraction: 0.25,
      aspectRatio: 2.0,
      scrollDirection: Axis.vertical,
      initialPage: 0,
      onPageChanged: (index) {
        setState(() {
          _currentYear = index;
        });
      },
    );

    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        color: Colors.grey[100],
        child: Container(
          width: 300,
          height: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                // color: Colors.red,
                width: 70,
                height: 200,
                child: instanceDays,
              ),
              Container(
                width: 70,
                height: 200,
                child: instanceMonths,
              ),
              Container(
                width: 70,
                height: 200,
                child: instanceYears,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
