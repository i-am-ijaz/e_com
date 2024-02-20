import 'package:e_com/app/data/models/product/option.dart';
import 'package:e_com/app/data/models/product/option_category.dart';

List<OptionCategory> optionCategories = <OptionCategory>[
  OptionCategory(
    title: 'What sauces do you want?',
    options: [
      Option(name: 'BBQ Sauce', price: 0.34),
      Option(name: 'Ranch Sauce', price: 0),
    ],
  ),
  OptionCategory(
    title: 'Choose your drink',
    options: [
      Option(name: 'Pepsi', price: 0.34),
      Option(name: 'Water', price: 0),
    ],
  ),
];
