

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
  FoodAddCubit() : super(FoodAddInitial()){
    _init();
  }



  final formKey = GlobalKey<FormState>();
  TextEditingController? foodNameController;
   String? categoryController;
  TextEditingController? recipeController;
  TextEditingController? materialnameController;
  TextEditingController? materialAmountController;
  List<MaterialModel> materialList = [];
  List<DropdownMenuItem>? items;
 List icon = [Icons.camera_alt, Icons.image, Icons.remove_circle];

  List iconText = ["Camera", "Gallery", "Remove"];
  File? image;
   final ImagePicker _picker = ImagePicker();
  _init()async{
   // await getCategories();
  }
  

  Future getCameraImage() async {
    final image2 = await ImagePicker().pickImage(source: ImageSource.camera);
    
      image = File(image2!.path);
    
  }

  Future getGalleryImage() async {
final XFile? image2 = await _picker.pickImage(source: ImageSource.gallery);
    
      image = File(image2!.path);
  
  }

  void removeImage() {
   
      image = null;
  
  }

  

}
