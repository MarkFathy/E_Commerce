import 'package:e_commerce/core/buttons.dart';
import 'package:e_commerce/core/colors.dart';
import 'package:e_commerce/core/components/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class ForgotPassItems extends StatelessWidget {
   ForgotPassItems({super.key});
   late String email;
   final TextEditingController emailController = TextEditingController();
   final formKey = GlobalKey<FormState>();


   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text(
          'Forgot Password',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                  child: Image(
                image:const AssetImage(
                  'assets/images/pass1.png',
                ),
                height: 250.h,
                width: 250.w,
              )),
              SizedBox(height: 15.h),
              Text(
                'Please Enter Your Email Adress To \n     to Get A Verifiction Message',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18.sp,
                  color: firstColor,
                ),
              ),
              SizedBox(height: 15.h),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 5),
                child: DefaultTextField(
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Email Adress Can't be empty";
                    }
                    return null;
                  },
                  hintText: 'Email Adress',
                  onChanged: (value)
                  {
                    email=value;
                },
                ),
              ),
              SizedBox(height: 20.h),
              FirstBtn(onPressed: (){
                if(formKey.currentState!.validate())
                {
                  print(emailController.text);

                }

              }, text1: 'SUBMIT')



            ],
          ),
        ),
      ),
    );
  }
}
