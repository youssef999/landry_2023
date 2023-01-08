
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/item_model.dart';

class LandryController extends GetxController {

  int quantity=1;
  String cat='بلايز';
  List <ItemModel> orderItems=[];
  List pricingList=[];
  List nameList=[];
  double price=0;
  Color colorx=Colors.grey;


  @override
  void onInit() {

    orderItems=[];
    super.onInit();

  }


  addItems(ItemModel item){

    orderItems.add(item);
    pricingList.add(item.price);
    nameList.add(item.name);
  }

  addPricing(String price){
    pricingList.add(price);
  }

  removePricing(String price,String name){

    if(pricingList.contains(price)&& orderItems.contains(name)){
      pricingList.remove(price);
    }

  }

  removeItem(ItemModel item){


    if(nameList.toString().contains(item.name)&&pricingList.toString().contains(item.price)){

      minPrice(double.parse(item.price.toString()));
      pricingList.remove(item.price);
      orderItems.remove(item);
      nameList.remove(item.name);

    }



  }

  addPrice(double p){

    price=price+p;
    update();
  }

  changeCat(String c){
    cat=c;
    update();
  }

  minPrice(double p ){
   // if(pricingList.contains(pricex) && orderItems.contains(name)) {
    if( price>=0){
      price = price - p;
      if(price<0){
        price=0;
      }
    }
    update();
      //  print("p=="+p.toString());
      //  print("pn=="+name.toString());
      //  bool condition=false;
      //
      //
      // for(int i=0;i<orderItems.length;i++ ){
      //
      //  if( orderItems[i].name.toString().contains(name) && price>=0){
      //    condition=true;
      //  }
      // }



   // }
   // update();
  }



  changeCategory(String cat2){
    cat=cat2;
    update();
  }

  addToList(int length){

  }


}