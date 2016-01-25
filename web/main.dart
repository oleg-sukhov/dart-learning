library packList.web;

import "dart:html";
import 'package:angular2/bootstrap.dart';

main() {

  DivElement itemContainer = new Element.tag("div");
  var title = new Element.html("<h2>PackList</h2>");
  document.body.children.add(title);

  InputElement input = new Element.tag("input");
  input.placeholder = "Enter an Item";
  input.id = "txt-item";
  input.onKeyPress.listen((event) {
    if(event.keyCode == 13) {
      addItem(event);
    }
  });
  document.body.children.add(input);

  ButtonElement button = new Element.tag("button");
  button.appendText("Add");
  button.id = "add-btn";
  button.onClick.listen((event) => addItem(event));
  document.body.children.add(button);

  itemContainer.id = "items";
  itemContainer.style.width = "300px";
  itemContainer.style.border = "1px solid black";
  itemContainer.appendHtml("&nbsp;");
  document.body.children.add(itemContainer);

}

addItem(Event event) {
  InputElement input = querySelector("input");
  PackItem newItem = new PackItem(input.value);
  var itemContainer = querySelector("#items");
  itemContainer.children.add(newItem.uiElement);
  input.value = "";

}

class PackItem {
  var itemText;
  DivElement _uiElement;
  var _isPacked = false;

  PackItem(this.itemText);

  bool get isPacked => _isPacked;

  set isPacked(value) {
    _isPacked = value;

    if(_isPacked == true) {
      uiElement.classes.add("packed");
    } else {
      uiElement.classes.remove("packed");
    }
  }

  DivElement get uiElement {
    if(_uiElement == null) {
      _uiElement = new Element.tag("div");
      _uiElement.classes.add("item");
      _uiElement.text = itemText;
      _uiElement.onClick.listen((event) => isPacked = !isPacked);
    }
    return _uiElement;
  }

}
