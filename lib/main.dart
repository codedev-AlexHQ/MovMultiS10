import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Cartelera de Cine'),
        ),
        body: Column(
          children: [
            BannerCard(),
            Expanded(child: MovieList()),
          ],
        )

      ),
    );
  }
}

class MovieList extends StatelessWidget {
  final List<Movie> movies = [
  Movie(
    title: 'Indiana Jones y el dial del destino',
    genre: 'Aventura',
    description: 'Indiana Jones se embarca en una última aventura para recuperar un artefacto legendario.',
    imageUrl: 'https://lumiere-a.akamaihd.net/v1/images/02_plt_payoff_4x5_arg_484b4a65.jpeg',
  ),
  Movie(
    title: 'Deadpool y Wolverine',
    genre: 'Acción/Comedia',
    description: 'Deadpool se une a Wolverine en una misión irreverente y llena de acción.',
    imageUrl: 'https://lumiere-a.akamaihd.net/v1/images/tidalwave_payoff_poster_las_0a47c6a2.jpeg',
  ),
  Movie(
    title: 'Cruella',
    genre: 'Drama/Comedia',
    description: 'Cruella de Vil revela su historia en el mundo de la moda londinense.',
    imageUrl: 'https://lumiere-a.akamaihd.net/v1/images/outfit_domestic_teaser2_las_94429e25.jpeg',
  ),
];


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: movies.length,
      itemBuilder: (context, index) {
        return MovieCard(movie: movies[index], index: index);
      },
    );
  }
}

class Movie {
  final String title;
  final String genre;
  final String description;
  final String imageUrl;

  Movie({
    required this.title,
    required this.genre,
    required this.description,
    required this.imageUrl,
  });
}

class BannerCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(12),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(
          'assets/images/logo.png',
          fit: BoxFit.cover,
          height: 150,
          width: double.infinity,
        ),
      ),
    );
  }
}


class MovieCard extends StatelessWidget {
  final Movie movie;
  final int index;

  MovieCard({ required this.movie, required this.index });

  static const fonts = ['Jacquard', 'Roboto2', 'Alegreya'];

  @override
  Widget build(BuildContext context) {
    final family = fonts[index % fonts.length];

    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.65,
        child: Card(
          elevation: 4,
          margin: EdgeInsets.symmetric(vertical: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              // Imagen a la izquierda
              ClipRRect(
                borderRadius: BorderRadius.horizontal(left: Radius.circular(12)),
                child: Image.network(
                  movie.imageUrl,
                  height: 180,
                  width: 100,
                  fit: BoxFit.contain,
                ),
              ),

              // Texto a la derecha
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        movie.title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: family,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        movie.description,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: family,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        movie.genre,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: family,
                          fontSize: 16,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
