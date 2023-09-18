

import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/core/components/colors.dart';
import 'package:e_commerce/core/utilis/size_config.dart';
import 'package:e_commerce/network/models/categories_model.dart';
import 'package:e_commerce/network/models/home_model.dart';
import 'package:e_commerce/shop_layout/layouts/home/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});


  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {
        if(state is ChangeFavouritesSuccessState)
          {
            if (state.model.status != null && !state.model.status!) {

              Fluttertoast.showToast(
              msg:'${state.model.message}',
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red.withOpacity(0.7),
              textColor: Colors.white,
              fontSize: 16.0,
              );

              }
          }
      },
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        if (cubit.homeModel == null ||
            cubit.homeModel!.data == null ||
            cubit.categoriesModel == null ||
            cubit.categoriesModel!.data == null) {
          return Center(
            child: CircularProgressIndicator(color: firstColor),
          );
        }

        return builderWidget(cubit.homeModel!, cubit.categoriesModel!, context);
      },
    );
  }

  Widget builderWidget(HomeModel model, CategoriesModel categoriesModel, context) => SingleChildScrollView(
    physics: const BouncingScrollPhysics(),
    child: Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CarouselSlider(
            items: model.data!.banners!
                .map((e) =>
                Image(
                  image: NetworkImage('${e.image}'),
                  width: double.infinity,
                  fit: BoxFit.cover,
                ))
                .toList(),
            options: CarouselOptions(
              height: SizeConfig.defaultSize! * 30,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(seconds: 3),
              autoPlayCurve: Curves.easeIn,
              scrollDirection: Axis.horizontal,
              viewportFraction: 1.0,
            ),
          ),
          SizedBox(height: SizeConfig.defaultSize! * 2),
          Text(
            'Categories',
            style: TextStyle(
              fontSize: SizeConfig.defaultSize! * 2.5,
            ),
          ),
          SizedBox(height: SizeConfig.defaultSize! * 4),
          SizedBox(
            height: SizeConfig.defaultSize! * 12,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              physics:const BouncingScrollPhysics(),
              itemBuilder: (context, index) => categoriesBuilder(categoriesModel.data!.data![index]),
              separatorBuilder: (context, index) => SizedBox(width: SizeConfig.defaultSize! * 2), // Adjust width using defaultSize
              itemCount: categoriesModel.data!.data!.length,
            ),
          ),
          SizedBox(height: SizeConfig.defaultSize! * 3),
          Text(
            'Products',
            style: TextStyle(
              fontSize: SizeConfig.defaultSize! * 2.5,
            ),
          ),
          SizedBox(height: SizeConfig.defaultSize! * 1),
          Container(
            color: Colors.grey[200],
            child: GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 1,
              crossAxisSpacing: 1,
              shrinkWrap: true,
              childAspectRatio: 1 / 1.82,
              crossAxisCount: 2,
              children: List.generate(
                  model.data!.products!.length, (index) => builderGridView(model.data!.products![index], context)),
            ),
          ),
        ],
      ),
    ),
  );

  Widget builderGridView(Products model,BuildContext context) {
    return  Container(
      color: mainColor,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                Image(image: NetworkImage(model.image ?? ''),
                  height: 200.h,
                  width: double.infinity,

                ),
                if(model.discount != 0)
                  Container(

                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    color: firstColor,
                    child: Text('Discount',
                      style: TextStyle(fontSize: 10.sp,
                          color: mainColor,
                          fontFamily: 'Pacifico'),
                    ),
                  )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(model.name ?? '',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 13.sp,
                        height: 1.4,
                        fontWeight: FontWeight.w700
                    ),


                  ),
                  SizedBox(height:5.h),
                  Row(
                    children: [
                      Text('${model.price}',
                        maxLines: 1,
                        style: TextStyle(
                            fontSize: 11.sp,
                            color: firstColor,
                            fontWeight: FontWeight.w700
                        ),

                      ),
                      SizedBox(width: 2.w),
                      Text('EGP',
                        style: TextStyle(
                            fontSize: 10.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.w700
                        ),

                      ),
                      SizedBox(width: 4.w),
                      if(model.discount != 0)
                        Text('${model.oldPrice}',
                          maxLines: 1,
                          style: TextStyle(
                              fontSize: 10.sp,
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough

                          ),

                        ),
                      const Spacer(),
                      CircleAvatar(
                        radius: 17.r,
                        backgroundColor:HomeCubit.get(context).favourites[model.id]==true ?firstColor :Colors.grey
                        ,
                        child: IconButton(onPressed: () {
                          HomeCubit.get(context).changeFav(model.id);
                          print(HomeCubit.get(context).favourites[model.id].toString());
                        },
                            icon: Icon(Icons.favorite_outline,
                                color: mainColor,
                                size: 22)),
                      ),

                    ],
                  ),
                ],
              ),
            ),
          ]
      ),
    );
  }


  Widget categoriesBuilder(Data1 data1) =>
      Column(
        children: [
          SizedBox(
            width: 80.w,
            height: 70.h,
            child: Image(image: NetworkImage('${data1.image}',)
            ),
          ),
          Text('${data1.name}',
            style:const TextStyle(
              fontWeight: FontWeight.w500,
            ),

          ),
        ],
      );

}
