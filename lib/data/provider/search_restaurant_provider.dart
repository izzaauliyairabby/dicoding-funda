import 'package:dicoding_restaurant_app/data/provider/restaurant_provider.dart';
import 'package:dicoding_restaurant_app/data/service/search_restaurant_service.dart';
import 'package:dicoding_restaurant_app/models/search_restaurant_model.dart';
import 'package:flutter/cupertino.dart';

class SearchRestaurantProvider with ChangeNotifier {
  SearchRestaurantService service = SearchRestaurantService();
  List<Restaurant> result = [];
  ResultState state = ResultState.noData;

  void getSearch(String namaResto) async {
    state = ResultState.loading;
    notifyListeners();
    result = await service.getSearchRestaurant(namaResto) ?? [];
    if (result == []) {
      state = ResultState.noData;
      notifyListeners();
    } else {
      state = ResultState.hasData;
      notifyListeners();
    }
    notifyListeners();
  }
}
