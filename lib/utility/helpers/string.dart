class StringHelper {
  static String removeException(String message) {
    return message.replaceAll("Exception: ", "");
  }
}
