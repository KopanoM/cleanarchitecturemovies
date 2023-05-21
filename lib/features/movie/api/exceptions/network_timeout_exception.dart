
class NetworkTimeoutException implements Exception{
  @override
  String toString() {
    return 'This request is taking too long. Please ensure you have a stable internet connection.';
  }
}