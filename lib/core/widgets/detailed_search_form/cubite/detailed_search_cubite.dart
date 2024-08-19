import 'package:flutter_bloc/flutter_bloc.dart';

import 'detailed_search_state.dart';

class DetailedSearchCubit extends Cubit<DetailedSearchState> {
  DetailedSearchCubit() : super(DetailedSearchState());

  void updateSelectedValue(String key, String? value) {
    final updatedValues = Map<String, String?>.from(state.selectedValues);
    updatedValues[key] = value;
    emit(state.copyWith(selectedValues: updatedValues));
  }

  String? getValue(String key) {
    return state.selectedValues[key];
  }
}
