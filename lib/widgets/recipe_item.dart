import 'dart:ui';
import 'package:flutter/material.dart';

import '../models/recipe_model.dart';

class RecipeItem extends StatelessWidget {
  final Recipe recipe;
  RecipeItem(this.recipe);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      width: double.infinity,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  child: Image.network(
                    recipe.picture.toString(),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 4),
                              child: Text(
                                recipe.name,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            ),
                            Text(
                              recipe.description,
                              style: TextStyle(
                                  fontSize: 18, color: Colors.black54),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        recipe.id.toString(),
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: Row(
              children: [
                Expanded(
                  child: Container(),
                  flex: 2,
                ),
                SizedBox(
                  width: 16,
                ),
                Expanded(
                  flex: 5,
                  child: Container(
                    color: Colors.grey,
                    height: 1,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}


// Container(
//         color: Colors.red,
//         child: ListTile(
//           leading: Image.network(
//             recipe.picture.toString(),
//             height: 60,
//             width: 90,
//             fit: BoxFit.cover,
//           ),
//           title: Text(recipe.name),
//           subtitle: Container(
//             color: Colors.blue,
//             child: Text(recipe.description),
//           ),
//           trailing: Text(recipe.id.toString()),
//         ),
//       ),