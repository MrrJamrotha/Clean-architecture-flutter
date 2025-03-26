
class Result<T, E> {
  final T? success;
  final E? failed;
  final int lastPage;
  final int currentPage;
  final String? message;

  Result({
    this.success,
    this.failed,
    this.lastPage = 1,
    this.currentPage = 1,
    this.message,
  });

  // ✅ For Success
  factory Result.right(
    T success, {
    String? message,
    int lastPage = 1,
    int currentPage = 1,
    String? subTotal,
    String? totalCommission,
    String? totalDiscount,
    String? totalCart,
    String? totalAmount,
  }) {
    return Result(
      success: success,
      message: message,
      lastPage: lastPage,
      currentPage: currentPage,
    );
  }

  // ❌ For Failure
  factory Result.left(
    E failed, {
    String? message,
    int lastPage = 1,
    int currentPage = 1, 
  }) {
    return Result(
      failed: failed,
      message: message,
      lastPage: lastPage,
      currentPage: currentPage, 
    );
  }

  // ✅ Utility methods for cleaner code
  bool get isRight => success != null;
  bool get isLeft => failed != null;

  // 💡 Similar to Either.fold() - handles both success and failure cases
  R fold<R>(R Function(E) onLeft, R Function(T) onRight) {
    if (isLeft) {
      return onLeft(failed as E);
    } else {
      return onRight(success as T);
    }
  }
}
