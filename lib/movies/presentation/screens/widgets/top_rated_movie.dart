import 'package:flutter/material.dart';
import 'package:movia_app/core/network/api_constant.dart';
import 'package:movia_app/core/utils/dummy.dart';

class TopRatedMoviesSection extends StatelessWidget {
  final VoidCallback onSeeAll;

  const TopRatedMoviesSection({Key? key, required this.onSeeAll}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Top Rated",
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
                      Text('See More', style: TextStyle(color: Colors.white)),
                      Icon(Icons.arrow_forward_ios, size: 16.0, color: Colors.white)
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
            itemCount: moviesList.length,
            itemBuilder: (context, index) {
              final movie = moviesList[index];
              return Container(
                padding: const EdgeInsets.only(right: 8.0),
                child: InkWell(
                  onTap: () {},
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      ApiConstant.imageUrl(movie.backdropPath),
                      width: 120.0,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => const Icon(Icons.error),
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
}
