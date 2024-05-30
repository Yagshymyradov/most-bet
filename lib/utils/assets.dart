import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

enum AppIcons {
  workout('workout'),
  statistic('statistic'),
  notes('notes'),
  posts('posts'),
  boy('boy'),
  girl('girl'),
  dog('dog'),
  logoReviewers('logo-reviewers');

  final String path;

  const AppIcons(this.path);

  String get _svg => 'assets/icons/$path.svg';

  String get _png => 'assets/images/$path.png';

  String get _jpg => 'assets/icons/$path.jpg';

  Widget svgPicture({
    double? height,
    double? width,
    Color? color,
  }) =>
      SvgPicture.asset(
        _svg,
        height: height,
        width: width,
        color: color,
      );

  Widget get pngPicture => Image.asset(_png);

  Widget get jpgPicture => Image.asset(_jpg);
}
