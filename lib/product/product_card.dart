import 'package:flutter/material.dart';
import 'package:base_project/models/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:base_project/product/bloc/product_bloc.dart';

typedef ProductCLicked = Function(Product productSelected);

class ProductCard extends StatelessWidget {
  final Product product;
  final ProductCLicked? callback;

  ProductCard({required this.product, this.callback});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => callback!(product),
      child: BlocSelector<ProductBloc, ProductState, bool>(
        selector: (state) =>
        (state.status.isSelected && state.idSelected == product.name)
            ? true
            : false,
        builder: (context, state) {
          return Column(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeInOutCirc,
                padding: const EdgeInsets.symmetric(horizontal: 2.0),
                alignment: Alignment.center,
                height: state ? 70.0 : 60.0,
                width: state ? 70.0 : 60.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: state ? Colors.deepOrangeAccent : Colors.amberAccent,
                ),
                child: const Icon(
                  Icons.account_balance,
                ),
              ),
              const SizedBox(height: 4.0),
              Container(
                width: 60,
                child: Text(
                  product.name ?? '',
                  style: TextStyle(
                      fontSize: 10.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
