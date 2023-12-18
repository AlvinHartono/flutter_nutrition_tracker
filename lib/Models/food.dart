import 'dart:ffi';

class Food {
  final String name;
  final double calories;
  final double servingSizeG;
  final double fatTotalG;
  final double fatSaturatedG;
  final double proteinG;
  final double sodiumMg;
  final double potassiumMg;
  final double cholesterolMg;
  final double carbohydratesTotalG;
  final double fiberG;
  final double sugarG;

  const Food({
    required this.name,
    required this.calories,
    required this.servingSizeG,
    required this.fatTotalG,
    required this.fatSaturatedG,
    required this.proteinG,
    required this.sodiumMg,
    required this.potassiumMg,
    required this.cholesterolMg,
    required this.carbohydratesTotalG,
    required this.fiberG,
    required this.sugarG,
  });

  factory Food.fromJson(Map<String, dynamic> json) {
    return Food(
        name: json['name'],
        calories: json['calories'].toDouble(),
        servingSizeG: json['serving_size_g'].toDouble(),
        fatTotalG: json['fat_total_g'].toDouble(),
        fatSaturatedG: json['fat_saturated_g'].toDouble(),
        proteinG: json['protein_g'].toDouble(),
        sodiumMg: json['sodium_mg'].toDouble(),
        potassiumMg: json['potassium_mg'].toDouble(),
        cholesterolMg: json['cholesterol_mg'].toDouble(),
        carbohydratesTotalG: json['carbohydrates_total_g'].toDouble(),
        fiberG: json['fiber_g'].toDouble(),
        sugarG: json['sugar_g'].toDouble());
  }
}
