class DietModel {
  String? name;
  String? image;
  String? description;
  DietModel({this.name, this.image, this.description});

  DietModel.fromJson(Map<String, dynamic> json, [String? id]) {
    name = json['name'];
    image = json['image'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'image': image,
      'description': description,
    };
  }

  @override
  String toString() {
    return 'DietModel{name: $name, image: $image, description: $description}';
  }
}
