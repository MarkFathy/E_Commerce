part of 'home_cubit.dart';

@immutable
abstract class HomeStates {}

class HomeInitial extends HomeStates {}

class ChangeBottomState extends HomeStates {}
class HomeLoadingState extends HomeStates {}
class HomeSuccessState extends HomeStates {}
class HomeErrorState extends HomeStates {}


class CategoriesLoadingState extends HomeStates {}
class CategoriesSuccessState extends HomeStates {}
class CategoriesErrorState extends HomeStates {}


class FavouritesLoadingState extends HomeStates {}
class FavouritesSuccessState extends HomeStates {}
class FavouritesErrorState extends HomeStates {}


class ProfileLoadingState extends HomeStates {}
class ProfileSuccessState extends HomeStates {
  final ProfileModel profileModel;

  ProfileSuccessState(this.profileModel);
}
class ProfileErrorState extends HomeStates {}











