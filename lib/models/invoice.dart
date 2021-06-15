import 'additionalInfo.dart';
import 'customer.dart';
import 'item.dart';

class InvoiceModel {

  // Attributes
  String refNo;
  String status;
  Customer customer;
  Item item;
  AddInfo addInfo;

  // Constructor
  InvoiceModel({this.refNo, this.status, this.customer, this.item, this.addInfo});

  // Setters
  void setRefNo(String refNo) { this.refNo = refNo; }
  void setStatus(String status) { this.status = status; }
  void setCustomer(Customer customer) { this.customer = customer; }
  void setItem(Item item) { this.item = item; }
  void setAddInfo (AddInfo addInfo) { this.addInfo = addInfo; }

  // Getters
  String getRefNo() => refNo;
  String getStatus() => status;
  Customer getCustomer() => customer;
  Item getItem() => item;
  AddInfo getAddInfo() => addInfo;

}
