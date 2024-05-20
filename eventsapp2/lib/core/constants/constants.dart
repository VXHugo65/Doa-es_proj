const String baseUrl = "https://doacao-api.000webhostapp.com/Donation-API/api";
final RegExp kEmailRegex = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9._]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$");
final RegExp kNameRegex = RegExp(r'^.{2,}$');
final RegExp kPasswordRegex = RegExp(r'^.{6,}$');
final RegExp kStrongPasswordRegex = RegExp(r"^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{6,}$");
