import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:base_project/cart/bloc/cart_bloc.dart';
import 'package:base_project/models/product_model.dart';

class AddButton extends StatelessWidget {
  const AddButton({this.product, super.key});

  final Product? product;


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        return ElevatedButton (
          onPressed: () {
            context.read<CartBloc>().add(AddProduct(product!));
          },
          child: const Text(
            'Añade al carrito',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        style: ElevatedButton.styleFrom(
        backgroundColor: Colors.red,
        ),
        );
      }


    );
  }
}
