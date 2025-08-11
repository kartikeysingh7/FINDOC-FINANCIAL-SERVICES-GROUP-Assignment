import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app/api/api_client.dart';
import 'package:flutter_bloc_app/bloc/auth/auth_bloc.dart';
import 'package:flutter_bloc_app/bloc/auth/auth_event.dart';
import 'package:flutter_bloc_app/bloc/photos/photos_bloc.dart';
import 'package:flutter_bloc_app/bloc/photos/photos_event.dart';
import 'package:flutter_bloc_app/models/photo.dart';
import 'package:flutter_bloc_app/utils/constants.dart';
import 'package:flutter_bloc_app/widgets/photo_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PhotosBloc(
            apiClient: ApiClient(httpClient: context.read()),
          )..add(FetchPhotosEvent()),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text(AppConstants.homeTitle),
          actions: [
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () {
                context.read<AuthBloc>().add(LogoutEvent());
                Navigator.pushReplacementNamed(context, '/login');
              },
            ),
          ],
        ),
        body: BlocBuilder<PhotosBloc, PhotosState>(
          builder: (context, state) {
            if (state.status == PhotosStatus.loading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state.status == PhotosStatus.failure) {
              return Center(child: Text(state.errorMessage!));
            } else if (state.status == PhotosStatus.success) {
              return _PhotosList(photos: state.photos);
            } else {
              return const Center(child: Text('No photos available'));
            }
          },
        ),
      ),
    );
  }
}

class _PhotosList extends StatelessWidget {
  final List<Photo> photos;

  const _PhotosList({required this.photos});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return ListView.builder(
      itemCount: photos.length,
      itemBuilder: (context, index) {
        return PhotoItem(
          photo: photos[index],
          width: width - 32, // accounting for padding
        );
      },
    );
  }
}