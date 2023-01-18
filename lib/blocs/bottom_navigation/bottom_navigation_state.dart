part of 'bottom_navigation_bloc.dart';

abstract class BottomNavigationBlocState extends Equatable {
  const BottomNavigationBlocState();
  
  @override
  List<Object> get props => [];
}

class BottomNavigationBlocInitial extends BottomNavigationBlocState {}
