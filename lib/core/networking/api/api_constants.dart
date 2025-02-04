class ApiConstants {
  static const String baseUrl = "https://flower.elevateegy.com/";
  static const String getLoggedDriverData = "api/v1/drivers/profile-data";
  static const String editProfile = "api/v1/drivers/editProfile";
  static const String changePassword = "api/v1/drivers/change-password";
  static const String addAddress = "api/v1/addresses";
  static const String getLoggedUserAddresses = "api/v1/addresses";
  static const String cashOrders = "api/v1/orders";
  static const String checkOutOrders = "$cashOrders/checkout";
  static const String checkOutUrl = "http://localhost:3000";
  static const String getAllVehicles = "api/v1/vehicles";
  static const String signInApi = "api/v1/drivers/signin";
  static const String registerApi = "api/v1/drivers/apply";
  static const String forgotPasswordApi = "api/v1/drivers/forgotPassword";
  static const String verifyResetCodeApi = "api/v1/drivers/verifyResetCode";
  static const String resetPasswordApi = "api/v1/drivers/resetPassword";
  static const String getLoggedUserData = "api/v1/drivers/profile-data";
  static const String uploadPhoto = "api/v1/drivers/upload-photo";
  static const String getPendingOrders = "api/v1/orders/pending-orders/";
  static const String getDriverOrders = "api/v1/orders/driver-orders/";
  static const String startOrder = "api/v1/orders/start/";
  static const String updateOrder = "api/v1/orders/state/";
  static const String apply = "api/v1/drivers/apply";
}
