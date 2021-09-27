// BASE LOGIC TO GET API BASE URL
const baseUrl = "https://login-api-demo.herokuapp.com";

//Login
const loginService = "/login";

// Orders service
const orderService = "/orders";

class APIBase {
  static String get baseURL => baseUrl;

  static String getValue(APIPath path) {
    switch (path) {
      case APIPath.loginService:
        return loginService;
      case APIPath.orderService:
        return orderService;
      default:
        return "";
    }
  }
}

enum APIPath {
  loginService,
  orderService,
}
