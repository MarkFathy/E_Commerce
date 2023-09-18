import 'package:e_commerce/auth/presentation/login/login_screen.dart';
import 'package:e_commerce/core/components/colors.dart';
import 'package:e_commerce/core/navigation_const.dart';
import 'package:e_commerce/network/local/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BoardingModel {
  final String image;
  final String body;
  final String title;

  BoardingModel({required this.image, required this.body, required this.title});
}

class OnBoardingItems extends StatelessWidget {
  OnBoardingItems({super.key});

  final PageController boardController = PageController();
  final bool isLast = false;
  void submit(context)
  {
    CacheHelper.saveData(key: 'ONBOARDING', value: true).then((value) {

      navigateAndFinish(context,const LoginScreen());

    });
  }

  @override
  Widget build(BuildContext context) {
        List<BoardingModel> boarding = [
          BoardingModel(
              image: 'assets/images/1.png',
              title: 'Looking For Items',
              body: "Explore World's top brands in our app"),
          BoardingModel(
              image: 'assets/images/2.png',
              title: 'Easy & Safe payment',
              body:
                  "             simple and reliable,\n Keeping your transaction secured "),
          BoardingModel(
              image: 'assets/images/3.png',
              title: 'Fast Delivery Service',
              body: "Your product is delivered to your home safely ")
        ];

        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(35.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 30, 5, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          submit(context);
                        },
                        child: Text(
                          'skip',
                          style: TextStyle(
                              color: secondColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.sp),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 50.h),
                Expanded(
                  child: PageView.builder(
                      controller: boardController,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) =>
                          buildBoardingItem(boarding[index]),
                      itemCount: boarding.length),
                ),
                Row(
                  children: [
                    SmoothPageIndicator(
                        controller: boardController,
                        count: boarding.length,
                        effect: ExpandingDotsEffect(
                            activeDotColor: firstColor,
                            dotHeight: 10.h,
                            dotWidth: 10.w)),
                    const Spacer(),
                    FloatingActionButton(
                      onPressed: () {
                        if (boardController.page == boarding.length - 1) {
                          submit(context);

                        } else {
                          boardController.nextPage(
                            duration: const Duration(microseconds: 800),
                            curve: Curves.fastLinearToSlowEaseIn,
                          );
                        }
                      },
                      backgroundColor: firstColor,
                      child: const Icon(
                        Icons.navigate_next,


                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        );

  }

  Widget buildBoardingItem(BoardingModel model) => Column(
        children: [
          Image(image: AssetImage(model.image)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                model.title,
                style: TextStyle(
                  fontSize: 30.sp,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
           SizedBox(height: 10.h),
          Text(
            model.body,
            style: TextStyle(color: secondColor, fontWeight: FontWeight.bold),
          )
        ],
      );
}
