class ClientModel {

  /// Attributes
  String name;
  String address;
  String postcode;
  // String city;
  String phone1;
  String phone2;
  String email;
  String bank;
  String accNo;


  /// Constructor
  ClientModel(this.name, this.address, this.postcode, this.phone1, this.phone2,
      this.email, this.bank, this.accNo);


  /// Setters
  void setBank(String bank) { this.bank = bank; }
  void setAccNo(String accNo) { this.accNo = accNo; }

  /// Getters
  String getBank() => bank;
  String getAccNo() => accNo;

}