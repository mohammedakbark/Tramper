class ReviewFeedbackModel {
  String reviFeedID;
  String userID;
  String date;
  String message;
  ReviewFeedbackModel(
      {required this.date,
      required this.reviFeedID,
      required this.message,
      required this.userID});
  Map<String, dynamic> toJson(id) => {
        "userID": userID,
        "reviFeedID": reviFeedID,
        "date": date,
        "message": message,
      };
  factory ReviewFeedbackModel.fromJson(Map<String, dynamic> json) => ReviewFeedbackModel(
      date: json["date"],
      reviFeedID: json["reviFeedID"],
      message: json["message"],
      userID: json["userID"]);
}
