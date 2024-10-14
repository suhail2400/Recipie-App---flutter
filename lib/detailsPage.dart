import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:recipie_app/recipiesModel.dart';

class DetailsPage extends StatelessWidget {
  final Recipe recipe;
  const DetailsPage({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Image.network(
                recipe.image,
                fit: BoxFit.cover,
                height: 450,
                width: size.width,
              ),
              Positioned(
                top: MediaQuery.of(context).padding.top, // Proper placement
                left: 16, // Adjust padding if needed
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.arrow_back_ios),
                ),
              ),
              Positioned(
                bottom: -50,
                right: 30,
                left: 30,
                child: Container(
                    height: 140,
                    width: size.width,
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 2,
                          spreadRadius: 2,
                        )
                      ],
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.amber,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(recipe.name,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  )),
                              Row(
                                children: [
                                  Text(recipe.mealType[0],
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      )),
                                  const Text("&",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      )),
                                  Text(recipe.cuisine,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      )),
                                ],
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: 50,
                          width: size.width,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                              )),
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 30,
                              ),
                              const Icon(
                                Icons.star,
                                color: Colors.orange,
                              ),
                              Text(recipe.rating.toString()),
                              const SizedBox(
                                width: 50,
                              ),
                              const Icon(
                                Icons.timer,
                                color: Colors.blueAccent,
                              ),
                              Text(recipe.cookTimeMinutes.toString()),
                              const SizedBox(
                                width: 50,
                              ),
                              const Icon(
                                Icons.accessibility,
                                color: Colors.black,
                              ),
                              Text(recipe.caloriesPerServing.toString()),
                            ],
                          ),
                        )
                      ],
                    )),
              )
            ],
          ),
          const Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              children: [
                SizedBox(
                  height: 60,
                ),
                Text("Ingredients",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ))
              ],
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(left: 15, top: 10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(recipe.ingredients.length, (index) {
                    return Text("= ${recipe.ingredients[index]}",
                        style: const TextStyle(fontSize: 16));
                  }))),
          const SizedBox(
            height: 10,
          ),
          const Padding(
            padding: EdgeInsets.all(15),
            child: Text("Instructions",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                )),
          ),
          Padding(
              padding: const EdgeInsets.only(left: 15, top: 10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(recipe.instructions.length, (index) {
                    return Text("= ${recipe.instructions[index]}",
                        style: const TextStyle(fontSize: 16));
                  }))),
          const SizedBox(
            height: 40,
          ),
        ],
      ),
    ));
  }
}
