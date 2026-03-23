enum ApiStatus { initial, loading, success, error }

class Resources<T> {
  T? data;
  ApiStatus status;
  String? errorMessage;

  Resources.initial() : status = ApiStatus.initial;
  Resources.loading() : status = ApiStatus.loading;
  Resources.success(this.data) : status = ApiStatus.success;
  Resources.error(this.errorMessage) : status = ApiStatus.error;
}
