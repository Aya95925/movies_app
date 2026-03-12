enum ApiStatus { initial, loading, success, error }

class Resoueces<T> {
  T? data;
  late bool? isLoading = false;
  late String? errorMessage;
  late ApiStatus? status;
  Resoueces({this.data, this.isLoading, this.errorMessage, this.status});
  Resoueces.isLoading() {
    isLoading = true;
    status = ApiStatus.loading;
  }
  Resoueces.isSuccess(this.data) {
    status = ApiStatus.success;
  }
  Resoueces.iserror(String error) {
    errorMessage = error;
    status = ApiStatus.error;
  }
  Resoueces.initial() {
    status = ApiStatus.initial;
  }
}
