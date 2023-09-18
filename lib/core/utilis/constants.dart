import 'package:e_commerce/auth/presentation/login/login_screen.dart';
import 'package:e_commerce/core/navigation_const.dart';
import 'package:e_commerce/network/local/cache_helper.dart';
import 'package:flutter/material.dart';

String ?token = '';
final bool firstScreen=CacheHelper.getData(key: 'firstScreen') ?? false;
// دي ميثود بتطبع التيكست كله لما اكون بستخدم api كبير مثلا

void printFullText(String text){
  final pattern =RegExp('.{1,800}');
  pattern.allMatches(text).forEach((element) =>print(element.group(0)));
}

class MyDivider extends StatelessWidget {
  const MyDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(
      height: 20.0,
      color: Colors.grey,
      thickness: 0.3,
      indent: 25,
      endIndent: 25,
    );
  }
}

void signOut(BuildContext context)
{
  CacheHelper.removeData(key:'token').then((value)
  {
    navigateAndFinish(context,const LoginScreen());
  });
}

