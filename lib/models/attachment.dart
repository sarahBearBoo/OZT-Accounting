class Attachment {

  /// Attributes
  String title;
  double amount;
  String desc;


  /// Constructor
  Attachment({this.title, this.amount, this.desc});
// String attPath; // attPath - Path where attachment is stored // not sure yet

  /// Setters
  void setTitle(String title){ this.title = title; }
  void setAmount(double amount) { this.amount = amount; }
  void setDesc(String desc) { this.desc = desc; }

  /// Getters
  String getTitle() => title;
  double getAmount() => amount;
  String getDesc() => desc;

}