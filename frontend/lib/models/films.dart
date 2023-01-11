class Film {
  int id;
  String title;
  String genre;
  String image;
  String description;

  Film(
      {required this.id,
      required this.title,
      required this.genre,
      required this.image,
      required this.description});

  factory Film.fromJson(Map<String, dynamic> json) => Film(
      id: json["id"] as int,
      title: json["title"].toString(),
      genre: json["genre"].toString(),
      image: json["image"].toString(),
      description: json["description"].toString());
}
