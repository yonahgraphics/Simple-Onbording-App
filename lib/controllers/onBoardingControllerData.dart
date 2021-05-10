import 'package:flutter/cupertino.dart';
import 'package:onboarding_app/models/onboardingInfo.dart';
import 'package:get/state_manager.dart';
import 'package:get/utils.dart';

class onBoardingController extends GetxController{

var selectedPageIndex = 0.obs;
var pageController = PageController();
bool get isLastPage => selectedPageIndex.value == pageInfo.length-1;
gotoNextPage()
{
  if(isLastPage) {
    //go to the home page
  }
    else
      pageController.nextPage(duration: Duration(milliseconds: 400), curve: Curves.easeIn);
}
  List<onBoardingInfo> pageInfo = [
  onBoardingInfo("assets/order.png", "Order Your Food", "Simply think of what you want to eat and let us know"),
  onBoardingInfo("assets/cook.png", "We'll Cook It Well", "Our expert cooks and chefs will make it ready for you"),
    onBoardingInfo("assets/deliver.png", "Get It Fast", "Our experience delivery team will bring it to your doorsteps")
  ];
}