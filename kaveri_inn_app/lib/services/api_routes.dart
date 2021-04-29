class ApiRoutes {
  static final String domain = "http://192.168.1.91:5000";
  static final String baseurl = domain + "/api";
  static final String loginurl = baseurl + "/users/login";
  static final String registerUrl = baseurl + "/users/signup";

  static final String allrooms = baseurl + "/rooms/fetch-all-rooms";
  static final String homerooms =
      baseurl + "/rooms/fetch-some-rooms-for-homepage";
  static final String allhalls = baseurl + "/halls/fetch-all-halls";
  static final String homehalls =
      baseurl + "/halls/fetch-some-halls-for-homepage";
  static final String bookroom = baseurl + "/bookings/rooms";
  static final String bookhall = baseurl + "/bookings/halls";
}
