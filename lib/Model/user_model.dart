class UserModel {
  String userID;
  String username;
  String password;
  String email;
  int phonenumber;
  String gender;
  String profileimage;
  String proofimage;
  UserModel(
      {required this.email,
      required this.gender,
      required this.password,
      required this.phonenumber,
      required this.profileimage,
      required this.proofimage,
      required this.userID,
      required this.username});
  Map<String, dynamic> toJson() => {
        "userID": userID,
        "username": username,
        "password": password,
        "email": email,
        "phonenumber": phonenumber,
        "gender": gender,
        "profileimage": profileimage,
        "proofimage": proofimage,
      };
  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
      email: json["email"],
      gender: json["gender"],
      password: json["password"],
      phonenumber: json["phonenumber"],
      profileimage: json["profileimage"],
      proofimage: json["proofimage"],
      userID: json["userID"],
      username: json["username"]);
}
