class PlaceModel {
  String placeID;
  String category;
  String description;
  String image;
  int latitude;
  String longitude;
  String location;
  PlaceModel({
    required this.placeID,
    required this.category,
    required this.description,
    required this.image,
    required this.latitude,
    required this.longitude,
    required this.location,
  });
  Map<String, dynamic> toJson(id) => {
        "placeID": placeID,
        "category": category,
        "description": description,
        "image": image,
        "latitude": latitude,
        "longitude": longitude,
        "location": location,
      };
  factory PlaceModel.fromJson(Map<String, dynamic> json) => PlaceModel(
      placeID: json["placeID"],
      category: json["category"],
      description: json["description"],
      image: json["image"],
      latitude: json["latitude"],
      longitude: json["longitude"],
      location: json["location"]);
}
