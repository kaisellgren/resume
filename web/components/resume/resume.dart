import 'dart:async';
import 'dart:html';
import 'package:polymer/polymer.dart';

@CustomTag('x-resume')
class Resume extends PolymerElement {
  bool get applyAuthorStyles => true;

  Resume.created() : super.created() {
    new Timer(const Duration(milliseconds: 200), () {
      window.document.querySelector('body').classes.remove('initial');
    });
  }
}