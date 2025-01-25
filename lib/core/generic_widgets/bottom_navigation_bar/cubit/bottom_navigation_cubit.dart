import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'bottom_navigation_state.dart';

class BottomNavigationCubit extends Cubit<BottomNavigationState> {
  BottomNavigationCubit() : super(BottomNavigationState(pageIndex: 0));

  void changePageIndex({required int newPageIndex}) {
    emit(state.copyWith(pageIndex: newPageIndex));
  }

  // تحميل userId عند بدء التطبيق
  Future<void> loadUserId() async {
    emit(state.copyWith(isLoading: true));
    try {
      final prefs = await SharedPreferences.getInstance();
      final userId = prefs.getString('userId');
      if (userId != null) {
        emit(state.copyWith(userId: userId, isLoading: false));
      } else {
        emit(state.copyWith(isLoading: false, error: "User ID not found."));
      }
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }
}
