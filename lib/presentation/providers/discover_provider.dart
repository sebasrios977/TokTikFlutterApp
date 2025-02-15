import 'package:flutter/material.dart';
import 'package:toktik/domain/repositories/video_posts_repository.dart';


import '../../domain/entities/video_post.dart';

class DiscoverProvider extends ChangeNotifier {
  
  
  final VideoPostsRepository videoPostsRepository;


  bool initialLoading = true;
  List<VideoPost> videos = [];

  DiscoverProvider({
    required this.videoPostsRepository
  });

  Future<void> loadNextPage() async {
    // final List<VideoPost> newVideos = videoPosts.map( 
    //   (video) => LocalVideoModel.fromJsonMap(video).toVideoPostEntity() 
    // ).toList();

    final newVideos = await videoPostsRepository.getTrendingVideosByPage(1);
    
    videos.addAll(newVideos);
    initialLoading = false;
    notifyListeners();
  }
}