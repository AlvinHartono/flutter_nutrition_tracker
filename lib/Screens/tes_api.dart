import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nutrition_tracker/Models/food.dart';

class TesAPI extends StatefulWidget {
  const TesAPI({super.key});

  @override
  State<TesAPI> createState() => _TesAPIState();
}

class _TesAPIState extends State<TesAPI> {
  List<Food> _food = <Food>[];

  Future fetchFoods() async {
    var apiKey = "7JdkTq3FchntRBv5Ax1Eog==lWifTLw8ivhrr98C";
    var foodName = 'rice and fried chicken';
    var url = 'https://api.api-ninjas.com/v1/nutrition?query=$foodName';
    var response =
        await http.get(Uri.parse(url), headers: {'X-Api-Key': apiKey});

    var foods = <Food>[];

    if (response.statusCode == 200) {
      List<dynamic> jsonList = jsonDecode(response.body);

      for (var foodsJson in jsonList) {
        foods.add(Food.fromJson(foodsJson));
      }
    } else {
      throw Exception('Failed to load food nutritions');
    }
    return foods;
  }

  @override
  void initState() {
    super.initState();
    fetchFoods().then(
      (value) {
        setState(() {
          _food.addAll(value);
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tes API"),
      ),
      body: FutureBuilder(
        future: fetchFoods(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          } else {
            return ListView.builder(
              itemCount: _food.length,
              itemBuilder: (context, index) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(_food[index].name),
                      Text(_food[index].calories.toString()),
                      Text(_food[index].carbohydratesTotalG.toString()),
                      Text(_food[index].cholesterolMg.toString()),
                      Text(_food[index].fatSaturatedG.toString()),
                      Text(_food[index].fatTotalG.toString()),
                      Text(_food[index].fiberG.toString()),
                      Text(_food[index].potassiumMg.toString()),
                      Text(_food[index].proteinG.toString()),
                      Text(_food[index].servingSizeG.toString()),
                      Text(_food[index].sodiumMg.toString()),
                      Text(_food[index].sugarG.toString()),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
