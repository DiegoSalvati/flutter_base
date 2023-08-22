
import 'package:base_project/category/bloc/category_bloc.dart';
import 'package:base_project/category/category_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:base_project/models/category_list_model.dart';



class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({this.callback, this.category, super.key});

  final Category? category;
  final CategoryCLicked? callback;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Cart Screen'),
        ),
        body: BlocBuilder<CategoryBloc, CategoryState>(
          builder: (context, state) {
            if (state.status.isLoading) {
              return const Center(child:  CircularProgressIndicator(),
              );
            }
            if (state.status.isSuccess) {
              return Column(
                children: [
                  SizedBox(
                    height: 200,
                    child: ListView.builder(
                        itemCount: state.categories as int,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                            ],
                          );
                        }

                    ),
                  )
                ],
              );

            } else {
              return Text('Something went wrong');
            }
          },

          ),
        ),
      );
  }
}