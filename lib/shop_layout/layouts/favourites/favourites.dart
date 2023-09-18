
import 'package:e_commerce/core/components/colors.dart';
import 'package:e_commerce/core/utilis/constants.dart';
import 'package:e_commerce/network/models/favourites_model.dart';
import 'package:e_commerce/shop_layout/layouts/home/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavouritesScreen extends StatelessWidget {
  const FavouritesScreen({super.key});


  @override
  Widget build(BuildContext context) {
    var cubit =HomeCubit.get(context);
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        // if (cubit.favouritesModel == null || cubit.favouritesModel!.data == null || cubit.favouritesModel!.data!.data == null) {
        //   return Center(child: Text('No Items Added',
        //     style: TextStyle(
        //       fontSize: 25.sp,
        //       fontWeight: FontWeight.w600
        //     ),
        //
        //   )); // Replace with your desired widget.
        // }
        return ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) => buildFavItems(cubit.favouritesModel!.data!.data![index],context),
          separatorBuilder: (context, index) => const MyDivider(),
          itemCount: cubit.favouritesModel!.data!.data!.length,
        );
      },
    );
  }

  Widget buildFavItems(Data1 data1,BuildContext context) =>
      SizedBox(
        height: 120.h,
        child: Row(
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                Image(image: NetworkImage('${data1.product?.image}'),
                  height: 120.h,
                  width: 120.w,

                ),
                if(data1.product!.discount != 0)
                  Container(

                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    color: firstColor,
                    child: Text('Discount',
                      style: TextStyle(fontSize: 9.sp,
                          color: mainColor,
                          fontFamily: 'Pacifico'),
                    ),
                  )
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${data1.product?.name}',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 13.sp,
                          height: 1.4,
                          fontWeight: FontWeight.w700
                      ),


                    ),
                    Spacer(),
                    Row(
                      children: [
                        Text('${data1.product?.price}',
                          maxLines: 1,
                          style: TextStyle(
                              fontSize: 13.sp,
                              color: firstColor,
                              fontWeight: FontWeight.w700
                          ),

                        ),
                        SizedBox(width: 2.w),
                        Text('EGP',
                          style: TextStyle(
                              fontSize: 12.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.w700
                          ),

                        ),
                        SizedBox(width: 4.w),
                        if(data1.product!.discount != 0)
                          Text('${data1.product?.oldPrice}',
                            maxLines: 1,
                            style: TextStyle(
                                fontSize: 13.sp,
                                color: Colors.grey,
                                decoration: TextDecoration.lineThrough

                            ),

                          ),
                        const Spacer(),
                        CircleAvatar(
                          radius: 17.r,
                           backgroundColor:HomeCubit.get(context).favourites[data1.product!.id]==true ?firstColor :Colors.grey,
                          child: IconButton(onPressed: () {
                            HomeCubit.get(context).favourites[data1.product!.id];
                            print(HomeCubit.get(context).favourites[data1.product!.id].toString());
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
            ),

          ],

        ),
      );
}
