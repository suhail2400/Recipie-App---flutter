import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:recipie_app/detailsPage.dart';
import 'package:recipie_app/recipiesModel.dart';
import 'package:recipie_app/services.dart';

class Recipieshomepage extends StatefulWidget {
  const Recipieshomepage({super.key});

  @override
  State<Recipieshomepage> createState() => _RecipieshomepageState();
}

class _RecipieshomepageState extends State<Recipieshomepage> {
  List<Recipe> recipies = [];
  myRecipies() {
    reciepiesItems().then((value) {
      setState(() {
        recipies = value;
      });
    });
  }

  @override
  void initState() {
    myRecipies();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Recipies'),
          centerTitle: true,
        ),
        body: ListView.builder(
            shrinkWrap: true,
            itemCount: recipies.length,
            itemBuilder: (context, index) {
              final recipie = recipies[index];
              return Padding(
                  padding: const EdgeInsets.all(8),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  DetailsPage(recipe: recipie)));
                    },
                    child: Stack(
                      children: [
                        Container(
                          height: 250,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            image: DecorationImage(
                              image: NetworkImage(recipie.image),
                              fit: BoxFit.fill,
                            ),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.black, offset: Offset(-5, 7))
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Padding(
                            padding:
                                const EdgeInsets.all(8), // Move Padding here
                            child: Container(
                              height: 45,
                              decoration: const BoxDecoration(
                                color: Colors.black26,
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(20),
                                  bottomLeft: Radius.circular(30),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Text(
                                        recipie.name,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w800,
                                          fontSize: 18,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Icon(Icons.star, color: Colors.orange),
                                  Text(
                                    recipie.rating.toString(),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 18,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(width: 15),
                                  Text(
                                    recipie.cookTimeMinutes.toString(),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 18,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const Text(
                                    'min',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 18,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(width: 15),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ));
            }));
  }
}
