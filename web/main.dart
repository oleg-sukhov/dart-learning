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
  document.body.children.add(input);

  ButtonElement button = new Element.tag("button");
  button.appendText("Add");
  button.id = "add-btn";
  button.onClick.listen((event) {
    var newItem = input.value;
    var newElement = new Element.html("<div class='item'>${newItem}<div>");
    itemContainer.children.add(newElement);
    input.value = "";

  });
  document.body.children.add(button);

  itemContainer.id = "items";
  itemContainer.style.width = "300px";
  itemContainer.style.border = "1px solid black";
  itemContainer.appendHtml("&nbsp;");
  document.body.children.add(itemContainer);

}
