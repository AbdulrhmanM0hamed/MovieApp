import 'package:flutter/material.dart';
import 'package:movia_app/core/network/api_constant.dart';
import 'package:movia_app/core/utils/dummy.dart';

class NowPlayingMovie extends StatelessWidget {
  const NowPlayingMovie({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: PageView.builder(
        itemCount: moviesList.length,
        itemBuilder: (context, index) {
          final movie = moviesList[index];
          return GestureDetector(
            onTap: () {},
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(ApiConstant.imageUrl(movie.backdropPath)),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 150,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.transparent, Colors.black.withOpacity(0.8)],
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.circle, color: Colors.redAccent, size: 16.0),
                            const SizedBox(width: 4.0),
                            Text(
                              'Now Playing'.toUpperCase(),
                              style: const TextStyle(color: Colors.white, fontSize: 16.0),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: Text(
                          movie.title,
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 24, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
