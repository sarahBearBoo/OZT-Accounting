import 'customer.dart';

class Client extends Customer {

  // Attributes
  String bank;
  int accNo;                                                                     // accNo - Account Number

  /// Constructor
  Client({
    String name, String address, String postcode,
    String city, String phone1, String phone2,
    String email, this.bank, this.accNo}) :
        super(name: name, address: address, postcode: postcode, city: city, phone1: phone1, phone2: phone2, email: email);

  /// Setters
  void setBank(String bank) { this.bank = bank; }
  void setAccNo(int accNo) { this.accNo = accNo; }

  /// Getters
  String getBank() => bank;
  int getAccNo() => accNo;

}