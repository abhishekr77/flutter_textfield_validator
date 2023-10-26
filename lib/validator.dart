class Validator {
  static String? validateEmail(String value) {
    bool emailvalid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value);
    if (value.isEmpty) {
      return 'Email is required.';
    } else if (!emailvalid) {
      return 'Please enter a valid email address.';
    }
    return null;
  }

  static String? validateDropDefaultData(value) {
    if (value == null) {
      return 'Please select an item.';
    } else {
      return null;
    }
  }

  static String? validatePassword(String value, int length) {
    if (value.isEmpty) {
      return 'Password is required.';
    }
    Pattern pattern = r'^.{' + length.toString() + r',}$';
    RegExp regex = RegExp(pattern as String);
    if (!regex.hasMatch(value)) {
      return 'Password must be at least $length characters.';
    } else {
      return null;
    }
  }

  static String? validateName(String value, int lenth, String? name) {
    name = name ?? 'This field';
    if (value.isEmpty) {
      return '$name is required.';
    } else if (value.length < lenth) {
      return '$name must contain at least $lenth characters.';
    } else {
      return null;
    }
  }

  static String? validateText(String value, String? name) {
    name = name ?? 'This field';
    if (value.isEmpty) {
      return '$name is required.';
    } else {
      return null;
    }
  }

  static String? validateAmount(String? value) {
    if (value == null || value == '') {
      return 'Please enter the amount.';
    } else if (num.parse(value) < 1) {
      return 'Amount must not be less than 1.';
    } else {
      return null;
    }
  }

  static String? validatePhoneNumber(String value) {
    bool valid = RegExp(r"^[0-9]{10}$").hasMatch(value);
    print("Is valid phone : $valid");
    if (value.isEmpty) {
      return 'Mobile number is required.';
    } else if (value.length < 10) {
      return "Enter a valid mobile number (without 0 or +91)...";
    } else if (!valid) {
      return "Enter a valid mobile number (without 0 or +91)...";
    }
    return null;
  }

  static String? empty(String value, [String? message]) {
    if (value.trim().isEmpty) {
      return message ?? "Field cannot be empty";
    } else {
      return null;
    }
  }

  static String? minLength(
      {required String value, required int minLen, String? message}) {
    if (value.trim().length < minLen) {
      return message ?? "field must be larger than $minLen character.";
    } else {
      return null;
    }
  }

  static String? passwordConfirm(
      {required String value, required String password, String? message}) {
    if (value != password) {
      return message ?? "password mismatched";
    } else {
      return null;
    }
  }

  static String? maxLength(
      {required String value, required int maxLen, String? message}) {
    if (value.length > maxLen) {
      return message ?? "field must not be larger than $maxLen character.";
    } else {
      return null;
    }
  }

  static String? range(
      {required String value,
      required int maxLen,
      required int minLen,
      String? messageLess,
      String? messageMore}) {
    if (value.trim().length < minLen) {
      return messageLess ?? "field must be at least $minLen character.";
    } else if (value.length > maxLen) {
      return messageMore ?? "field must not be larger than $maxLen character.";
    } else {
      return null;
    }
  }

  static String? phone(String value) {
    final nob = int.tryParse(value);
    if (nob != null) {
      if (value.length == 10) {
        return null;
      } else {
        return 'Mobile no. must be of 10 digit.';
      }
    } else {
      return 'Not a Valid mobile no.';
    }
  }

  static String? pan(String value) {
    final nob = int.tryParse(value);
    if (nob != null) {
      if (value.length == 10) {
        return null;
      } else {
        return 'PAN no. must be of 10 digit.';
      }
    } else {
      return 'Not a Valid PAN no.';
    }
  }

  static String? email(String value) {
    final bool isValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value.trim());
    if (isValid) {
      return null;
    } else {
      return 'Please enter a valid email';
    }
  }

  static String? youtubeLink(String value, [String? message]) {
    final String? url = empty(value);
    if (url == null) {
      final bool isValid = RegExp(
              r'^((?:https?:)?\/\/)?((?:www|m)\.)?((?:youtube\.com|youtu.be))(\/(?:[\w\-]+\?v=|embed\/|v\/)?)([\w\-]+)(\S+)?')
          .hasMatch(value.trim());
      if (isValid) {
        return null;
      } else {
        return message ?? 'Please enter a valid youtube url';
      }
    } else {
      return url;
    }
  }

  static String? validateURL(String value, [String? message]) {
    final String? url = empty(value);
    if (url == null) {
      final bool isValid = RegExp(
              r'^(.*?)((https?:\/\/)?(www\.)?[-a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-z]{2,4}\b([-a-zA-Z0-9@:%_\+.~#?&//=]*))')
          .hasMatch(value.trim());
      if (isValid) {
        return null;
      } else {
        return message ?? 'Please enter a valid url';
      }
    } else {
      return url;
    }
  }

  static String? find(String value) {
    final String? mail = empty(value);
    if (mail == null) {
      if (value.contains("@")) {
        return email(value);
      } else {
        return phone(value);
      }
    } else {
      return mail;
    }
  }
}
