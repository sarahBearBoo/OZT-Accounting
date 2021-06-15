class PersonInCharge {

  /// Attributes
  String name;
  String email;
  String phone1, phone2;

  /// Constructor
  PersonInCharge({
    this.name,
    this.email,
    this.phone1,
    this.phone2,
  });

  /// Setters
  void setName(String name) { this.name = name; }
  void setEmail(String email) { this.email = email; }
  void setPhone1(String phone1) { this.phone1 = phone1; }
  void setPhone2(String phone2) { this.phone2 = phone2; }

  
  /// Getters
  String getName() => name;
  String getEmail() => email;
  String getPhone1() => phone1;
  String getPhone2() => phone2;


}