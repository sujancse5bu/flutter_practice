import 'package:flutter/material.dart';
import 'package:flutter_practice/model/movie.dart';

class MovieListView extends StatelessWidget {
  MovieListView({Key? key}) : super(key: key);

  final List<Movie> movieList = Movie.getMovies();

  final List movies = [
    'Titanic',
    'Blade Runner',
    'Rambo',
    'The Avengers',
    'Avatar',
    'I An Legend',
    '300',
    'The Wolf of Wall Street',
    'Intersteller',
    'Game of Thrones',
    'Vikings',
    'Black Panther'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Movies'),
          backgroundColor: Colors.blueGrey.shade900,
        ),
        backgroundColor: Colors.blueGrey.shade900,
        body: ListView.builder(
            itemCount: movieList.length,
            itemBuilder: (BuildContext context, int index) {
              return Stack(children: [
                movieCard(movieList[index], context),
                Positioned(
                    top: 10, child: movieImage(movieList[index].images[0]))
              ]);
              // return Card(
              //     elevation: 4.5,
              //     color: Colors.white,
              //     child: ListTile(
              //       leading: CircleAvatar(
              //         child: Container(
              //           height: 200,
              //           width: 200,
              //           decoration: BoxDecoration(
              //               image: DecorationImage(
              //                   image: NetworkImage(movieList[index].images[0]),
              //                   fit: BoxFit.cover),
              //               color: Colors.blue,
              //               borderRadius: BorderRadius.circular(15)),
              //           child: null,
              //         ),
              //       ),
              //       trailing: Text('<3'),
              //       title: Text(movieList[index].title),
              //       subtitle: Text(movieList[index].year),
              //       // onTap: () => debugPrint('MovieName: ${movies[index]}')
              //       onTap: () {
              //         Navigator.push(
              //             context,
              //             MaterialPageRoute(
              //                 builder: (context) => MovieListViewDetails(
              //                       movie: movieList[index],
              //                     )));
              //       },
              //     ));
            }));
  }

  Widget movieCard(Movie movie, BuildContext context) {
    return InkWell(
      child: Container(
        margin: const EdgeInsets.only(left: 60),
        width: MediaQuery.of(context).size.width,
        height: 120,
        child: Card(
          color: Colors.black45,
          child: Padding(
            padding: const EdgeInsets.only(
                top: 8.0, bottom: 8.0, left: 50, right: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(movie.title,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.bold)),
                    ),
                    Text(
                      'Rating: ${movie.imdbRating}/10',
                      style: mainTextStyle(),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Released: ${movie.released}',
                      style: mainTextStyle(),
                    ),
                    Text(
                      movie.runtime,
                      style: mainTextStyle(),
                    ),
                    Text(
                      movie.rated,
                      style: mainTextStyle(),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      onTap: () => {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MovieListViewDetails(
                      movie: movie,
                    )))
      },
    );
  }

  TextStyle mainTextStyle() {
    return const TextStyle(fontSize: 15, color: Colors.grey);
  }

  Widget movieImage(String imageUrl) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
              image: NetworkImage(imageUrl
                  //  ?? 'https://images-na.ssl-images-amazon.com/images/M/MV5BZjA0MWYwZTEtYzc5Yi00NGM2LTg1YTctNjY2YzQ0NDJhZDAwXkEyXkFqcGdeQXVyNDAyODU1Njc@._V1_SY1000_CR0,0,1499,1000_AL_.jpg'
                  ),
              fit: BoxFit.cover)),
    );
  }
}

// new route
class MovieListViewDetails extends StatelessWidget {
  const MovieListViewDetails({Key? key, required this.movie}) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(movie.title),
          backgroundColor: Colors.blueGrey.shade900,
        ),
        body: ListView(
          children: [
            MOvieDetailsThumbnail(thumbnail: movie.images[0]),
            MovieDetailsHeaderWithPoster(
              movie: movie,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12.0),
              child: HorizontalLine(),
            ),
            MovieDetailsCast(movie: movie),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12.0),
              child: HorizontalLine(),
            ),
            MovieDetailsExtraPosters(
              posters: movie.images,
            )
          ],
        )
        // body: Container(
        //   child: ElevatedButton(
        //     child: Text('Go Back'),
        //     onPressed: () {
        //       Navigator.pop(context);
        //     },
        //   ),
        // ),
        );
  }
}

class MOvieDetailsThumbnail extends StatelessWidget {
  const MOvieDetailsThumbnail({Key? key, required this.thumbnail})
      : super(key: key);

  final String thumbnail;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 170,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(thumbnail), fit: BoxFit.cover)),
            ),
            const Icon(
              Icons.play_circle_outline,
              size: 100,
              color: Colors.white,
            )
          ],
        ),
        Container(
          height: 60,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  // colors: [Colors.red, Colors.green],
                  colors: [Color(0x00f5f5f5), Color(0xfff5f5f5)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
        )
      ],
    );
  }
}

class MovieDetailsHeaderWithPoster extends StatelessWidget {
  const MovieDetailsHeaderWithPoster({Key? key, required this.movie})
      : super(key: key);
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 3),
      child: Row(
        children: [
          MoviePoster(poster: movie.images[1].toString()),
          SizedBox(width: 16),
          Expanded(child: MovieDetailsHeader(movie: movie))
        ],
      ),
    );
  }
}

class MoviePoster extends StatelessWidget {
  const MoviePoster({Key? key, required this.poster}) : super(key: key);
  final String poster;

  @override
  Widget build(BuildContext context) {
    var borderRadius = const BorderRadius.all(Radius.circular(10));
    return Card(
      child: ClipRRect(
        borderRadius: borderRadius,
        child: Container(
          width: MediaQuery.of(context).size.width / 4,
          height: 160,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(poster), fit: BoxFit.cover)),
        ),
      ),
    );
  }
}

class MovieDetailsHeader extends StatelessWidget {
  const MovieDetailsHeader({Key? key, required this.movie}) : super(key: key);
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${movie.year} . ${movie.genre}'.toUpperCase(),
          style:
              const TextStyle(color: Colors.cyan, fontWeight: FontWeight.w400),
        ),
        Text(
          movie.title,
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 30),
        ),
        Text.rich(TextSpan(
            style: const TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 13,
            ),
            children: [
              TextSpan(text: movie.plot),
              const TextSpan(
                  text: ' More...', style: TextStyle(color: Colors.indigo))
            ]))
      ],
    );
  }
}

class MovieDetailsCast extends StatelessWidget {
  const MovieDetailsCast({Key? key, required this.movie}) : super(key: key);
  final Movie movie;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          MovieField(field: "Cast", value: movie.actors),
          MovieField(field: "Director", value: movie.director),
          MovieField(field: "Awards", value: movie.awards),
        ],
      ),
    );
  }
}

class MovieField extends StatelessWidget {
  const MovieField({Key? key, required this.field, required this.value})
      : super(key: key);
  final String field;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('$field : ',
            style: const TextStyle(
                color: Colors.black38,
                fontSize: 12,
                fontWeight: FontWeight.w300)),
        Expanded(
            child: Text(value,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w300)))
      ],
    );
  }
}

class HorizontalLine extends StatelessWidget {
  const HorizontalLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(height: 0.5, color: Colors.grey);
  }
}

class MovieDetailsExtraPosters extends StatelessWidget {
  const MovieDetailsExtraPosters({Key? key, required this.posters})
      : super(key: key);
  final List<String> posters;
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: Text(
          'More Posters',
          style: TextStyle(fontSize: 14, color: Colors.black26),
        ),
      ),
      Container(
        height: 180,
        padding: EdgeInsets.all(8),
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: posters.length,
          separatorBuilder: (context, index) => const SizedBox(
            width: 8,
          ),
          itemBuilder: (context, index) => ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            child: Container(
              width: MediaQuery.of(context).size.width / 4,
              height: 160,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(posters[index]), fit: BoxFit.cover)),
            ),
          ),
        ),
      )
    ]);
  }
}
