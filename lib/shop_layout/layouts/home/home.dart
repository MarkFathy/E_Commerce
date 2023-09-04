import 'package:e_commerce/core/colors.dart';
import 'package:e_commerce/core/navigation_const.dart';
import 'package:e_commerce/shop_layout/layouts/home/cubit/home_cubit.dart';
import 'package:e_commerce/shop_layout/layouts/search/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeStates>
      (listener: (context,state){},
      builder:(context,state){
        var cubit =HomeCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text('Shopping App',style: TextStyle(color: firstColor),),
            actions: [

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                child: IconButton(onPressed: (){
                  navigateTo(context,const SearchScreen());
                }, icon: const Icon(Icons.search,size: 30,),),
              ),
            ],
          ),
          body: cubit.bottomNavScreens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (index){
              cubit.changeBottom(index);
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home_filled),label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.apps),label: 'Categories'),
              BottomNavigationBarItem(icon: Icon(Icons.favorite_rounded),label: 'Favourites'),
              BottomNavigationBarItem(icon: Icon(Icons.settings),label: 'Settings'),
            ],
          ),
        );
      } ,

    );
  }
}
