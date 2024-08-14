import 'dart:convert';

import 'package:album/core/errors/exception.dart';
import 'package:album/core/typedef/typedef.dart';
import 'package:album/core/utils/constants.dart';
import 'package:album/src/authentication/data/model/album_model.dart';
import 'package:http/http.dart' as http;

abstract class AlbumRemoteDataSource {
  const AlbumRemoteDataSource();

  Future<void> createAlbum(
      {required String title,
      required String description,
      required String url,
      required String createdAt});
  Future<List<AlbumModel>> getAlbums();
}

const kCreateEndpoindUrl = "/test-api/album";
const kGetEndpointUrl = "/test-api/album";

class AlbumRemoteDataSourceImplementation implements AlbumRemoteDataSource {
  const AlbumRemoteDataSourceImplementation(this._client);

  final http.Client _client;
  @override
  Future<void> createAlbum(
      {required String title,
      required String description,
      required String url,
      required String createdAt}) async {
    final response = await _client.post(Uri.https(kBaseUrl, kCreateEndpoindUrl),
        body: jsonEncode({
          'title': title,
          'description': description,
          'url': url,
          'createdAt': createdAt
        }),
        headers: {'Content-Type': 'application/json'});

    if (response.statusCode != 200 && response.statusCode != 201) {
      throw (APIException(
          statusCode: response.statusCode, message: response.body));
    }
  }

  @override
  Future<List<AlbumModel>> getAlbums() async {
    try {
      final response = await _client.get(Uri.https(kBaseUrl, kGetEndpointUrl));
      return List<DataMap>.from(jsonDecode(response.body) as List)
          .map((albumData) => AlbumModel.fromMap(albumData))
          .toList();
    } on APIException {
      rethrow;
    } catch (e) {
      throw (APIException(message: e.toString(), statusCode: 505));
    }
  }
}
