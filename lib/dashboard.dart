import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BalanceWidget extends StatefulWidget {
  //const BalanceWidget({Key key}) : super(key: key);

  @override
  _BalanceWidgetState createState() => _BalanceWidgetState();
}

class _BalanceWidgetState extends State<BalanceWidget> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(5.0.r)),
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Colors.grey.shade800,
              const Color(0xFF000000),
            ])),
        width: MediaQuery.of(context).size.width,
        child: Padding(
            padding: EdgeInsets.all(15.0.r),
            child: Column(
              children: [
                SizedBox(
                  height: 15.h,
                ),
                CircularPercentIndicator(
                  radius: 190.0.r,
                  animation: true,
                  animationDuration: 2000,
                  lineWidth: 15.0,
                  percent: 0.9,
                  reverse: true,
                  arcBackgroundColor: const Color(0xFF14bae3),
                  arcType: ArcType.FULL,
                  center: Column(
                    children: [
                      SizedBox(
                        height: 37.h,
                      ),
                      Text(
                        '99 GW',
                        style: TextStyle(
                            fontSize: 30.sp,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        'earned so far this week',
                        style: TextStyle(fontSize: 15.sp, color: Colors.white),
                      ),
                      SizedBox(
                        height: 10.sp,
                      ),
                      Text(
                        '1000 GW',
                        style: TextStyle(
                            fontSize: 21.sp,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ),
                      SizedBox(
                        height: 5.sp,
                      ),
                      Text(
                        'Last week',
                        style: TextStyle(fontSize: 15.sp, color: Colors.white),
                      ),
                    ],
                  ),
                  circularStrokeCap: CircularStrokeCap.butt,
                  backgroundColor: Colors.yellow,
                  progressColor: const Color(0xFF21242c),
                ),
                SizedBox(
                  height: 15.sp,
                ),
                Text(
                  'Donate more & score more!',
                  style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 25.sp,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(30.0.r)),
                  child: Container(
                      height: 50.h,
                      width: 300.w,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.all(Radius.circular(30.0.r)),
                      ),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(15.w, 10.h, 15.w, 10.h),
                        child: Center(
                          child: Text(
                            'START DONATING',
                            style: TextStyle(
                              fontSize: 20.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      )),
                ),
                SizedBox(
                  height: 15.h,
                ),
              ],
            )),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  // const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
            child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                    padding: EdgeInsets.fromLTRB(10.w, 10.h, 10.w, 10.h),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius:
                              BorderRadius.all(Radius.circular(5.0.r)),
                          child: Container(
                              width: double.maxFinite,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                border: Border.all(color: Colors.grey),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0.r)),
                              ),
                              child: Padding(
                                padding:
                                    EdgeInsets.fromLTRB(15.w, 15.h, 15.w, 15.h),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          FeatherIcons.clock,
                                          size: 25.0.r,
                                          color: Colors.white,
                                        ),
                                        SizedBox(width: 10.w),
                                        Text(
                                          'DashBoard',
                                          style: TextStyle(
                                              fontSize: 18.sp,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.white),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              )),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        BalanceWidget(),
                      ],
                    )))));
  }
}
