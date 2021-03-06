import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../bar_graph/bar_graph.dart';
import '../utils/styles.dart';
import '../utils/colors.dart';
import '../widgets/activity_card.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key key}) : super(key: key);
  static final math.Random random = math.Random();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15, right: 15, top: 20),
      color: ColorPalette.background,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildTitle,
          _sizedBox30,
          _row1,
          _sizedBox20,
          _row2,
          _sizedBox30,
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _sizedBox20,
                  _buildActivityStats,
                  _sizedBox20,
                  _buildTimeline,
                  _sizedBox20,
                  FutureBuilder(
                    future: _generateBarGraph,
                    builder: (_, snapshot) =>
                        snapshot.connectionState == ConnectionState.waiting
                            ? Container()
                            : snapshot.data,
                  ),
                  _sizedBox20,
                  _buildFilter,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<Widget> get _generateBarGraph async {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(15, (_) {
        var progress = 75 + 55 * random.nextDouble();
        var miliseconds = 300 + random.nextInt(1200);
        return BarGraph(
          progress: progress,
          duration: Duration(milliseconds: miliseconds),
        );
      }),
    );
  }

  static const _sizedBox30 = SizedBox(height: 30);
  static const _sizedBox20 = SizedBox(height: 20);

  static final Widget _buildTitle = Text(
    'ACTIVITIES',
    style: Styles.title.copyWith(
      color: Colors.black54,
      letterSpacing: 1,
      fontWeight: FontWeight.w900,
    ),
    textAlign: TextAlign.center,
  );

  static final Widget _row1 = Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      ActivityCard(
        activity: 'Swimming',
        background: ColorPalette.red,
        imagePath: 'assets/images/swimming.PNG',
      ),
      ActivityCard(
        activity: 'Cycling',
        background: ColorPalette.teal,
        imagePath: 'assets/images/cycling.PNG',
      ),
      ActivityCard(
        activity: 'Running',
        background: ColorPalette.blue,
        imagePath: 'assets/images/running.PNG',
      ),
    ],
  );

  static final Widget _row2 = Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      ActivityCard(
        activity: 'Yoga',
        background: ColorPalette.purple,
        imagePath: 'assets/images/yoga.PNG',
      ),
      ActivityCard(
        activity: 'Dance',
        background: ColorPalette.activityPurple,
        imagePath: 'assets/images/dance.PNG',
      ),
      ActivityCard(
        activity: 'Gym',
        background: ColorPalette.cyan,
        imagePath: 'assets/images/gym.PNG',
      ),
    ],
  );

  static final Widget _buildActivityStats = Padding(
    padding: EdgeInsets.symmetric(horizontal: 15),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '4865',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w500,
                color: Colors.black.withOpacity(0.7),
              ),
            ),
            Text(
              'Steps',
              style: TextStyle(
                color: Colors.black38,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        Spacer(),
        Text(
          'Running',
          style: TextStyle(
            color: ColorPalette.purple,
            fontSize: 15,
            letterSpacing: 1.1,
          ),
        ),
        SizedBox(width: 5),
        Icon(
          Icons.directions_run,
          color: ColorPalette.purple,
          size: 18,
        ),
      ],
    ),
  );

  static Widget _buildText(String data, [bool highlight = false]) {
    return Text(
      data,
      style: TextStyle(
        color: highlight ? Colors.black : Colors.black26,
        fontWeight: FontWeight.w600,
        fontSize: 16,
      ),
    );
  }

  static final Widget _buildTimeline = Padding(
    padding: EdgeInsets.symmetric(horizontal: 15),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildText('3am'),
        _buildText('6am'),
        _buildText('7am'),
        _buildText('12pm'),
        _buildText('15pm'),
        _buildText('18pm', true),
      ],
    ),
  );

  static final Widget _buildFilter = Padding(
    padding: EdgeInsets.symmetric(horizontal: 15),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildText('Day', true),
        _buildText('Week'),
        _buildText('Month'),
      ],
    ),
  );
}
