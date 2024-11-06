import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movia_app/core/network/api_constant.dart';
import 'package:movia_app/core/services/services_locater.dart';
import 'package:movia_app/movies/presentation/controller/bloc/bloc/movie_details_bloc.dart';
import 'package:movia_app/movies/presentation/controller/bloc/moivess_bloc.dart';
import 'package:movia_app/movies/presentation/controller/bloc/moivess_state.dart';
import 'package:movia_app/movies/presentation/screens/movie_detail_screen.dart';

class PopularMoviesSection extends StatelessWidget {
  final VoidCallback onSeeAll;

  const PopularMoviesSection({Key? key, required this.onSeeAll})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoivessBloc, MoivessState>(
      buildWhen: (previous, current) => previous is MoivessPopularSuccess != current is MoivessPopularSuccess,

      builder: (context, state) {


        if (state is MoivessPopularSuccess) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        margin: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Popular",
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.15,
                color: Colors.white,
              ),
            ),
            InkWell(
              onTap: onSeeAll,
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text('See More',
                        style: TextStyle(color: Colors.white)),
                    Icon(Icons.arrow_forward_ios,
                        size: 16.0, color: Colors.white)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      SizedBox(
        height: 170.0,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          itemCount: state.movies.length,
          itemBuilder: (context, index) {
            
            return Container(
              padding: const EdgeInsets.only(right: 8.0),
              child: InkWell(
                onTap: () {

                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    ApiConstant.imageUrl(state.movies[index].backdropPath),
                    width: 120.0,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        const Icon(Icons.error),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    ],
  );
}
else if (state is MoivessPopularFailure ){

  return Center(child: Text(state.errorMessage)) ;
}

else {
  return Center(child: CircularProgressIndicator(),) ;
}

      },
    );
  }
}
