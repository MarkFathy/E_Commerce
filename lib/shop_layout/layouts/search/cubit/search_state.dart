part of 'search_cubit.dart';

@immutable
abstract class SearchStates {}

class SearchInitial extends SearchStates {}
class SearchLoadingState extends SearchStates {}
class SearchSuccessState extends SearchStates {}
class SearchErrorState extends SearchStates {}



