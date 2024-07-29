import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/Screens/Home/view/home_page.dart';

import '../../../Provider/recipe_Provider.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    RecipeProvider recipeProvider = Provider.of<RecipeProvider>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
      ),
      body: Column(
        children: [
          Text(recipeProvider.recipeModal!.recipes[selectRecipe].name,style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20),),
          Container(
            width: double.infinity,
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
            decoration: BoxDecoration(
              color: Colors.black26,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                Text('Ingredients',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20),),
                SizedBox(height: 10,),
                ...List.generate(recipeProvider.recipeModal!.recipes[selectRecipe].ingredients.length, (index) => Text(recipeProvider.recipeModal!.recipes[selectRecipe].ingredients[index]),),
              ]
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
            decoration: BoxDecoration(
              color: Colors.black26,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                Text('Instructions',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20),),
                SizedBox(height: 10,),
                ...List.generate(recipeProvider.recipeModal!.recipes[selectRecipe].instructions.length, (index) => Text(recipeProvider.recipeModal!.recipes[selectRecipe].instructions[index],overflow: TextOverflow.ellipsis,),),
              ]
            ),
          ),
        ],
      ),
    );
  }
}
