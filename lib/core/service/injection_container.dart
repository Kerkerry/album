import 'package:album/src/authentication/data/datasource/album_remote_datasource.dart';
import 'package:album/src/authentication/data/repositories/album_reository_implementation.dart';
import 'package:album/src/authentication/domain/repositories/album_repository.dart';
import 'package:album/src/authentication/domain/usecase/create_album.dart';
import 'package:album/src/authentication/domain/usecase/get_album.dart';
import 'package:album/src/authentication/presentation/bloc/album_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(() => AlbumBloc(createAlbum: sl(), getAlbum: sl()));
  sl.registerLazySingleton(() => CreateAlbum(sl()));
  sl.registerLazySingleton(() => GetAlbum(sl()));
  sl.registerLazySingleton<AlbumRepository>(() => AlbumRepositoryImplementation(sl()));
  sl.registerLazySingleton<AlbumRemoteDataSource>(() => AlbumRemoteDataSourceImplementation(sl()));
  sl.registerLazySingleton(() => http.Client());
}
