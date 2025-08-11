import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_app/api/api_client.dart';
import 'package:flutter_bloc_app/api/api_exceptions.dart';
import 'package:flutter_bloc_app/models/photo.dart';

part 'photos_event.dart';
part 'photos_state.dart';

class PhotosBloc extends Bloc<PhotosEvent, PhotosState> {
  final ApiClient apiClient;

  PhotosBloc({required this.apiClient}) : super(const PhotosState()) {
    on<FetchPhotosEvent>(_onFetchPhotos);
  }

  Future<void> _onFetchPhotos(
      FetchPhotosEvent event, Emitter<PhotosState> emit) async {
    emit(state.copyWith(status: PhotosStatus.loading));

    try {
      final photos = await apiClient.fetchPhotos(10);
      emit(state.copyWith(status: PhotosStatus.success, photos: photos));
    } on ApiException catch (e) {
      emit(state.copyWith(
        status: PhotosStatus.failure,
        errorMessage: e.message,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: PhotosStatus.failure,
        errorMessage: 'Failed to fetch photos',
      ));
    }
  }
}