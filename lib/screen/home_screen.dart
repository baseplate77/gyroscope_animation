import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gyroscope_animation/widget/gyroscope_effect.dart';
import 'package:rive/rive.dart';
import 'package:flutter/rendering.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context);
    return Scaffold(
      body: GyroscopeEffect.builder(
        maxMovableDistance: 25,
        offsetMultiplier: 0.6,
        childBuilder: (context, offset, child) => Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Transform.scale(
                scale: 1.5,
                child: const RiveAnimation.asset(
                  "assets/new_file.riv",
                  alignment: Alignment.center,
                ),
              ),
            ),
            Positioned.fill(
              child: TweenAnimationBuilder(
                  tween: Tween<Offset>(begin: Offset.zero, end: offset),
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeOutBack,
                  builder: (context, offset, child) {
                    return Stack(
                      children: [
                        // cloud
                        Positioned(
                          top: screen.viewPadding.top + 60.h,
                          right: -20.w,
                          child: Transform.translate(
                            offset: -offset * 0.4,
                            child: Image.asset(
                              "assets/cloud-2.png",
                              width: 150.r,
                            ),
                          ),
                        ),
                        Positioned(
                          top: screen.viewPadding.top + 30.h,
                          right: 70.w,
                          child: Transform(
                            alignment: FractionalOffset.center,
                            transform: Matrix4.identity()
                              ..setEntry(3, 2, 0.006)
                              ..rotateY(offset.dx * 0.008),
                            child: Transform.translate(
                              offset: -offset * 1.5,
                              child: Image.asset(
                                "assets/cloud-1.png",
                                width: 100.r,
                              ),
                            ),
                          ),
                        ),

                        Positioned(
                          top: screen.viewPadding.top + 80.h,
                          left: 40.w,
                          child: Transform.translate(
                            offset: -offset * 0.4,
                            child: Image.asset(
                              "assets/cloud-1.png",
                              width: 180.r,
                            ),
                          ),
                        ),
                        Positioned(
                          top: screen.viewPadding.top + 40.h,
                          left: -60.w,
                          child: Transform(
                            alignment: FractionalOffset.center,
                            transform: Matrix4.identity()
                              ..setEntry(3, 2, 0.006)
                              ..rotateY(offset.dx * 0.008),
                            child: Transform.translate(
                              offset: -offset * 1.5,
                              child: Image.asset(
                                "assets/cloud-3.png",
                                width: 200.r,
                              ),
                            ),
                          ),
                        ),
                        // star
                        Positioned(
                          top: screen.viewPadding.top + 10.h,
                          right: 20.w,
                          child: Image.asset(
                            "assets/star.png",
                            width: 40.w,
                          ),
                        ),
                        Positioned(
                          top: screen.viewPadding.top + 30.h,
                          left: 0.35.sw,
                          child: Image.asset(
                            "assets/star.png",
                            width: 40.w,
                            color: const Color(0xFFF7D5F7),
                          ),
                        ),
                        Positioned(
                          top: screen.viewPadding.top + 10.h,
                          left: 0,
                          child: Image.asset(
                            "assets/star.png",
                            width: 40.w,
                            color: const Color(0xFFF5F0D6),
                          ),
                        ),

                        Positioned(
                          top: 80.h,
                          left: 40.w,
                          right: 40.w,
                          child: TweenAnimationBuilder(
                              tween: Tween<Offset>(
                                  begin: Offset.zero, end: offset),
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeOutBack,
                              builder: (context, offset, child) {
                                return Transform(
                                  alignment: FractionalOffset.center,
                                  transform: Matrix4.identity()
                                    ..setEntry(3, 2, 0.006)
                                    ..rotateY(offset.dx * 0.008),
                                  child: Transform.translate(
                                    offset: -offset,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "BABY COLLECTION",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 24.sp,
                                            fontFamily: "Arlon",
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20.h,
                                        ),
                                        Opacity(
                                          opacity: 0.7,
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 20.r,
                                                vertical: 10.r),
                                            decoration: BoxDecoration(
                                              color: const Color(0xFFD1A9EF),
                                              borderRadius:
                                                  const BorderRadius.all(
                                                Radius.circular(40),
                                              ),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: const Color.fromARGB(
                                                          255, 195, 117, 255)
                                                      .withOpacity(0.5),
                                                  // offset: Offset(offset.dx + 5,
                                                  //     offset.dy + 5),
                                                  // blurRadius: 20,
                                                ),
                                                const BoxShadow(
                                                  color: Color.fromARGB(
                                                      255, 195, 117, 255),
                                                  spreadRadius: -12.0,
                                                  // offset: Offset(offset.dx + 5,
                                                  //     offset.dy + 5),
                                                  blurRadius: 12.0,
                                                ),
                                              ],
                                            ),
                                            child: const Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Search",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                Icon(
                                                  Icons.search,
                                                  color: Colors.white,
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        ),

                        // SizedBox(
                        //   width: 600,
                        //   height: 500,
                        // ),
                      ],
                    );
                  }),
            ),
            Positioned.fill(
              top: screen.viewPadding.top + 0.23.sh,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.r),
                    child: Row(
                      children: [
                        Text(
                          "Collection",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 28.sp,
                              color: Colors.white,
                              fontFamily: "Arlon"),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  SizedBox(
                    height: 40.h,
                    width: 1.sw,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(right: 25.w, left: 26.w),
                          padding: const EdgeInsets.all(10),
                          decoration: index != 1
                              ? BoxDecoration(
                                  border: Border.all(color: Colors.black45),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(40),
                                  ),
                                  color: Colors.white,
                                )
                              : null,
                          child: Image.asset(
                            "assets/icon-${index + 1}.png",
                            color: index == 1 ? Colors.white : Colors.black,
                            width: 28.r,
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  TweenAnimationBuilder(
                      tween: Tween<Offset>(begin: Offset.zero, end: offset),
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeOutBack,
                      builder: (context, offset, child) {
                        return Transform.translate(
                          offset: -offset,
                          child: Container(
                            // width: 1.sw,
                            // height: 100.h,
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  20,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.23),
                                      blurRadius: 30,
                                      offset: Offset(
                                          offset.dx + 10, offset.dy + 10))
                                ]),
                            child: Image.asset("assets/banner.png"),
                          ),
                        );
                      }),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.r, vertical: 10.r),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Related Items",
                          style:
                              TextStyle(fontFamily: "Arlon", fontSize: 28.sp),
                        ),
                        Text(
                          'All',
                          style:
                              TextStyle(fontFamily: "Arlon", fontSize: 16.sp),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: 2,
                      padding: EdgeInsets.symmetric(horizontal: 20.r),
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Column(
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              "assets/toy${index + 1}.png",
                              height: 180.h,
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            Text(
                              'Baby Night buddy',
                              style: TextStyle(
                                  fontFamily: "Arlon", fontSize: 20.sp),
                            )
                          ],
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BlendMask extends SingleChildRenderObjectWidget {
  final BlendMode blendMode;
  final double opacity;

  BlendMask({
    required this.blendMode,
    this.opacity = 1.0,
    Key? key,
    Widget? child,
  }) : super(key: key, child: child);

  @override
  RenderObject createRenderObject(context) {
    return RenderBlendMask(blendMode, opacity);
  }

  @override
  void updateRenderObject(BuildContext context, RenderBlendMask renderObject) {
    renderObject.blendMode = blendMode;
    renderObject.opacity = opacity;
  }
}

class RenderBlendMask extends RenderProxyBox {
  BlendMode blendMode;
  double opacity;

  RenderBlendMask(this.blendMode, this.opacity);

  @override
  void paint(context, offset) {
    context.canvas.saveLayer(
        offset & size,
        Paint()
          ..blendMode = blendMode
          ..color = Color.fromARGB((opacity * 255).round(), 255, 255, 255));

    super.paint(context, offset);

    context.canvas.restore();
  }
}
