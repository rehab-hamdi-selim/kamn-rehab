import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:kamn/features/sports/data/models/filter_model.dart';

@injectable
class SportsGroundViewModel {
  TextEditingController? searchController;
  TextEditingController? loactionController;
  TextEditingController? maxPriceController;
  TextEditingController? minPriceController;
  ScrollController? scrollController;
  var distance = 0.0;
  var userLatitude = 0.0;
  var userLongitude = 0.0;
  List<FilterModel?> filterItem = [];

  SportsGroundViewModel() {
    initControllers();
  }

  void initControllers() {
    searchController = TextEditingController();
    loactionController = TextEditingController();
    maxPriceController = TextEditingController();
    minPriceController = TextEditingController();
    scrollController = ScrollController();
  }

  void resetViewModel() {
    distance = 0;
    loactionController?.clear();
    maxPriceController?.clear();
    minPriceController?.clear();
  }

  void dispose() {
    searchController?.dispose();
    loactionController?.dispose();
    maxPriceController?.dispose();
    minPriceController?.dispose();
    scrollController?.dispose();

    searchController = null;
    loactionController = null;
    maxPriceController = null;
    minPriceController = null;
    scrollController = null;
  }
}
