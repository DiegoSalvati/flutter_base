
import 'package:equatable/equatable.dart';


class Product extends Equatable {


  final String name;
  final double price;
  final int id;

  const Product({
    required this.name,
    required this.price,
    required this.id,
  });


  @override
  List<Object?> get props => [
    name,
    price,
    id,
  ];

  static List<Product> products = [
    const Product(
      id: 5,
      name: 'Medio Menu',
      price: 2.99,
    ),
    const Product(
      id: 6,
      name: 'Menu completo',
      price: 2.99,
    ),
  ];
}