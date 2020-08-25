//implements means we are implement all the functionality  of the abstract class
//Note: Every class in dart has toString() method because every class invisiblily
//extends Object  . Object is a BASE class which  every object base on

class HttpException implements Exception {
  final String message;
  HttpException(this.message);
  @override
  String toString() {
    return message;
    // return super.toString();//this will print Instance of HttpException so to print own exception
  }
}
