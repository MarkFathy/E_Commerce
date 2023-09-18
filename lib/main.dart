import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:e_commerce/auth/presentation/login/cubit/login_cubit.dart';
import 'package:e_commerce/auth/presentation/login/login_screen.dart';
import 'package:e_commerce/auth/presentation/register/cubit/register_cubit.dart';
import 'package:e_commerce/auth/presentation/register/register_screen.dart';
import 'package:e_commerce/core/components/colors.dart';
import 'package:e_commerce/core/utilis/constants.dart';
import 'package:e_commerce/features/presentation/onbording/onboarding.dart';
import 'package:e_commerce/features/splash_screen/splash_screen.dart';
import 'package:e_commerce/network/dio_helper.dart';
import 'package:e_commerce/network/local/cache_helper.dart';
import 'package:e_commerce/shop_layout/layouts/categories/categories.dart';
import 'package:e_commerce/shop_layout/layouts/home/cubit/home_cubit.dart';
import 'package:e_commerce/shop_layout/layouts/home/home.dart';
import 'package:e_commerce/shop_layout/layouts/products/products.dart';
import 'package:e_commerce/shop_layout/layouts/search/cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark,
    )
  );
  DioHelper.init();
  await CacheHelper.init();

  runApp(MyApp());


}

class MyApp extends StatelessWidget {
   MyApp({super.key,});

  @override
  Widget build(BuildContext context) {
    final token = CacheHelper.getData(key: 'token');
    final ONBOARDING = CacheHelper.getData(key: 'ONBOARDING') ?? false;
    Widget startWidget;

    if (ONBOARDING) {
      if (token != null) {
        startWidget = const HomeScreen();
      } else {
        startWidget = const LoginScreen();
      }
    } else {
      startWidget = const OnBoarding();
    }


    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
    builder: (context , child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (BuildContext context) => LoginCubit(),
            ),
            BlocProvider(
              create: (BuildContext context) => RegisterCubit(),
            ),
            BlocProvider(
              create: (BuildContext context) => HomeCubit()..getHomeData()..getCategoriesData()..getFavouritesData()..getProfileData()
            ),
            BlocProvider(
              create: (BuildContext context) => SearchCubit(),
            ),

          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                selectedItemColor: firstColor,
                unselectedItemColor: Colors.grey,

              ),
              elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
                  backgroundColor: firstColor
                )
              ),
              appBarTheme: const AppBarTheme(
                elevation: 0,
                color: Colors.transparent,
                iconTheme:IconThemeData(
                  color: Colors.black
                ),
              ),
              scaffoldBackgroundColor: mainColor
            ),
            home:AnimatedSplashScreen(
                splash:const SplashScreen(),
                nextScreen: startWidget,
                )
          ),
        );

    }

    );
  }
}
