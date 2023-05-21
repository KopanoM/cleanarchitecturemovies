class GenericException implements Exception{
  final String message;
  GenericException([this.message = 'something went wrong']);
}