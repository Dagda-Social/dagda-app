part of 'bottom_navigation_bloc.dart';

abstract class BottomNavigationEvent extends Equatable {
  const BottomNavigationEvent();
  

  @override
  List<Object> get props => [];
}

class BottomNavigationTabTapped extends BottomNavigationEvent {
  
  const BottomNavigationTabTapped(this.index);

  final int index;

  @override
  List<Object> get props => [index];
}