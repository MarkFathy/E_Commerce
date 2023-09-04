import 'package:e_commerce/auth/presentation/register/cubit/register_cubit.dart';
import 'package:e_commerce/core/buttons.dart';
import 'package:e_commerce/core/colors.dart';
import 'package:e_commerce/core/components/textfield.dart';
import 'package:e_commerce/core/navigation_const.dart';
import 'package:e_commerce/shop_layout/layouts/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterItems extends StatelessWidget {
  RegisterItems({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        var cubit=RegisterCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            backgroundColor: mainColor,
            elevation: 0,
          ),
          body: SingleChildScrollView(
            child: Form(
              child: Column(
                children: [
                  const Image(
                    image: AssetImage('assets/images/signup.png'),
                    height: 150,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 5),
                    child: DefaultTextField(
                      keyboardType: TextInputType.text,
                      controller: nameController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Name Can't be empty";
                        }
                        return null;
                      },
                      hintText: 'Name',
                      onChanged: (value) {},
                    ),
                  ),
                  SizedBox(height: 15.h),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 5),
                    child: DefaultTextField(
                      keyboardType: TextInputType.text,
                      controller: phoneController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Phone Can't be empty";
                        }
                        return null;
                      },
                      hintText: 'Phone',
                      onChanged: (value) {},
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
                      onChanged: (value) {},
                    ),
                  ),
                  SizedBox(height: 15.h),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 5),
                    child: DefaultTextField(
                      obsecure: cubit.isSecured,
                      keyboardType: TextInputType.text,
                      controller: passController,
                      suffix: cubit.togglePass(),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Password Cant be empty';
                        } else if (value.length < 5) {
                          return 'Password Cant be less than 5';
                        }
                        return null;
                      },

                      hintText: 'Password',
                      onChanged: (value) {},
                    ),
                  ),
                  SizedBox(height: 20.h),
                  if (state is RegisterLoadingState)
                    CircularProgressIndicator(color: firstColor)
                  else
                    FirstBtn(
                      text1: 'Sign Up',
                      onPressed: () {
                        cubit.userRegister(
                            name:nameController.text,
                            email: emailController.text,
                            password: passController.text,
                            phone: phoneController.text);
                      },
                    ),

                  SizedBox(height: 20.h),
                  const Text(
                    '- Sign Up with -',
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w700,
                        fontSize: 15),
                  ),
                  SizedBox(height: 30.h),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    InkWell(
                      onTap: () {
                        navigateTo(context, const HomeScreen());
                      },
                      child: CircleAvatar(
                        backgroundImage:
                            const AssetImage('assets/icons/google.png'),
                        radius: 25.r,
                        backgroundColor: Colors.transparent,
                      ),
                    ),
                    SizedBox(width: 40.w),
                    InkWell(
                      onTap: () {
                        navigateTo(context, const HomeScreen());
                      },
                      child: CircleAvatar(
                        backgroundImage:
                            const AssetImage('assets/icons/face.png'),
                        radius: 25.r,
                        backgroundColor: Colors.transparent,
                      ),
                    ),
                  ])
                ],
              ),
            ),
          ),
        );
      },

    );
  }
}
