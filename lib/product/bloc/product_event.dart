part of 'product_bloc.dart';

class ProductEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadProducts extends ProductEvent{}

class SelectProduct extends ProductEvent {
  SelectProduct({
    required this.idSelected,
  });
  final int idSelected;

  @override
  List<Object?> get props => [idSelected];
}