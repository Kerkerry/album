part of 'album_bloc.dart';

sealed class AlbumEvent extends Equatable {
  const AlbumEvent();

  @override
  List<Object> get props => [];
}

class CreateAlbumEvent extends AlbumEvent{
  final String title;
  final String description;
  final String url;
  final String createdAt;
  const CreateAlbumEvent({required this.title, required this.description, required this.url, required this.createdAt});

  @override
  List<Object> get props => [title, description, url, createdAt];
}

class GetAlbumsEvent extends AlbumEvent{
  const GetAlbumsEvent();
}
