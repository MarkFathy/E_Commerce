import 'package:e_commerce/core/components/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OTP extends StatelessWidget {
  const OTP({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent,),
      body: Form(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 64.h,
              width: 64.w,
              child: OTPTextField(onSaved: (pin1){},)
            ),
            SizedBox(
              height: 64.h,
              width: 64.w,
              child: OTPTextField(onSaved: (pin2){},)
            ),
            SizedBox(
              height: 64.h,
              width: 64.w,
              child: OTPTextField(onSaved: (pin3){},)
            ),
            SizedBox(
              height: 64.h,
              width: 64.w,
              child: OTPTextField(onSaved: (pin4){},)
            ),
            SizedBox(
                height: 64.h,
                width: 64.w,
                child: OTPTextField(onSaved: (pin5){},)
            )


          ],
        ),
      ),
    );
  }
}
