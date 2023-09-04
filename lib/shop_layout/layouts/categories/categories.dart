import 'package:e_commerce/core/utilis/constants.dart';
import 'package:e_commerce/network/models/categories_model.dart';
import 'package:e_commerce/shop_layout/layouts/home/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeStates>(
      listener: (context,state){},
        builder: (context,state){
        var cubit =HomeCubit.get(context);
      return ListView.separated(
        physics:const BouncingScrollPhysics(),
        itemBuilder: (context,index)=> buildCategoriesItems(cubit.categoriesModel!.data!.data![index]),
        separatorBuilder:(context,index)=> const MyDivider(),
        itemCount: cubit.categoriesModel!.data!.data!.length,
      );
    }
    );
  }
  Widget buildCategoriesItems(Data1 data1)=>Padding(
    padding: const EdgeInsets.all(10.0),
    child: Row(
      children: [
        Image(image: NetworkImage('${data1.image}'),
          height: 100.h,
          width: 100.w,
        ),
        SizedBox(width: 20.w),
        Text('${data1.name}',
          style: TextStyle(fontWeight: FontWeight.bold,
              fontSize: 21.sp),
        ),
        const Spacer(),
        const Icon(Icons.arrow_forward_ios),

      ],
    ),
  );
}
