import 'package:e_commerce/network/local/cache_helper.dart';
import 'package:flutter/material.dart';

String token = '';
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

