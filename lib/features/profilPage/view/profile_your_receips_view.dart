import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:vbt_food_challange/features/homePage/model/foodModel.dart';

import '../../../core/theme/color/color_theme.dart';
import '../../foodDetailPage/view/detail_view.dart';

class YourReceipsView extends StatelessWidget {
  final List<FoodModel> foods;
  const YourReceipsView({Key? key, required this.foods}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.chevron_left),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text("Tariflerin"),
      ),
      body: ListView.builder(
        itemCount: foods.length,
        itemBuilder: (context, index) {
          var _item = foods[index];
          return Padding(
            padding: context.paddingLow,
            child: Container(
              decoration: BoxDecoration(
                  color: AppColors().redremains,
                  borderRadius: context.normalBorderRadius),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(_item.imageUrls?.first),
                ),
                title: Text(_item.name ?? "Yükleniyor..."),
                trailing: IconButton(
                  icon: Icon(Icons.chevron_right, color: AppColors().red),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                FoodDetailPageView(foodModel: _item)));
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
