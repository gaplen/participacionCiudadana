class Validator {
  static String? validateField({required String value}) {
    if (value.isEmpty) {
      return 'Este campo no puede estar vacio';
    }

    return null;
  }

  static String? validateName({required String value}) {
    if (value.isEmpty) {
      return 'El nombre no puede estar vacio';
    }

    return null;
  }

  static String? validateLastname({required String value}) {
    if (value.isEmpty) {
      return 'El apellido no puede estar vacio';
    }

    return null;
  }

  static String? validatePhone({required String phone}) {
    if (phone.isEmpty) {
      return 'El numero de telefono no puede estar vacia';
    } else if (phone.length <= 9) {
      return 'El telefono debe tener almenos 10 caracteres';
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

  static String? validateUserID({required String user}) {
    if (user.isEmpty) {
      return 'El correo electronico no puede estar vacio';
    } else if (user.length <= 3) {
      return 'User ID should be greater than 3 characters';
    }

    return null;
  }

  static String? validateEmail({required String email}) {
    // Expresión regular para validar un correo electrónico
    final emailRegExp = RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+');

    // Validar que el correo electrónico cumpla con la expresión regular
    final isEmailValid = emailRegExp.hasMatch(email);

    // Validar que solo se use un correo electrónico
    final isSingleEmail = email.split(',').length == 1;

    return null;
    // isEmailValid && isSingleEmail;
  }
}
