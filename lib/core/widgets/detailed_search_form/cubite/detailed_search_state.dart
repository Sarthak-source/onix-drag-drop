class DetailedSearchState {
  final Map<String, String?> selectedValues;

  DetailedSearchState({Map<String, String?>? selectedValues})
      : selectedValues = selectedValues ?? {};

  DetailedSearchState copyWith({Map<String, String?>? selectedValues}) {
    return DetailedSearchState(
      selectedValues: selectedValues ?? this.selectedValues,
    );
  }
}
