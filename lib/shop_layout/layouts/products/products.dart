

import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/core/colors.dart';
import 'package:e_commerce/network/models/categories_model.dart';
import 'package:e_commerce/network/models/home_model.dart';
import 'package:e_commerce/shop_layout/layouts/home/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        if (cubit.homeModel == null || cubit.homeModel!.data == null || cubit.categoriesModel!.data == null || cubit.categoriesModel== null ) {
          return Center(
            child: CircularProgressIndicator(color: firstColor),
          );
        }
        return builderWidget(cubit.homeModel!,cubit.categoriesModel!,context);
      },
    );
  }

  Widget builderWidget(HomeModel model,CategoriesModel categoriesModel, context) =>
      SingleChildScrollView(
        physics: BouncingScrollPhysics(),
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
                    height: 240.h,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 3),
                    autoPlayAnimationDuration: const Duration(seconds: 3),
                    autoPlayCurve: Curves.easeIn,
                    scrollDirection: Axis.horizontal,
                    viewportFraction: 1.0
                ),
              ),
              SizedBox(height: 10.h),
              Text('Categories',
                style: TextStyle(
                    fontSize: 25.sp,
                ),
              ),
              SizedBox(height: 20.h),
              Container(
                height: 80.h,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                    itemBuilder: (context,index)=>categoriesBuilder(categoriesModel.data!.data![index]),
                    separatorBuilder: (context,index)=>SizedBox(width: 10.w),
                    itemCount: categoriesModel.data!.data!.length,
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              Text('Products',
                style: TextStyle(
                  fontSize: 25.sp,
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Container(
                color: Colors.grey[200],
                child: GridView.count(
                  physics: NeverScrollableScrollPhysics(),
                  mainAxisSpacing: 1,
                  crossAxisSpacing: 1,
                  shrinkWrap: true,
                  childAspectRatio: 1 / 1.76,
                  crossAxisCount: 2,
                  children: List.generate(
                      model.data!.products!.length, (index) =>
                      builderGridView(model.data!.products![index],context)),
                ),
              ),

            ],
          ),
        ),
      );

  Widget builderGridView(Products model,BuildContext context) =>
      Container(
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

                      padding: EdgeInsets.symmetric(horizontal: 10),
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
                        Spacer(),
                        IconButton(onPressed: () {
                          HomeCubit.get(context).changeFav(model.id);
                        },
                            icon: Icon(Icons.favorite_outline)),

                      ],
                    ),
                  ],
                ),
              ),
            ]
        ),
      );

  Widget categoriesBuilder(Data1 data1) =>
      Column(
        children: [
          CircleAvatar(
            radius: 30.r,
           backgroundImage: NetworkImage('${data1.image}'
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
