part of 'photos_bloc.dart';

enum PhotosStatus { initial, loading, success, failure }

class PhotosState extends Equatable {
  final PhotosStatus status;
  final List<Photo> photos;
  final String? errorMessage;

  const PhotosState({
    this.status = PhotosStatus.initial,
    this.photos = const [],
    this.errorMessage,
  });

  PhotosState copyWith({
    PhotosStatus? status,
    List<Photo>? photos,
    String? errorMessage,
  }) {
    return PhotosState(
      status: status ?? this.status,
      photos: photos ?? this.photos,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, photos, errorMessage];
}