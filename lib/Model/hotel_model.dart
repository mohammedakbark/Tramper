class HotelModel {
  String hotelID;
  String category;
  String description;
  String image;
  int latitude;
  String longitude;
  String location;
  String price;
  HotelModel({
    required this.hotelID,
    required this.category,
    required this.description,
    required this.image,
    required this.latitude,
    required this.longitude,
    required this.location,
    required this.price  });
  Map<String, dynamic> toJson(id) => {
        "hotelID": hotelID,
        "category": category,
        "description": description,
        "image": image,
        "latitude": latitude,
        "longitude": longitude,
        "location": location,
        "price":price,
      };
  factory HotelModel.fromJson(Map<String, dynamic> json) =>
      HotelModel(
          hotelID: json["hotelID"],
          category: json["category"],
          description: json["description"],
          image: json["image"],
          latitude: json["latitude"],
          longitude: json["longitude"],
          location: json["location"],
          price:json["price"]
          
          );
}
