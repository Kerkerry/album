import 'dart:async';

import 'package:album/src/authentication/domain/entites/album.dart';
import 'package:album/src/authentication/domain/usecase/create_album.dart';
import 'package:album/src/authentication/domain/usecase/get_album.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'album_event.dart';
part 'album_state.dart';

class AlbumBloc extends Bloc<AlbumEvent, AlbumState> {
  final CreateAlbum _createAlbum;
  final GetAlbum _getAlbum;

  AlbumBloc({required CreateAlbum createAlbum, required GetAlbum getAlbum}) :
    _createAlbum=createAlbum,
    _getAlbum=getAlbum,
   super(const AlbumInitialstate()) {
    on<CreateAlbumEvent>(_createAlbumhandler);
    on<GetAlbumsEvent>(_getAlbumHandler);
  }


  FutureOr<void> _createAlbumhandler(CreateAlbumEvent event, Emitter<AlbumState> emit) async{
    emit(const AlbumCreatedState());
    final result=await _createAlbum(AlbumParams(title: event.title, description: event.description, url: event.url, createdAt: event.createdAt));

    result.fold((failure) => emit(AlbumErrorState(failure.errorMessage)), (_) => emit(const AlbumCreatedState()));
  }

  FutureOr<void> _getAlbumHandler(GetAlbumsEvent event, Emitter<AlbumState> emit) async{
    emit(const AlbumsLoadingState());
    final result=await _getAlbum();
    result.fold((failure) => emit(AlbumErrorState(failure.errorMessage)), (albums) =>emit(AlbumsLoadedState(albums)));
  }
}
