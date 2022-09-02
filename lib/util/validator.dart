class Validator {
  // Username Validation
  static String? validateUserName(String? name) {
    if (name == null) {
      return null;
    }
    if (name.isEmpty) {
      return "Name can not be empty";
    }
    // ? is used TO check the null value
    return null;
  }

  // Mobile Number Validation (India Standard)
  static String? validateNumber(String? number) {
    // if we use ? for null check; value check will have !
    if (number!.length > 10 && number.length < 10) {
      return "Number is invalid";
    }

    // Regex - Regular Expression - email, ip-address, url, mobile, password check

    // ? is used TO check the null value
    return null;
  }
}
