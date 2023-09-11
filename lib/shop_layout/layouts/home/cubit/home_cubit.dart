import 'package:e_commerce/network/dio_helper.dart';
import 'package:e_commerce/network/end_points.dart';
import 'package:e_commerce/network/models/categories_model.dart';
import 'package:e_commerce/network/models/changeFav_model.dart';
import 'package:e_commerce/network/models/favourites_model.dart';
import 'package:e_commerce/network/models/home_model.dart';
import 'package:e_commerce/network/models/profile_model.dart';
import 'package:e_commerce/shop_layout/layouts/categories/categories.dart';
import 'package:e_commerce/shop_layout/layouts/favourites/favourites.dart';
import 'package:e_commerce/shop_layout/layouts/products/products.dart';
import 'package:e_commerce/shop_layout/layouts/settings/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce/core/utilis/constants.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitial());
  static HomeCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<Widget> bottomNavScreens = [
    ProductsScreen(),
    const CategoriesScreen(),
    const FavouritesScreen(),
    SettingsScreen()
  ];
  void changeBottom(int index) {
    currentIndex = index;
    emit(ChangeBottomState());
  }

  HomeModel? homeModel;
  void getHomeData() {
    emit(HomeLoadingState());
    DioHelper.getData(url: HOME).then((value) {
      homeModel = HomeModel.fromJson(value.data);
      printFullText(homeModel!.data!.banners.toString());
      emit(HomeSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(HomeErrorState());
    });
  }

  CategoriesModel? categoriesModel;
  void getCategoriesData() {
    emit(CategoriesLoadingState());
    DioHelper.getData(url: CATEGORIES).then((value) {
      categoriesModel = CategoriesModel.fromJson(value.data);
      printFullText(categoriesModel!.data.toString());
      emit(CategoriesSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(CategoriesErrorState());
    });
  }
  ChangeFavModel? changeFavModel;

  void changeFav(int productId) {
    emit(FavouritesLoadingState());
    DioHelper.postData(url: Favourites,token: token ,data: {'product_id': 1}).then((value) {
      changeFavModel =ChangeFavModel.fromJson(value!.data);
      emit(FavouritesSuccessState());
      print(value.data);
    }).catchError((error) {
      emit(FavouritesErrorState());
    });
  }

  FavouritesModel? favouritesModel;
  void getFavouritesData() {
    emit(FavouritesLoadingState());
    DioHelper.getData(url: Favourites).then((value) {
      favouritesModel = FavouritesModel.fromJson(value.data);
      printFullText(favouritesModel!.data.toString());
      emit(FavouritesSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(FavouritesErrorState());
    });
  }
  ProfileModel? profileModel;
  void getProfileData() {
    emit(ProfileLoadingState());
    DioHelper.getData(url: PROFILE ,token: token).then((value) {
      profileModel = ProfileModel.fromJson(value.data);
      printFullText(profileModel!.data!.id.toString());
      emit(ProfileSuccessState(profileModel!));
    }).catchError((error) {
      print(error.toString());
      emit(ProfileErrorState());
    });
  }

}
