import 'package:bookly/features/home/presentaion/views/widgets/best_seller_item.dart';
import 'package:flutter/material.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
      itemCount: 8,
      itemBuilder: (context, index) => BestSellerItem(),
    ));
  }
}
