import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onboarding_app/controllers/onBoardingControllerData.dart';
import 'package:onboarding_app/models/onboardingInfo.dart';

class Onboarding extends StatelessWidget {
  final controller = new onBoardingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PageView.builder(
              controller: controller.pageController,
                onPageChanged: controller.selectedPageIndex,
                itemCount: controller.pageInfo.length,
                itemBuilder: (context, index) {
              return Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(controller.pageInfo[index].image,
                     // height: MediaQuery.of(context).size.height,
                     // width: MediaQuery.of(context).size.width,
                    ),
                    SizedBox(height: 40,),
                    Text(controller.pageInfo[index].title,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),),
                    SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(50.0, 0.0, 50.0, 0.0),
                      child: Text(controller.pageInfo[index].pageDescription,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 19.0,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
            ),
            Positioned(
              bottom: 20,
              left: 20,
              child: Row(
                children:List.generate(controller.pageInfo.length, (index) => Obx(() {
                    return Container(
                      margin: EdgeInsets.all(2.0),
                      height: 10,
                      width: 10,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: controller.selectedPageIndex == index?Colors.red: Colors.grey,
                      ),

                    );
                  }
                ))
              ),
            ),
            Positioned(
              bottom: 10,
              right: 160,
              child: FloatingActionButton(
                onPressed: () => controller.gotoNextPage(),
                child: Obx((){return Text(controller.isLastPage?"Start":"Next");}),
            )
            )
          ]
        ),
      ),
    );
  }
}