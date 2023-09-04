
import 'package:e_commerce/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Generalbtn extends StatelessWidget {
    Generalbtn({required this.text,super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Expanded(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(onPressed: (){
          },
            style:ElevatedButton.styleFrom(
              shape:RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.sp)
              ),
            ), child: Text(text,
          style: TextStyle(
            color: mainColor,
            fontSize: 20.sp
          ),
          ),


          ),
        ),
      ),
    );
  }
}
class FirstBtn extends StatelessWidget {
   FirstBtn({required this.text1,super.key,required this.onPressed});
   String text1;
   final VoidCallback? onPressed;

   @override
  Widget build(BuildContext context) {
    return Container(
      height: 35.h,
      width: 110.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25).r,
        color: firstColor
      ),
      child: TextButton(onPressed: onPressed,child: Text(text1,
      style: TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.w500,
        color: mainColor
      ),
      ),
      ),
    );
  }
}

