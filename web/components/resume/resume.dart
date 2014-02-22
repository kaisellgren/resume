import 'dart:async';
import 'dart:html';
import 'package:polymer/polymer.dart';

@CustomTag('x-resume')
class Resume extends PolymerElement {
  bool get applyAuthorStyles => true;

  String get formattedTimeAsFounder {
    var diff = new DateTime.now().difference(new DateTime(2013, 1, 1));
    var y = (diff.inDays / 365).floor();
    var m = (diff.inDays / 30).floor() - 12 * y;

    var b = new StringBuffer();

    if (y == 1) b.write('$y year');
    else b.write('$y years');

    if (m > 1) b.write(' $m months');
    else if (m > 0) b.write(' $m month');

    return b.toString();
  }

  Resume.created() : super.created() {
    new Timer(const Duration(milliseconds: 200), () {
      window.document.querySelector('body').classes.remove('initial');
    });
  }

  enteredView() {
    var block = getShadowRoot('x-resume').querySelector('.profile-inner-block');
    var topY = block.offsetTop;

    window.onScroll.listen((e) {
      if (window.scrollY > topY) {
        block.classes.add('profile-inner-block-fixed');
      } else {
        block.classes.remove('profile-inner-block-fixed');
      }
    });
  }
}