import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

Future<List<Photo>> fetchPhotos(http.Client client) async {
  final response =
  await client.get('https://api.unsplash.com/photos/?client_id=cf49c08b444ff4cb9e4d126b7e9f7513ba1ee58de7906e4360afc1a33d1bf4c0');

  return compute(parsePhotos, response.body);
}

List<Photo> parsePhotos(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Photo>((json) => Photo.fromJson(json)).toList();
}

class Photo{

  Photo({this.userName,this.photoName,this.photo});

  String userName;
  String photoName;
  String photo;


  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
        userName: json['user']['username'],
        photoName: json['id'],
        photo: json['urls']['small']
    );
  }
}