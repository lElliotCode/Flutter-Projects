import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/presentation/providers/actors/actors_repository_provider.dart';
import 'package:flutter_riverpod/legacy.dart';

final actorsByMovieProvider =
    StateNotifierProvider<ActorsByMovieNotifier, Map<String, List<Actor>>>((
      ref,
    ) {
      final fetchActors = ref.watch(actorsRepositoryProvider).getActorByMovie;

      return ActorsByMovieNotifier(getActors: fetchActors);
    });

typedef GetActorsCb = Future<List<Actor>> Function(String movieId);

class ActorsByMovieNotifier extends StateNotifier<Map<String, List<Actor>>> {
  bool isLoading = false;
  final GetActorsCb getActors;

  ActorsByMovieNotifier({required this.getActors}) : super({});

  Future<void> loadActors(String movieId) async {
    if (state[movieId] != null) return;
    final List<Actor> actors = await getActors(movieId);

    state = {...state, movieId: actors};

    isLoading = false;
  }
}
