import 'package:flutter/material.dart';
import 'package:vbt_food_challange/features/searchPage/viewModel/search_cubit.dart';
import 'package:vbt_food_challange/product/widgets/bottom_navbar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchPageView extends StatelessWidget {
  const SearchPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchPageCubit(),
      child: BlocConsumer<SearchPageCubit, SearchPageState>(
        listener: (context, state) {
          if (state is SearcPageErrorState) {}
        },
        builder: (context, state) {
          return buildScaffold(context, state);
        },
      ),
    );
  }

  Scaffold buildScaffold(context, state) {
    return Scaffold(
      body: Center(
        child: Text('SearchPageView'),
      ),
      bottomNavigationBar: BottomNavbar(),
    );
  }
}
