import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:vbt_food_challange/features/homePage/model/foodModel.dart';

part 'foodadd_state.dart';

class FoodAddCubit extends Cubit<FoodAddState> {
  FoodAddCubit() : super(FoodAddInitial()) {
    _init();
  }

  final formKey = GlobalKey<FormState>();
  TextEditingController foodNameController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController recipeController = TextEditingController();
  TextEditingController materialnameController = TextEditingController();
  TextEditingController materialAmountController = TextEditingController();
  List<MaterialModel> materialList = [];
  List<DropdownMenuItem>? items;
  List icon = [Icons.camera_alt, Icons.image, Icons.remove_circle];

  List iconText = ["Camera", "Gallery", "Remove"];
  File? image;
  final ImagePicker _picker = ImagePicker();
  _init() async {
    // await getCategories();
  }

  Future<void> getCameraImage() async {
    final temporaryImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (temporaryImage == null) return;
    image = File(temporaryImage.path);
    emit(FoodAddComplate(image));
  }

  Future getGalleryImage() async {
    final temporaryImage = await _picker.pickImage(source: ImageSource.gallery);
    if (temporaryImage == null) return;
    image = File(temporaryImage.path);
    emit(FoodAddComplate(image));
  }

  void removeImage() {
    image = null;
    emit(FoodAddComplate(image!));
  }

  Future<List<MaterialModel>> listMaterial() async {
    List<MaterialModel> list = [];
    for (int i = 0; i < materialList.length; i++) {
      list.add(
        MaterialModel(
          name: materialList[i].name,
          amount: materialList[i].amount,
        ),
      );
    }
    return list;
  }

  Future<void> addMaterial() async {
    if (materialnameController.text == "") {
      return;
    }
    if (materialAmountController.text == "") {
      return;
    }
    materialList.add(
      MaterialModel(
        name: materialnameController.text,
        amount: materialAmountController.text,
      ),
    );
    materialnameController.clear();
    materialAmountController.clear();
    emit(FoodAddComplate(image));
  }

  Future<void> pushFood() async {}
}
