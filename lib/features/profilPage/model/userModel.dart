class UserModel {
  String? name;
  String? email;
  List<dynamic>? addedFoods;
  List<dynamic>? competitionsWon;
  List<dynamic>? favoriteFoods;
  UserModel({
    required this.name,
    required this.email,
    required this.addedFoods,
    required this.competitionsWon,
    required this.favoriteFoods,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    email = json["email"];
    addedFoods = json["addedFoods"];
    competitionsWon = json["competitionsWon"];
    favoriteFoods = json["favoriteFoods"];
  }
}
