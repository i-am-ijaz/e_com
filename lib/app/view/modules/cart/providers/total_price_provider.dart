import 'package:flutter_riverpod/flutter_riverpod.dart';


final totalPriceProvider = StateProvider<double>((ref) {
  return 0; // Initial value for total price
});