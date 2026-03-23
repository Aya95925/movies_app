import 'package:flutter_application_new/core/utils/api_result.dart';
import 'package:flutter_application_new/feature/movies/domain/repository/movies_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetUserProfileStatsUseCase {
  final MoviesRepo _moviesRepo;
  GetUserProfileStatsUseCase(this._moviesRepo);

  Future<ApiResult<Map<String, int>>> call() {
    return _moviesRepo.getUserProfileStats();
  }
}
