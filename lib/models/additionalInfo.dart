// Class for Additional Info

class AddInfo {

  /// Attributes
  int daysValid;
  String tnc; // tnc - Terms & Condition
  int deliveryDays;
  double deliveryPrice, discountPrice;
  String remark;


  /// Constructor
  AddInfo({ this.daysValid, this.tnc, this.deliveryDays, this.deliveryPrice, this.discountPrice, this.remark});

  /// Setters
  void setDaysValid(int daysValid) { this.daysValid = daysValid; }
  void setTNC(String tnc) { this.tnc = tnc; }
  void setDeliveryDays(int deliveryDays) { this.deliveryDays = deliveryDays; }
  void setDeliveryPrice(double deliveryPrice) { this.deliveryPrice = deliveryPrice; }
  void setDiscountPrice(double discountPrice) { this.discountPrice = discountPrice; }


  /// Getters
  int getDaysValid() => daysValid;
  String getTNC() => tnc;
  int getDeliveryDays() => deliveryDays;
  double getDeliveryPrice() => deliveryPrice;
  double getDiscountPrice() => discountPrice;
  String getRemark() => remark;

}