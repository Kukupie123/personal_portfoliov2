// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, file_names

import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

import 'TabData.dart';

class AnimatedNavbar extends StatefulWidget {
  final List<TabData> tabs;
  final TabController controller;

  const AnimatedNavbar({Key? key, required this.tabs, required this.controller})
      : super(key: key);

  @override
  State<AnimatedNavbar> createState() => _AnimatedNavbarState();
}

class _AnimatedNavbarState extends State<AnimatedNavbar> {
  int activeIndex = 0;

  final Curve viewCurve = Curves.bounceIn;
  final Duration animationDuration = const Duration(milliseconds: 400);
  final Curve navCurve = Curves.easeInOut;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(
      () {
        setState(() {
          activeIndex = widget.controller.index;
        });
      },
    );
  }



  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(

        filter:ImageFilter.blur(sigmaX: 5,sigmaY: 5),
        child: AnimatedContainer(
          duration: Duration(milliseconds: Random().nextInt(1000)),
          curve: Curves.easeInOut,
          decoration: const BoxDecoration(
              color: Color(0x99093543),
              borderRadius: BorderRadius.all(Radius.circular(60))),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Expanded(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: tabsToWidget(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> tabsToWidget() {
    return widget.tabs.asMap().entries.map((e) {
      Widget child = e.value.widget;
      String label = e.value.label;
      int index = e.key;
      bool active = index == activeIndex;
      return AnimatedOpacity(
        duration: animationDuration,
        curve: navCurve,
        opacity: active ? 1.0 : 0.25,
        child: GestureDetector(
          onTap: () => widget.controller.animateTo(
            index,
            curve: viewCurve,
            duration: animationDuration,
          ),
          child: Column(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: AnimatedScale(
                  duration: const Duration(milliseconds: 1400),
                  curve: Curves.elasticOut,
                  scale: active ? 1.5 : 1,
                  child: AnimatedSlide(
                    duration: animationDuration,
                    curve: navCurve,
                    offset:
                        active ? const Offset(0, -0.25) : const Offset(0, 0),
                    child: child,
                  ),
                ),
              ),
              AnimatedScale(
                duration: const Duration(milliseconds: 1000),
                curve: Curves.bounceOut,
                scale: active ? 1.2 : 0,
                child: AnimatedSlide(
                    duration: animationDuration,
                    curve: navCurve,
                    offset: active ? const Offset(0, 0.4) : const Offset(0, 0),
                    child: Text(label)),
              ),
            ],
          ),
        ),
      );
    }).toList();
  }
}
