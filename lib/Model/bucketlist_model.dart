class AttractionModel {
  String bucketListId;
  String placeID;
  // String category;
  // String description;
  String image;
  // int latitude;
  // String longitude;
  String location;
  AttractionModel({
    required this.bucketListId,
     required this.placeID,
    // required this.category,
    // required this.description,
    required this.image,
    // required this.latitude,
    // required this.longitude,
    required this.location,
  });
  Map<String, dynamic> toJson(id) => {
        "bucketListId": bucketListId,
         "placeID": placeID,
        // "category": category,
        // "description": description,
        "image": image,
        // "latitude": latitude,
        // "longitude": longitude,
        "location": location,
      };
  factory AttractionModel.fromJson(Map<String, dynamic> json) =>
      AttractionModel(
          bucketListId: json["bucketListId"],
             placeID: json["placeID"],
          // category: json["category"],
          // description: json["description"],
          image: json["image"],
          // latitude: json["latitude"],
          // longitude: json["longitude"],
          location: json["location"]);
}
