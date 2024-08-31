import 'dart:convert';

import 'package:online_shop/Model/sneakers.dart';
import 'package:flutter/services.dart' as root_bundle;

class Helper {
  static Future<List<Sneaker>> getMenSneakers() async {
    final String response =
        await root_bundle.rootBundle.loadString("assets/json/men.json");
    List<dynamic> mens = json.decode(response);
    return mens.map((men) => Sneaker.fromJson(men)).toList();
  }

  static Future<List<Sneaker>> getWomenSneakers() async {
    final String response =
        await root_bundle.rootBundle.loadString("assets/json/women.json");
    List<dynamic> women = json.decode(response);
    return women.map((x) => Sneaker.fromJson(x)).toList();
  }

  static Future<List<Sneaker>> getKidsSneakers() async {
    final String response =
        await root_bundle.rootBundle.loadString("assets/json/kids.json");
    List<dynamic> kids = json.decode(response);
    return kids.map((kid) => Sneaker.fromJson(kid)).toList();
  }

  static Future<dynamic> getMenSneakerById(String id) async {
    final String response =
        await root_bundle.rootBundle.loadString("assets/json/men.json");
    List<dynamic> mens = json.decode(response);
    List<Sneaker> mensList = mens.map((men) => Sneaker.fromJson(men)).toList();
    return mensList.firstWhere((men) => men.id == id);
  }
}
