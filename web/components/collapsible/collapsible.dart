import 'package:polymer/polymer.dart';
import 'dart:html';

@CustomTag('x-collapsible')
class CollapsibleElement extends PolymerElement {
  @published var readMoreText = 'Click here to read more';
  @published int initialHeight = 64;
  @observable bool expanded = false;

  Element container;

  bool get applyAuthorStyles => true;

  CollapsibleElement.created() : super.created();

  enteredView() {
    var root = getShadowRoot('x-collapsible');

    container = root.querySelector('.x-collapsible-container');
    container.style.height = '${initialHeight}px';
  }

  void expand() {
    // Calculate the target height.
    container.classes.add('no-transition');

    var originalHeight = container.clientHeight;

    container.style.height = 'auto';
    var targetHeight = container.clientHeight;

    container.style.height = '${originalHeight}px';

    container.classes.remove('no-transition');

    container.style.height = '${targetHeight}px';
    expanded = true;
  }
}