import 'package:equatable/equatable.dart';

class  Category extends Equatable {
  final String name;


  const Category({
    required this.name,
  });

  @override
  List<Object?> get props => [
    name,
  ];


}
List<Category> categories = [
 const  Category(
    name: '1',
  ),
 const  Category(
    name: '2',
  ),
  const  Category(
    name: '3',
  ),
  const  Category(
    name: '4',
  ),
];
