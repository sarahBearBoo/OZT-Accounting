import 'dart:io';
import 'package:accounting/models/data/SliderTilesData.dart';
import 'package:accounting/pages/login.dart';
import 'package:accounting/utilities/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<SliderModel> slides;
  int currentIndex = 0;
  PageController pageController = new PageController(initialPage: 0);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    slides = getSlides();
  }

  // The dots at the bottom sheet
  Widget pageIndexIndicator(bool isCurrentPage){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4.0),
      height: 10.0,
      width: 10.0,
      decoration: BoxDecoration(
        color: isCurrentPage ? AppColors().blue : AppColors().lightBlue,
        borderRadius: BorderRadius.circular(12.0),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: pageController,
        itemCount: slides.length,
        onPageChanged: (val){
          setState(() {
            currentIndex = val;
          });
        },
        itemBuilder: (context, index) {
          return SliderTile(
            imageAssetPath: slides[index].getImageAssetPath(),
            title: slides[index].getTitle(),
            desc: slides[index].getDesc(),
          );
        },
      ),
      bottomSheet: currentIndex != slides.length - 1 ? Container (
        height: Platform.isIOS ? 70 : 60,         // remember to import dart.io
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {

                // Controller: Goes to the last page
                pageController.animateToPage(slides.length - 1, duration: Duration(milliseconds: 400), curve: Curves.linear);
              },
              child: Text(
                'Skip',
                style: TextStyle(
                  fontSize: 17.0,
                  color: AppColors().blue,
                  fontWeight: FontWeight.w700,
                ),),
            ),
            Row(
              children: [
                for(int i = 0; i < slides.length - 1; i++) i == currentIndex ? pageIndexIndicator(true) : pageIndexIndicator(false)
              ],
            ),
            GestureDetector(
              onTap: () {
                pageController.animateToPage(currentIndex + 1, duration: Duration(milliseconds: 400), curve: Curves.linear);
              },
              child: Text(
                'Next',
                style: TextStyle(
                  fontSize: 17.0,
                  color: AppColors().blue,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ) : SizedBox(height: 70.0),
    );
  }
}

// Widget: Slider (The Main Display on the Onboarding Screen)
// ignore: must_be_immutable
class SliderTile extends StatelessWidget {

  String imageAssetPath, title, desc;
  SliderTile({this.imageAssetPath, this.title, this.desc});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: desc == "Buttons for Choosing Language" ? Column(
        children: [
          Expanded(
            flex: 6,
            child: Container(
              width: double.infinity,
              height: 500.0,
              color: Color(0xffeff3fe),
              child:  Image.asset(imageAssetPath),
            ),
          ),
          SizedBox(height: 30.0),
          SizedBox(
            height: 30.0,
            child: Text(
              title,
              style: TextStyle(
                letterSpacing: 1.0,
                fontSize: 20.0,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),

          Expanded(
            flex: 3,
            child: Column(
              children: [
                // Button for English
                Padding(
                  padding: const EdgeInsets.fromLTRB(40.0, 20.0, 40.0, 8.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (_) => Login()));
                      },
                      style: ElevatedButton.styleFrom(
                        primary: AppColors().blue,
                        onPrimary: AppColors().lightBlue,
                        elevation: 3.0,
                        padding: EdgeInsets.only(top:18.0, bottom: 18.0),
                      ),
                      child: Text('ENGLISH'),
                    ),
                  ),
                ),

                // Button for Malay
                Padding(
                  padding: const EdgeInsets.fromLTRB(40.0, 0.0, 40.0, 0.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        onPrimary: Colors.black,
                        elevation: 3.0,
                        padding: EdgeInsets.only(top:18.0, bottom: 18.0),
                      ),
                      child: Text('MALAY'),
                    ),
                  ),
                ),
              ],
            ),
          ),

        ],
      ) : Column(
        children: [
          Expanded(
            flex: 6,
            child: Container(
              width: double.infinity,
              height: 500.0,
              color: Color(0xffeff3fe),
              child: Image.asset(imageAssetPath),
            ),
          ),
          SizedBox(height: 30.0),
          SizedBox(
            height: 30.0,
            child: Text(
              title,
              style: TextStyle(
                letterSpacing: 1.2,
                fontSize: 20.0,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),

          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(40.0,8.0,40.0,8.0),
              child: Text(
                desc,
                textAlign: TextAlign.center,
                style: TextStyle(
                  height: 1.4,
                  fontSize: 15.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


