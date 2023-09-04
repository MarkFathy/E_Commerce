part of 'on_boarding_cubit.dart';

@immutable
abstract class OnBoardingStates {}

class OnBoardingInitial extends OnBoardingStates {}
class OnBoardingIsLast extends OnBoardingStates {
  OnBoardingIsLast(bool isLast);
}

