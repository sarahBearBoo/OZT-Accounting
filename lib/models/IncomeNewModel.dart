class IncomeNewModel {

  // Attributes
  // String date;
  String particular;
  String total;
  String notes;

  // Constructor
  IncomeNewModel(
    //this.date,
    this.particular, this.total, this.notes);


  // Setters
  //void setDate(String date) { this.date = date; }
  void setParticular(String particular) { this.particular = particular; }
  void setTotal(String total) { this.total = total; }
  void setNotes(String notes) { this.notes = notes; }

  // Getters
  //String getDate() => date;
  String getParticular() => particular;
  String getTotal() => total;
  String getNotes() => notes;


}