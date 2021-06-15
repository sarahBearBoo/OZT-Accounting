class SliderModel {

  String imagePath;
  String title;
  String desc;

  SliderModel({this.imagePath, this.title, this.desc});


  // SETTERS
  void setImagePath(String getImagePath) {  imagePath = getImagePath; }
  void setTitle(String getTitle) {  title = getTitle; }
  void setDesc(String getDesc) {  desc = getDesc; }

  // GETTERS
  String getImageAssetPath() { return imagePath; }
  String getTitle() { return title; }
  String getDesc() { return desc; }

}

List<SliderModel> getSlides()  {

  List<SliderModel> slides = [];
  SliderModel sliderModel = new SliderModel();

  // 1
  sliderModel.setImagePath("assets/images/Slider 1.png");
  sliderModel.setTitle("CONVENIENT");
  sliderModel.setDesc("Create quotation, invoice, expenses and income from your smartphone, anywhere and anytime.");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  // 2
  sliderModel.setImagePath("assets/images/Slider 2.png");
  sliderModel.setTitle("REAL TIME");
  sliderModel.setDesc("Keep track of expenses and income in real time.");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  // 3
  sliderModel.setImagePath("assets/images/Slider 3.png");
  sliderModel.setTitle("CLIENT");
  sliderModel.setDesc("Keep track of clients' sales and acquisition.");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  // 4
  sliderModel.setImagePath("assets/images/Slider 4.png");
  sliderModel.setTitle("Select language");
  sliderModel.setDesc("Buttons for Choosing Language");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  return slides;
}