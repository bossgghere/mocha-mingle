enum CoffeeCategory {
  espresso,
  milkBased,
  coldBrew,
  blended,
  decaf,
}

class Coffee {
  int? id;
  String name;
  CoffeeCategory category;
  String description;
  String image;
  double cost;

  Coffee({
    this.id,
    required this.name,
    required this.category,
    required this.description,
    required this.image,
    required this.cost,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'category': category.name, // save enum as string
      'description': description,
      'image': image,
      'cost': cost,
    };
  }

  factory Coffee.fromMap(Map<String, dynamic> map) {
    return Coffee(
      id: map['id'],
      name: map['name'],
      category: CoffeeCategory.values.firstWhere(
        (e) => e.name == map['category'],
        orElse: () => CoffeeCategory.espresso, 
      ),
      description: map['description'],
      image: map['image'],
      cost: map['cost'],
    );
  }
}
