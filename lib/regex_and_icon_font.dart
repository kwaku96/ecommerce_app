bool isEmailValid(String value) => RegExp(r"^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$").hasMatch(value);
bool isPasswordValid(String value) => RegExp(r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$").hasMatch(value);
bool isValidFullName(String value) => RegExp(r"^[A-Za-z\s]{1,}[\.]{0,1}[A-Za-z\s]{0,}$").hasMatch(value);