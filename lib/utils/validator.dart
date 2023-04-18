class Validator {
  static String? validateField({required String value}) {
    if (value.isEmpty) {
      return 'Este campo no puede estar vacio';
    }

    return null;
  }

  static String? validateUserID({required String uid}) {
    if (uid.isEmpty) {
      return 'User ID can\'t be empty';
    } else if (uid.length <= 3) {
      return 'User ID should be greater than 3 characters';
    }

    return null;
  }

  static String? validatePassword({required String password}) {
    if (password.isEmpty) {
      return 'La contraseña no puede estar vacia';
    } else if (password.length <= 3) {
      return 'La contraseña debe tener almenos 6 caracteres';
    }

    return null;
  }
}
