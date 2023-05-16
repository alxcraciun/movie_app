import "dart:convert";
import "package:flutter/material.dart";
import "package:http/http.dart";

void main() {
  runApp(const MovieApp());
}

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Movie> _movies = <Movie>[];

  @override
  void initState() {
    super.initState();
    getMovies();
  }

  Future<void> getMovies() async {
    final Uri uri = Uri(
      scheme: 'https',
      host: 'yts.mx',
      pathSegments: <String>['api', 'v2', 'list_movies.json'],
      queryParameters: <String, String>{
        'page': '1',
      },
    );

    final Response response = await get(uri);
    final Map<String, dynamic> map = jsonDecode(response.body) as Map<String, dynamic>;
    final Map<String, dynamic> data = map['data'] as Map<String, dynamic>;
    final List<dynamic> movies = data['movies'] as List<dynamic>;

    for (int i = 0; i < movies.length; i++) {
      final Map<String, dynamic> movie = movies[i] as Map<String, dynamic>;
      final Movie item = Movie(
        title: movie['title'] as String,
        image: movie['medium_cover_image'] as String,
        year: movie['year'] as int,
        rating: movie['rating'] as num,
      );
      _movies.add(item);
    }
    setState(() {
      // update _titles list
      // update _images list
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GridView.builder(
        itemCount: _movies.length,
        itemBuilder: (BuildContext context, int index) {
          final Movie movie = _movies[index];
          return GridTile(
              child: Image.network(
                movie.image,
                fit: BoxFit.cover,
              ),
              footer: ColoredBox(
                color: Colors.white54,
                child: ListTile(
                  title: Text('${movie.title} (${movie.year})'),
                  subtitle: Text('${movie.rating}'),
                ),
              ));
        },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 0.69,
          crossAxisCount: 2,
        ),
      ),
    );
  }
}

class Movie {
  Movie({
    required this.title,
    required this.image,
    required this.year,
    required this.rating,
  });

  final String title;
  final String image;
  final int year;
  final num rating;
}
