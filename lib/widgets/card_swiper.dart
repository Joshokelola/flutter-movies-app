import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:peliculas/models/movie.dart';

//This is the part of the ui that allows card swiping.
class CardSwiper extends StatelessWidget {
  final List<Movie> movies;
  const CardSwiper({Key? key, required this.movies}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    if (movies.isEmpty) {
      return SizedBox(
        width: double.infinity,
        height: size.height * 0.5,
        child: const Center(child: CircularProgressIndicator()),
      );
    }
    return SizedBox(
      width: double.infinity,
      height: size.height * 0.5,
      child: Swiper(
        itemCount: movies.length,
        layout: SwiperLayout.STACK,
        itemWidth: size.width * 0.6,
        itemHeight: size.height * 0.4,
        itemBuilder: (context, index) {
          final movie = movies[index];
          // movie.heroId = 'swiper-${movie.id}';
          movie.heroId = UniqueKey().toString();
          return GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'details',
                arguments: movies[index]),
            child: Hero(
              tag: movie.heroId!,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: FadeInImage(
                    fit: BoxFit.cover,
                    placeholder: const AssetImage('assets/no-image.jpg'),
                    image: NetworkImage(movies[index].fullPosterImg)),
              ),
            ),
          );
        },
      ),
    );
  }
}
