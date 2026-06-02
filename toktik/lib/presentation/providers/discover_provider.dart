import 'package:flutter/material.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/domain/repositories/video_posts_repository.dart';
// import 'package:toktik/infrastructure/models/local_video_model.dart';
// import 'package:toktik/shared/data/local_video_posts.dart';

class DiscoverProvider extends ChangeNotifier {
  final VideoPostsRepositoriy videosRepository;

  // TODO: Respository, DataSource

  bool initialLoading = true;
  List<VideoPost> videos = [];

  DiscoverProvider({required this.videosRepository});

  Future<void> loadNextPage() async {
    await Future.delayed(Duration(seconds: 2));

    // final List<VideoPost> newVideos = videoPosts
    //     .map(
    //       (video) => LocalVideoModel.fromJsonMap(video).toVideoPostEntity()
    //     ).toList();

    final newVideos = await videosRepository.getTrendingVideosByPage(1);

    //todo: cargar videos
    videos.addAll(newVideos);
    initialLoading = false;
    notifyListeners();
  }
}
