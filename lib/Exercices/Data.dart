class Data {
  String title = "";
  String description= "";
  String imageUrl= "";

  Data({required this.title, required this.description, required this.imageUrl});

  Data.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    imageUrl = json['imageUrl'];
  }
}