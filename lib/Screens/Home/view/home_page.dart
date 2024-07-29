import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Provider/recipe_Provider.dart';
import '../../Daitails/view/details_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    RecipeProvider recipeProvider = Provider.of<RecipeProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(title: Text('Recipe App'),
      centerTitle: true,),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: FutureBuilder(
        future: recipeProvider.fromMap(),
    builder: (context, snapshot) {
    if (snapshot.hasData) {
      return Column(
        children: [
          ...List.generate(recipeProvider.recipeModal!.recipes.length, (index) => GestureDetector(
            onTap: () {
              selectRecipe=index;
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailsPage(),));
            },
            child: Container(
              margin: EdgeInsets.all(10),
              width: double.infinity,
              height: 400,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(fit: BoxFit.cover,image: NetworkImage(recipeProvider.recipeModal!.recipes[index].image))
              ),
              child: Container(
                width: double.infinity,
                height: 400,
                decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.circular(15),
                ),
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 100),
                      width: double.infinity,
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.transparent, Colors.black,],
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Center(child: Text(recipeProvider.recipeModal!.recipes[index].id.toString(),style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.w600),)),
                          Center(child: Text(recipeProvider.recipeModal!.recipes[index].cuisine,style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.w600),)),
                          Center(child: Text(recipeProvider.recipeModal!.recipes[index].name,style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.w600),)),
                          SizedBox(height: 25,)
                        ],
                      )
                      ,),
                  ],
                ),
              ),
            ),
          ),)
        ],
      );
    }else{
      return Center(child: CircularProgressIndicator(),);
    }
    }
        ),
      ),)
    );
  }
}

int selectRecipe=0;