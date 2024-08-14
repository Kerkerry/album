part of 'album_bloc.dart';

sealed class AlbumState extends Equatable {
  const AlbumState();
  
  @override
  List<Object> get props => [];
}

class AlbumInitialstate extends AlbumState{
  const AlbumInitialstate();
}

class AlbumsLoadingState extends AlbumState{
  const AlbumsLoadingState();
}

class AlbumsLoadedState extends AlbumState{
  final List<Album> albums;

  const AlbumsLoadedState(this.albums);
  @override
  List<Object> get props => albums.map((album) => album.id).toList();
}

class AlbumCreatingState extends AlbumState{
  const AlbumCreatingState();
}

class AlbumCreatedState extends AlbumState{
  const AlbumCreatedState();
}

class AlbumErrorState extends AlbumState{
  final String message;
  const AlbumErrorState(this.message);

  @override
  List<Object> get props => [message];
}
