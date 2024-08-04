class ApiUrl {
  static const String mainUrl = "http://192.168.1.2:3030/";

  /*---------------- Auth url --------------*/
  static const String login = "${mainUrl}account/login";
  static const String signUp = "${mainUrl}account/signup";
  static const String register = "${mainUrl}register-customer";
  static const String registerInformation = "${mainUrl}player/create";
  static const String verify = "${mainUrl}verify-customer";
  static const String futsal = "${mainUrl}futsal/read";
  static const String searchFutsal = "${mainUrl}futsal/searchFutsal/";
  static const String bookFutsal = "${mainUrl}booking/bookfutsal";
  static const String bookedFutsal = "${mainUrl}booking/userBookings";
  static const String challenge = "${mainUrl}challenge/createChallenge";
  static const String getchallenge = "${mainUrl}challenge/read";
  static const String getchallengeHistory =
      "${mainUrl}challenge/challengeHistory";
  static const String acceptChallenge = "${mainUrl}challenge/acceptChallenge/";
  static const String deleteChallenge = "${mainUrl}challenge/deleteChallenge/";
  static const String canccelbooking = "${mainUrl}booking/deleteBooking/";
  static const String abcceptedChallenge =
      "${mainUrl}challenge/acceptedHistory";
}
