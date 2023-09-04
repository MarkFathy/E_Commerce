import 'package:e_commerce/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultTextField extends StatelessWidget {
  final TextEditingController controller;
  final FormFieldValidator<String> validator;
  final bool obsecure;
  final TextInputType keyboardType;
  final ValueChanged<String> onChanged;
  final String hintText;
  final Widget? suffix;
  final VoidCallback? onEditingCompleted;
  final ValueChanged<String>? onFieldSubmitted;




  const DefaultTextField({
    super.key,
    required this.controller,
    required this.validator,
    this.keyboardType = TextInputType.text,
    this.obsecure = false,
    this.suffix,
    required this.hintText,
    required this.onChanged,
    this.onEditingCompleted,
    this.onFieldSubmitted,

  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onFieldSubmitted: onFieldSubmitted,
      controller: controller,
      validator: validator,
      keyboardType: keyboardType,
      obscureText: obsecure,
      onChanged: onChanged,
      onEditingComplete: onEditingCompleted,
      cursorColor: firstColor,
      decoration: InputDecoration(
        suffixIcon:suffix,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(25.0).r),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
              color: firstColor,
            )),
        hintText: hintText,
      ),
    );
  }
}

class OTPTextField extends StatelessWidget {
  OTPTextField({required onSaved,super.key});
   FormFieldSetter<String>? onSaved;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: true,
      onChanged: (value){
        if(value.length==1)
        {
          FocusScope.of(context).nextFocus();
        }
      },

      onSaved: onSaved,
      keyboardType: TextInputType.number,
      maxLength:1 ,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),

        ),
          counterText: "",
      ),
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.titleLarge,

    );
  }
}
