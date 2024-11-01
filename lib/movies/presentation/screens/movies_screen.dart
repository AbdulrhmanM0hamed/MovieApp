import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movia_app/core/services/services_locater.dart';
import 'package:movia_app/movies/presentation/controller/bloc/movies_bloc.dart';
import 'package:movia_app/movies/presentation/screens/widgets/now_playing_movie.dart';
import 'package:movia_app/movies/presentation/screens/widgets/popular_movie.dart';
import 'package:movia_app/movies/presentation/screens/widgets/top_rated_movie.dart';

class MainMoviesScreen extends StatelessWidget {
  const MainMoviesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<MoviesBloc>(),
      child: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const NowPlayingMovie(),
              const SizedBox(height: 8),
              PopularMoviesSection(
                onSeeAll: () {},
              ),
              TopRatedMoviesSection(
                onSeeAll: () {},
              ),
              const SizedBox(height: 50.0),
            ],
          ),
        ),
      ),
    );
  }
}
