import 'dart:convert';

import 'package:album/core/typedef/typedef.dart';
import 'package:album/src/authentication/domain/entites/album.dart';

class AlbumModel extends Album{
  AlbumModel({required super.id,required super.title, required super.description, required super.url, required super.createdAt});
  
  AlbumModel.fromMap(DataMap map):this(id:map['id'],title: map['title'],description: map['description'],url: map['url'],createdAt: map['createdAt']);

  factory AlbumModel.fromJson(String json)=>AlbumModel.fromMap(jsonDecode(json) as DataMap);

  AlbumModel copyWith({String?id,String? title,String? description,String? url, String? createdAt}){
    return AlbumModel(id:id??this.id,title: title?? this.title, description: description??this.description, url: url??this.url, createdAt: createdAt??this.createdAt);
  }

  DataMap toMap()=>{
    "id":id,
    'title':title,
    'description':description,
    'url':url,
    'createdAt':createdAt
  };

  String toJson()=>jsonDecode(toJson());

  AlbumModel.empty():this(id: "1",title: "title",description: "description",url: "https://images.unsplash.com/photo-1509114397022-ed747cca3f65?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",createdAt: "2024-03-21T04:10:07.098Z");
}