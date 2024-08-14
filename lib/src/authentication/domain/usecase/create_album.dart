
import 'package:album/core/typedef/typedef.dart';
import 'package:album/core/usecase/usecase.dart';
import 'package:album/src/authentication/domain/repositories/album_repository.dart';
import 'package:equatable/equatable.dart';

class CreateAlbum extends UsecaseWithParams<void, AlbumParams>{
  const CreateAlbum(this._repository);
  final AlbumRepository _repository;
  @override
  ResultFuture<void> call(AlbumParams params)async =>_repository.createAlbum(title: params.title, description: params.description, url: params.url, createdAt: params.createdAt);

}

class AlbumParams extends Equatable{
  final String title;
  final String description;
  final String url;
  final String createdAt;

  const AlbumParams({required this.title, required this.description, required this.url, required this.createdAt});
  
  @override
  List<Object?> get props => [title,description,url,createdAt];


  const AlbumParams.empty():this(title: "title",description: "description",url: "",createdAt: "2024-03-21T04:10:07.098Z");
  
}