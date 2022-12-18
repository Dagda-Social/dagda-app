checkMail(String mail) {
  if (mail.isEmpty || mail == null) {
    return 'Please enter your email';
  } else if (!mail.contains('@')) {
    return 'Please enter a valid email';
  } else {
    return null;
  }
}

checkPasswordWithSpecialCharacters(String password) {
  if (password.isEmpty || password == null) {
    return 'Please enter your password';
  } else if (password.length < 8) {
    return 'Password must be at least 8 characters';
  } else if (!password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
    return 'Password must contain at least one special character';
  } else {
    return null;
  }
}

checkSamePassword(String password, String passwordConfirm) {
  if (passwordConfirm.isEmpty || passwordConfirm == null) {
    return 'Please confirm your password';
  } else if(checkPasswordWithSpecialCharacters(password)!=null){
    return checkPasswordWithSpecialCharacters(password);
  }
   else if (password != passwordConfirm) {
    return 'Passwords do not match';
  } else {
    return null;
  }
}
