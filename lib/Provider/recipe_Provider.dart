import 'package:flutter/cupertino.dart';
import '../API/api_data.dart';
import '../Modal/Recipe_Modal.dart';

class RecipeProvider extends ChangeNotifier {
  RecipeModal? recipeModal;

  Future<RecipeModal?> fromMap() async {
    final data = await ApiServices.apiServices.fetchData();
    recipeModal = RecipeModal.fromJson(data);
    notifyListeners();
    return recipeModal;
  }
  RecipeProvider()
  {
    fromMap();
  }
}