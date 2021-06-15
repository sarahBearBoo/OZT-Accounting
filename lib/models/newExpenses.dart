class NewExpenses {

  /// Attributes
  String paymentType;
  String address, postcode, city;
  String phone1, phone2;
  String email, date;
  String purpose;

  NewExpenses({
    this.paymentType,
    this.address,
    this.postcode,
    this.city,
    this.phone1,
    this.phone2,
    this.email,
    this.date,
    this.purpose}); // e.g: Quotation for ... Invoice for ...

  /// Setters

  void setAddress(String address) { this.address = address; }
  void setPostcode(String postcode) { this.postcode = postcode; }
  void setCity(String city) { this.city = city; }
  void setPhone1(String phone1) { this.phone1 = phone1; }
  void setPhone2(String phone2) { this.phone2 = phone2; }
  void setEmail(String email) { this.email = email; }
  void setDate(String date) { this.date = date; }
  void setPurpose(String purpose) { this.purpose = purpose; }

  /// Getters

  String getAddress() => address;
  String getPostcode() => postcode;
  String getCity() => city;
  String getPhone1() => phone1;
  String getPhone2() => phone2;
  String getEmail() => email;
  String getDate() => date;
  String getPurpose() => purpose;

}