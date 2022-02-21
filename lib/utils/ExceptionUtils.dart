

class ExceptionUtils {

  static final instance = ExceptionUtils();

  ExceptionUtils() {
    throwCanNotCreateObjectSingletonInstance();
  }

  void throwCanNotCreateObjectSingletonInstance() {
    Exception('Can not create object of singleton class');
  }

}