class UserModel {
  String userID;
  String password;
  String username;
  String nickeNmae;
  String label;
  String email;
  String age;
  int phonenumber;
  String gender;
  String address;
  String message;
  String area;
  String city;
  String pincode;
  String state;
  String about;
  String hostingDetails;
  String profileimage;
  String proofimage;
  UserModel(
      {required this.email,
      required this.label,
      required this.age,
      required this.gender,
      required this.password,
      required this.phonenumber,
      required this.profileimage,
      required this.proofimage,
      required this.userID,
      required this.username,
      required this.about,
      required this.address,
      required this.area,
      required this.city,
      required this.hostingDetails,
      required this.message,
      required this.nickeNmae,
      required this.pincode,
      required this.state});
  Map<String, dynamic> toJson() => {
        "age": age,
        "label":label,
        "userID": userID,
        "username": username,
        "password": password,
        "email": email,
        "phonenumber": phonenumber,
        "gender": gender,
        "profileimage": profileimage,
        "proofimage": proofimage,
        "about": about,
        "address": address,
        "area": area,
        "city": city,
        "hostingDetails": hostingDetails,
        "message": message,
        "nickeNmae": nickeNmae,
        "pincode": pincode,
        "state": state
      };
  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
      age: json["age"],
      label:json["label"],
      email: json["email"],
      gender: json["gender"],
      password: json["password"],
      phonenumber: json["phonenumber"],
      profileimage: json["profileimage"],
      proofimage: json["proofimage"],
      userID: json["userID"],
      username: json["username"],
      about: json["about"],
      address: json["address"],
      area: json["area"],
      city: json["city"],
      hostingDetails: json["hostingDetails"],
      message: json["message"],
      nickeNmae: json["nickeNmae"],
      pincode: json["pincode"],
      state: json["state"]);
}
