import 'package:album/core/errors/exception.dart';
import 'package:album/core/errors/failure.dart';
import 'package:album/core/typedef/typedef.dart';
import 'package:album/src/authentication/data/datasource/album_remote_datasource.dart';
import 'package:album/src/authentication/domain/entites/album.dart';
import 'package:album/src/authentication/domain/repositories/album_repository.dart';
import 'package:dartz/dartz.dart';

class AlbumRepositoryImplementation implements AlbumRepository{
  const AlbumRepositoryImplementation(this._remoteDatasource);
  final AlbumRemoteDataSource _remoteDatasource;

  @override
  ResultVoid createAlbum({required String title, required String description, required String url, required String createdAt})async {
   try {
     await _remoteDatasource.createAlbum(title: title, description: description, url: url, createdAt: createdAt);

     return const Right(null);
   }on APIException catch (e) {
     return Left(APIFailure.fromException(e));
   }
  }

  @override
  ResultFuture<List<Album>> getAlbums() async{
    try {
      final result=await _remoteDatasource.getAlbums();
      return Right(result);
    }on APIException catch (e) {
      return Left(APIFailure.fromException(e));
    }
  }
}