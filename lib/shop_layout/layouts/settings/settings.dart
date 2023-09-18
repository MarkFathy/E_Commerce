import 'package:e_commerce/auth/presentation/login/login_screen.dart';
import 'package:e_commerce/core/components/buttons.dart';
import 'package:e_commerce/core/components/colors.dart';
import 'package:e_commerce/core/components/textfield.dart';
import 'package:e_commerce/core/navigation_const.dart';
import 'package:e_commerce/core/utilis/constants.dart';
import 'package:e_commerce/network/local/cache_helper.dart';
import 'package:e_commerce/shop_layout/layouts/home/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({super.key});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    CacheHelper.getData(key: 'token');

    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {
      },
      builder: (context, state) {
        var cubit = HomeCubit.get(context);

        if (cubit.profileModel == null || cubit.profileModel!.data == null  ) {
          return Center(
            child: CircularProgressIndicator(color: firstColor),
          );

        }
        nameController.text=cubit.profileModel!.data!.name! ;
        emailController.text=cubit.profileModel!.data!.email! ;
        phoneController.text=cubit.profileModel!.data!.phone! ;
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if(state is UpdateProfileLoadingState || state is ProfileLogOutLoadingState )
                    const LinearProgressIndicator(
                      color: Colors.red,
                      backgroundColor: Colors.white,
                      minHeight: 1,
                    ),
                  SizedBox(height: 15.h),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          // Color of the shadow
                          spreadRadius: 7,
                          blurRadius: 7,
                          offset: const Offset(
                              0, 3), //  to control the shadow's position
                        ),
                      ],
                    ),
                    child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: 50.r,
                      backgroundImage: NetworkImage(
                        '${cubit.profileModel!.data!.image}',
                      ),
                    ),
                  ),
                  SizedBox(height: 25.h),
                  DefaultTextField(
                    controller: nameController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Name Can't be empty";
                      }
                      return null;
                    },
                    labelText: 'Name',
                    prefixIcon:
                    const Icon(Icons.account_circle_sharp, color: Colors.grey),
                    readOnly: false,
                  ),
                  SizedBox(height: 25.h),
                  DefaultTextField(
                    controller: emailController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Email Adress Can't be empty";
                      }
                      return null;
                    },
                    labelText: 'Email Adress',
                    prefixIcon:
                    const Icon(Icons.email_outlined, color: Colors.grey),
                    readOnly: false,
                  ),
                  SizedBox(height: 25.h),
                  DefaultTextField(
                    readOnly: false,
                    controller: phoneController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Phone Can't be empty";
                      }
                      return null;
                    },
                    labelText: 'Phone',

                    prefixIcon: const Icon(Icons.phone_android_outlined,
                        color: Colors.grey),
                  ),
                  SizedBox(height: 25.h),
                  FirstBtn(text1: 'Update', onPressed: (){
                    if(formKey.currentState!.validate())
                      {
                        cubit.updateProfileData(
                          email: emailController.text,
                          name: nameController.text,
                          phone: phoneController.text,
                        );
                      }


                  }),
                  SizedBox(height: 25.h),
                  FirstBtn(text1: 'SignOut', onPressed: (){
                    cubit.logOutModel;
                    CacheHelper.removeData(key: 'token');
                    navigateAndFinish(context,const LoginScreen());
                    cubit.currentIndex=0;
                    if(token == null)
                      {
                        print('Finally removed');
                      }
                    else{
                      print('this shit ');
                    }
                  }),




                ],
              ),
            ),
          ),
        );

      },
    );
  }
}