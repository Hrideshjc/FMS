class ApiUrl {
  static const String mainUrl = "http://192.168.0.100:3000/";

  /*---------------- Auth url --------------*/
  static const String login = "${mainUrl}account/login";
  static const String signUp = "${mainUrl}account/signup";
  static const String register = "${mainUrl}register-customer";
  static const String verify = "${mainUrl}verify-customer";
  static const String futsal = "${mainUrl}futsal/read";

}
