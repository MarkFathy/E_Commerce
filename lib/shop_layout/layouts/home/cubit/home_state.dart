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



class ChangeFavouritesState extends HomeStates {}
class ChangeFavouritesLoadingState extends HomeStates {}
class ChangeFavouritesSuccessState extends HomeStates {
  final ChangeFavModel model;

  ChangeFavouritesSuccessState(this.model);
}
class ChangeFavouritesErrorState extends HomeStates {}


class GetFavouritesLoadingState extends HomeStates {}
class GetFavouritesSuccessState extends HomeStates {}
class GetFavouritesErrorState extends HomeStates {}



class ProfileLoadingState extends HomeStates {}
class ProfileSuccessState extends HomeStates {
  final ProfileModel profileModel;

  ProfileSuccessState(this.profileModel);
}
class ProfileErrorState extends HomeStates {}




class UpdateProfileLoadingState extends HomeStates {}
class UpdateProfileSuccessState extends HomeStates {
  final UpdateProfileModel updateProfileModel;

  UpdateProfileSuccessState(this.updateProfileModel);
}
class UpdateProfileErrorState extends HomeStates {}


class ProfileLogOutLoadingState extends HomeStates {}
class ProfileLogOutSuccessState extends HomeStates {
  final LogOutModel logOutModel;

  ProfileLogOutSuccessState(this.logOutModel);
}
class ProfileLogOutErrorState extends HomeStates {}








