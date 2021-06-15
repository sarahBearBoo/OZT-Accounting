/*
====================================================
    Class : Item
    ------------
    >> Used in: Quotation

====================================================
 */

class Item {

  /// Attributes
  String name;
  int quantity;
  double price;
  String desc;


  /// Constructor
  Item({this.name, this.quantity, this.price, this.desc});

  /// Setters
  void setName(String name) { this.name = name; }
  void setQuantity(int quantity) {  this.quantity = quantity; }
  void setPrice(double price) { this.price = price; }
  void setDesc(String desc) { this.desc = desc; }


  /// Getters
  String getName() => name;
  int getQuantity() => quantity;
  double getPrice() => price;
  String getDesc() => desc;

}