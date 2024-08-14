import 'package:album/core/typedef/typedef.dart';
import 'package:album/core/usecase/usecase.dart';
import 'package:album/src/authentication/domain/entites/album.dart';
import 'package:album/src/authentication/domain/repositories/album_repository.dart';

class GetAlbum extends UsecaseWithoutParams<List<Album>>{
  const GetAlbum(this._repository);
  final AlbumRepository _repository;
  
  @override
  ResultFuture<List<Album>> call()async=>_repository.getAlbums();


}