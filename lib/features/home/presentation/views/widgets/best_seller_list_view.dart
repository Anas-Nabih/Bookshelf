import 'package:bookShelf/core/utils/utils.dart';
import 'package:bookShelf/core/widgets/custom_error.dart';
import 'package:bookShelf/features/home/book_details/book_details.dart';
import 'package:bookShelf/features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookShelf/features/home/presentation/views/widgets/best_seller_item.dart';
import 'package:bookShelf/features/home/presentation/views/widgets/best_seller_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
        builder: (context, state) {
      if (state is NewestBooksSuccess) {
         return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: state.newsetBook.length,
          itemBuilder: (context, index) => GestureDetector(
              onTap: () => Utils.push(
                  context: context, navigationScreen: BookDetailsView(book: state.newsetBook[index],)),
              child: BookItem(
                book: state.newsetBook[index],
              )),
        );
      } else if (state is NewestBooksFailure) {
        return CustomErrorMSG(errorMSG: state.errorMSG);
      } else {
        return const BestSellerShimmer();
      }
    });
  }
}
