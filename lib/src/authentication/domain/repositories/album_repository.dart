import 'package:album/core/typedef/typedef.dart';
import 'package:album/src/authentication/domain/entites/album.dart';

abstract class AlbumRepository {
  const AlbumRepository();

  ResultVoid createAlbum(
      {required String title,
      required String description,
      required String url,
      required String createdAt});

  ResultFuture<List<Album>> getAlbums();
}
