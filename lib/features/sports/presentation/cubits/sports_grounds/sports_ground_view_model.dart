import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class SportsGroundViewModel {
  var searchController = TextEditingController();
  var loactionController = TextEditingController();
  var dateController = TextEditingController();
  var maxPriceController = TextEditingController();
  var minPriceController = TextEditingController();
}
