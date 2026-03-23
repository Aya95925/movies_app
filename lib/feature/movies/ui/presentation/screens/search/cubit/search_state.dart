part of 'search_cubit.dart';

class SearchState extends Equatable {
  final Resources<List<MovieEntity>> searchResults;

  const SearchState({required this.searchResults});

  factory SearchState.initial() {
    return SearchState(searchResults: Resources.initial());
  }

  @override
  List<Object> get props => [searchResults];

  SearchState copyWith({Resources<List<MovieEntity>>? searchResults}) {
    return SearchState(searchResults: searchResults ?? this.searchResults);
  }
}
