class RestaurentModel{
 String restID;
  String category;
  String description;
  String image;
  int latitude;
  String longitude;
  String location;
  RestaurentModel({
    required this.restID,
    required this.category,
    required this.description,
    required this.image,
    required this.latitude,
    required this.longitude,
    required this.location,
  });
  Map<String, dynamic> toJson(id) => {
        "restID": restID,
        "category": category,
        "description": description,
        "image": image,
        "latitude": latitude,
        "longitude": longitude,
        "location": location,
      };
  factory RestaurentModel.fromJson(Map<String, dynamic> json) => RestaurentModel(
      restID: json["restId"],
      category: json["category"],
      description: json["description"],
      image: json["image"],
      latitude: json["latitude"],
      longitude: json["longitude"],
      location: json["location"]);










}