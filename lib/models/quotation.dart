import 'package:accounting/models/additionalInfo.dart';
import 'customer.dart';
import 'item.dart';

class QuotationModel {

  // Attributes
  String refNo;
  Customer customer;
  Item item;
  AddInfo addInfo;

  // Constructor
  QuotationModel({this.refNo, this.customer, this.item, this.addInfo});

  // Setters
  void setRefNo(String refNo) { this.refNo = refNo; }
  void setCustomer(Customer customer) { this.customer = customer; }
  void setItem(Item item) { this.item = item; }
  void setAddInfo (AddInfo addInfo) { this.addInfo = addInfo; }

  // Getters
  String getRefNo() => refNo;
  Customer getCustomer() => customer;
  Item getItem() => item;
  AddInfo getAddInfo() => addInfo;

}
