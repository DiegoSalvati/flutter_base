import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'category/bloc/category_bloc.dart';
import 'package:base_project/models/category_list_model.dart';
import 'category/category_item.dart';
import 'package:base_project/product/bloc/product_bloc.dart';
import 'package:base_project/cart/bloc/cart_bloc.dart';
import 'package:base_project/view/checkout_screen.dart';
import 'package:base_project/widgets/badge.dart' as badges;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) =>
              CategoryBloc(
              ),
        ),
        BlocProvider(
          create: (_) =>
          ProductBloc(
          )..add(LoadProducts(),),
        ),
        BlocProvider(
          create: (_) =>
          CartBloc(
          )..add(LoadCart()),
        ),
      ],
      child: HomePage(),
    );
  }

}
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocBuilder<CategoryBloc, CategoryState>(
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                title: Row(children: [Text('First App'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      BlocBuilder<CartBloc, CartState>(builder:
                          (context, state) {
                        if (state is CartLoading) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        if (state is CartLoaded) {
                          return badges.Badge (
                            child: IconButton(
                              icon: Icon(Icons.shopping_bag),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => CheckOutScreen()),
                                );
                              },
                            ),
                            value: state.cart.productQuantity(state.cart.products).values.toString(),
                          );
                        } else {
                          return Icon(Icons.error);
                        }
                      }
                      ),
                    ],
                  ),
                ],
                ),
              ),
              body: SizedBox(
                height: MediaQuery.of(context).size.height * .15,
                child: ListView.builder(
                  itemCount: categories.length,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return CategoryItem(
                      key: ValueKey('${state.categories[index].name}$index'),
                      category: state.categories[index],
                      callback: (Category categorySelected) {
                        context.read<CategoryBloc>().add(
                          SelectCategory(
                            idSelected: categorySelected.name as int,
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            );
          }
      ),
    );
  }
}