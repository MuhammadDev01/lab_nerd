class LoginWithBackModel {
  String? accessToken;
  String? message;

  LoginWithBackModel({
    this.accessToken,
    this.message,
  });

  LoginWithBackModel.fromJson(json) {
    accessToken = json['access_token'];
    message = json['message'];
  }

  // Map<String, dynamic> toMap() {
  //   return {
  //     'access_token': accessToken,
  //     'message': message,
  //   };
  // }
}
