import 'dart:convert';

class Wand{
  final String woodType;
  final String core;
  final int wandLargo;
  final String wandUsuario;

  factory Wand.constructor({required dynamic jsonElement}){
    final wand = jsonElement["wand"];
    String woodType = wand["wood"] ?? "";
    String core = wand["core"] ?? "";
    int wandLargo = wand["length"] ?? 0;
    String wandUsuario = jsonElement["name"] ?? "";
    return Wand._(woodType,core,wandLargo,wandUsuario);
  }
  Wand._(this.woodType,this.core,this.wandLargo,this.wandUsuario);
}