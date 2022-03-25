import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:vbt_food_challange/core/constant/strings/addFood_strings.dart';
import 'package:vbt_food_challange/core/theme/color/color_theme.dart';
import 'package:vbt_food_challange/core/widgets/custom_button.dart';
import 'package:vbt_food_challange/features/addFoodPage/viewmodel/cubit/foodadd_cubit.dart';
import 'package:vbt_food_challange/features/searchPage/model/cateory_card_model.dart';

class AddFoodPageViewBody extends StatefulWidget {
  const AddFoodPageViewBody({Key? key}) : super(key: key);

  @override
  State<AddFoodPageViewBody> createState() => _AddFoodPageViewBodyState();
}

class _AddFoodPageViewBodyState extends State<AddFoodPageViewBody> {
  List<CategoryCardModel> categories = [
    CategoryCardModel("Çorba", false),
    CategoryCardModel("Ana Yemek", false),
    CategoryCardModel("Ara Sıcak", false),
    CategoryCardModel("Tatlı", false),
    CategoryCardModel("İçecek", false),
    CategoryCardModel("Salata", false),
  ];
  @override
  Widget build(BuildContext context) {
    return BlocProvider<FoodAddCubit>(
      create: (context) => FoodAddCubit(),
      child: BlocConsumer<FoodAddCubit, FoodAddState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Container(
            padding: context.paddingLow,
            child: SingleChildScrollView(
              child: Form(
                key: context.read<FoodAddCubit>().formKey,
                child: Column(
                  children: [
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          context.read<FoodAddCubit>().image == null
                              ? Container(
                                  padding: EdgeInsets.all(context.width / 10),
                                  height: context.height / 5,
                                  width: context.width * 2 / 4,
                                  decoration: BoxDecoration(
                                    borderRadius: context.highBorderRadius,
                                    color: AppColors().red,
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColors().white,
                                    ),
                                    child: Icon(
                                      Icons.add,
                                      color: AppColors().red,
                                      size: context.width / 7,
                                    ),
                                  ),
                                )
                              : Container(
                                  height: context.height / 5,
                                  width: context.width * 2 / 4,
                                  decoration: BoxDecoration(
                                    borderRadius: context.highBorderRadius,
                                  ),
                                  child: Image.file(
                                      context.read<FoodAddCubit>().image!),
                                ),
                          //select Menu
                          Container(
                            padding: context.paddingLow,
                            height: context.height / 4,
                            width: context.width / 3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                //selecting event photo
                                for (var i = 0; i < 3; i++)
                                  InkWell(
                                    onTap: () => i == 0
                                        ? context
                                            .read<FoodAddCubit>()
                                            .getCameraImage()
                                        : i == 1
                                            ? context
                                                .read<FoodAddCubit>()
                                                .getGalleryImage()
                                            : context
                                                .read<FoodAddCubit>()
                                                .removeImage(),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Icon(context
                                            .read<FoodAddCubit>()
                                            .icon[i]),
                                        Text(context
                                            .read<FoodAddCubit>()
                                            .iconText[i])
                                      ],
                                    ),
                                  ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0, top: 8),
                      child: TextFormField(
                        controller:
                            context.read<FoodAddCubit>().foodNameController,
                        decoration: InputDecoration(
                          label: Text(
                            AddFoodStrings.foodNameLabelText,
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                        ),
                      ),
                    ),
                    DropdownButton(
                      value: context.read<FoodAddCubit>().selectedCategory,
                      items: categories
                          .map((e) => DropdownMenuItem(
                                child: Text(e.category),
                                value: e.category,
                              ))
                          .toList(),
                      onChanged: (String? value) => context
                          .read<FoodAddCubit>()
                          .changeSelectedCategory(value),
                      isExpanded: true,
                      hint: Text(
                        AddFoodStrings.categoryLabelText,
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                    ),
                    SizedBox(
                      height: context.height * 0.02,
                    ),
                    Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(bottom: 10),
                          alignment: Alignment.centerLeft,
                          child: Text(AddFoodStrings.recipeContentTitle),
                        ),
                        SizedBox(
                          height: context.height / 5,
                          child: TextFormField(
                            // key: ValueKey(valKey),
                            validator: (val) {
                              if (val!.isEmpty) {
                                return 'null';
                              }
                              return null;
                            },

                            controller:
                                context.read<FoodAddCubit>().recipeController,
                            keyboardType: TextInputType.text,
                            maxLines: 4,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(20.0),
                              hintText: AddFoodStrings.recipeContenthintText,
                              hintStyle: Theme.of(context).textTheme.bodySmall,
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                  width: 1,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: AppColors().black,
                                  width: 1,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: context.width / 3,
                              padding:
                                  const EdgeInsets.only(bottom: 8.0, top: 8),
                              child: TextFormField(
                                controller: context
                                    .read<FoodAddCubit>()
                                    .materialnameController,
                                decoration: InputDecoration(
                                  hintText: AddFoodStrings.materialNameHintText,
                                  hintStyle:
                                      Theme.of(context).textTheme.bodyMedium,
                                ),
                              ),
                            ),
                            Container(
                              width: context.width / 3,
                              padding:
                                  const EdgeInsets.only(bottom: 8.0, top: 8),
                              child: TextFormField(
                                controller: context
                                    .read<FoodAddCubit>()
                                    .materialAmountController,
                                decoration: InputDecoration(
                                  hintText:
                                      AddFoodStrings.materialAmountHintText,
                                  hintStyle:
                                      Theme.of(context).textTheme.bodyMedium,
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                context.read<FoodAddCubit>().addMaterial();
                              },
                              icon: Icon(
                                Icons.add,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: context.height / 4,
                          child: ListView.builder(
                            itemCount: context
                                .read<FoodAddCubit>()
                                .materialList
                                .length,
                            itemBuilder: (context, index) {
                              return Card(
                                child: Row(
                                  children: [
                                    Text(
                                      '${context.read<FoodAddCubit>().materialList[index].name}',
                                      style:
                                          Theme.of(context).textTheme.bodyText2,
                                    ),
                                    SizedBox(width: context.width * 0.3),
                                    Text(
                                      '${context.read<FoodAddCubit>().materialList[index].amount}',
                                      style:
                                          Theme.of(context).textTheme.bodyText2,
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    CustomButton(
                      text: 'Ekle',
                      isLoading: false,
                      func: () {
                        context.read<FoodAddCubit>().pushFood(context);
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
