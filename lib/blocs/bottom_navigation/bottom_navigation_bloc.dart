import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'bottom_navigation_event.dart';
part 'bottom_navigation_state.dart';

class BottomNavigationBlocBloc extends Bloc<BottomNavigationBlocEvent, BottomNavigationBlocState> {
  BottomNavigationBlocBloc() : super(BottomNavigationBlocInitial()) {
    on<BottomNavigationBlocEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
