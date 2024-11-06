import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movia_app/core/network/api_constant.dart';
import 'package:movia_app/core/services/services_locater.dart';
import 'package:movia_app/movies/presentation/controller/bloc/bloc/movie_details_bloc.dart';

class MovieDetailScreen extends StatelessWidget {
  const MovieDetailScreen({super.key, required this.id});
  final int id;
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1E1E29),
      body: SingleChildScrollView(
        child: BlocProvider<MovieDetailsBloc>(
          create: (context) => sl<MovieDetailsBloc>()..add(GetDetailsEvent(id)),
          child: BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
              builder: (context, state) {
            if (state is MovieDetailsLoading) {
              return SizedBox(height: 300 , child: const Center(child: CircularProgressIndicator()));
            } else if (state is MovieDetailsSuccess) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Image.network(
                        ApiConstant.imageUrl(state.detials.poster_path,),
                        fit: BoxFit.fill,
                        height: 320,
                        width: double.infinity,
                      ),
                      Positioned(
                        top: 40,
                        left: 16,
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.arrow_back_ios,
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 14),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          state.detials.title,
                          style: TextStyle(
                            letterSpacing: 1.8,
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * .009),
                        Row(
                          children: [
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 6),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade700,
                                borderRadius: BorderRadius.circular(2),
                              ),
                              child: Text(
                                state.detials.release_date,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Row(
                              children: [
                                Icon(Icons.star,
                                    color: Colors.yellow, size: 16),
                                SizedBox(width: 4),
                                Text(
                                  state.detials.vote_average,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(width: 8),
                            Text(
                              getYear(state.detials
                                  .release_date), // This will display only the year
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          "Overview",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          state.detials.overview,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white70,
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          "Genres",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Wrap(
                          spacing: 8,
                          children: state.detials.genres.map((genre) {
                            return Chip(
                              label: Text(genre.name),
                              backgroundColor: Colors.grey.shade700,
                              labelStyle: const TextStyle(color: Colors.white),
                            );
                          }).toList(),
                        ),
                        const SizedBox(height: 14),
                        const Text(
                          "MORE LIKE THIS",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            } else {
              return const Text('Error: Unexpected state');
            }
          }),
        ),
      ),
    );
  }
}

String getYear(String date) {
  try {
    DateTime parsedDate = DateTime.parse(date);
    return parsedDate.year.toString(); // Extract the year as a string
  } catch (e) {
    return "Unknown";
  }
}
