import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:base_project/models/product_model.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(const ProductState()) {
    on<SelectProduct>(_mapSelectProductEventToState);
  }


  void _mapSelectProductEventToState(
      SelectProduct event, Emitter<ProductState> emit) async {
    emit(
      state.copyWith(
        status: ProductStatus.selected,
        idSelected: event.idSelected,
      ),
    );
  }
}