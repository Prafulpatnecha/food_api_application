

class ApiModal
{
  late List<Recipes> recipes;
  late int total,skip,limit;

  ApiModal({required this.recipes,required this.total,required this.skip,required this.limit});

  factory ApiModal.fromJson(Map m1)
  {
    return ApiModal(recipes: (m1['recipes'] as List).map((e) => Recipes.fromJson(e),).toList(), total: m1['total'],limit: m1['limit'],skip: m1['skip']);
  }
}

class Recipes
{
  late int id,caloriesPerServing,reviewCount,prepTimeMinutes;
  late dynamic rating;
  late String name,image,difficulty,cuisine;
  late List ingredients,instructions,tags,mealType;

  Recipes({required this.id,
        required this.caloriesPerServing,
        required this.reviewCount,
        required this.rating,
        required this.name,
        required this.image,
        required this.difficulty,
        required this.cuisine,
        required this.ingredients,
        required this.instructions,
        required this.tags,
        required this.mealType,
    required this.prepTimeMinutes
  });
  factory Recipes.fromJson(Map m1)
  {
    return Recipes(id: m1['id'], caloriesPerServing: m1['caloriesPerServing'], reviewCount: m1['reviewCount'], rating: m1['rating'], name: m1['name'], image: m1['image'], difficulty: m1['difficulty'], cuisine: m1['cuisine'], ingredients: m1['ingredients'], instructions: m1['instructions'], tags: m1['tags'], mealType: m1['mealType'], prepTimeMinutes: m1['prepTimeMinutes']);
  }
}