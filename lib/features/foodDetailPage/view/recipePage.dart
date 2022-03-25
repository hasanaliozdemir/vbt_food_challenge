import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:vbt_food_challange/features/foodDetailPage/viewmodel/cubit/fooddetailpage_cubit.dart';
import 'package:vbt_food_challange/features/homePage/model/foodModel.dart';

class RecipePage extends StatelessWidget {
  final FoodModel? foodModel;
  const RecipePage({Key? key, required this.foodModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FooddetailpageCubit, FooddetailpageState>(
      builder: (context, state) {
        return BlocConsumer<FooddetailpageCubit, FooddetailpageState>(
          listener: (context, state) {},
          builder: (context, state) {
            return SingleChildScrollView(
              child: Column(children: [
                Container(
                  margin: const EdgeInsets.all(10),
                  child: ExpansionPanelList(
                    animationDuration: const Duration(milliseconds: 400),
                    children: [
                      ExpansionPanel(
                        headerBuilder: (context, isExpanded) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListTile(
                              title: Text("Malzemeler",
                                  style:
                                      Theme.of(context).textTheme.bodyMedium),
                            ),
                          );
                        },
                        body: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            title: Row(
                              children: [
                                Text(foodModel?.materials?[0].name ?? "null",
                                    style: context.textTheme.bodyText2),
                                Text(foodModel?.materials?[0].amount ?? "null",
                                    style: context.textTheme.bodyText2),
                              ],
                            ),
                          ),
                        ),
                        isExpanded:
                            context.read<FooddetailpageCubit>().expandedList[0],
                        canTapOnHeader: true,
                      ),
                      ExpansionPanel(
                        headerBuilder: (context, isExpanded) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListTile(
                              title: Text("Tarif",
                                  style:
                                      Theme.of(context).textTheme.bodyMedium),
                            ),
                          );
                        },
                        body: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            title: Text(foodModel?.recipe.toString() ?? "null",
                                style: Theme.of(context).textTheme.bodyText1),
                          ),
                        ),
                        isExpanded:
                            context.read<FooddetailpageCubit>().expandedList[1],
                        canTapOnHeader: true,
                      ),
                    ],
                    dividerColor: Colors.grey,
                    expansionCallback: (panelIndex, isExpanded) {
                      context.read<FooddetailpageCubit>().openClose(
                          context
                              .read<FooddetailpageCubit>()
                              .expandedList[panelIndex],
                          panelIndex);
                    },
                  ),
                ),
              ]),
            );
          },
        );
      },
    );
  }
}
