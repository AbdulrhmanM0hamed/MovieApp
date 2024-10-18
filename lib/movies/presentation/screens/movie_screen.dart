import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movia_app/movies/presentation/controller/bloc/movies_bloc.dart';

class MovieScreen extends StatelessWidget {
  const MovieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return MoviesBloc()..add(GetNowPlayingMoviesEvent());
      },
      child: BlocBuilder<MoviesBloc,MoviesState>(
        builder: (context, state) {
          print(state);
          return Scaffold();
        },
      ),
    );
  }
}
