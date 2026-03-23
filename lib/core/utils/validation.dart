


String? validateEmail(String? email) {
  if (email == null || email.isEmpty) {
    return 'You have to enter your email';
  }

  if (!email.contains("@")) {
    return 'Email must contain @';
  }

  if (!email.endsWith("@gmail.com")) {
    return 'Email must end with @gmail.com';
  }

  return null; // valid
}


String? validatePassword(String? password) {
  if (password == null || password.isEmpty) {
    return 'you have to write password';
  }

  if (password.length < 8) {
  

    return 'password must be at least 8 characters';
  }

  return null;
}



String? validateUsername(String? username) {
  if (username == null || username.isEmpty) {
    return 'you have to write your name';
  }

  return null; // صالح
}

String? validateConfirmPassword(String? confirmPassword, String? originalPassword) {
  if (confirmPassword == null || confirmPassword.isEmpty) {
    return 'You have to confirm your password';
  }

  if (confirmPassword.length < 8) {
    return 'Confirm password must be at least 8 characters';
  }

  if (confirmPassword != originalPassword) {
    return 'Passwords do not match';
  }

  return null; // valid
}
