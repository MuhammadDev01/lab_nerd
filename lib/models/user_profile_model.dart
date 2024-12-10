class ProfileUserModel {
  late String name;
  late String email;
  //String? posts;
  ProfileUserModel({
    required this.name,
    required this.email,
  });

  ProfileUserModel.fromJson(Map<String, dynamic> json) {
    name = json['User'];
    email = json['email'];
  }

  // Map<String, dynamic> toMap() {
  //   return {
  //     'name': name,
  //     'email': email,
  //   };
  // }
}
