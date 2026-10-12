import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MovieApp()));
}

class MovieApp extends StatefulWidget {
  @override
  State<MovieApp> createState() => _MovieAppState();
}

class _MovieAppState extends State<MovieApp> {
  List<String> movies = [
    'Avatar',
    'Divergent',
    'Titanic',
    '1+1',
    'Intersteller',
    'Harry Potter',
    'Spider man',
  ];

  List<String> favorites = [];

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: Text('Movie App'), backgroundColor: Colors.red),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(15.0),
            child: TextField(
              controller: searchController,
              style: TextStyle(color: Colors.white),
              onChanged: (value) {
                setState(() {});
              },
              decoration: InputDecoration(
                hintText: 'Search Movie...',
                hintStyle: TextStyle(color: Colors.white),
                prefixIcon: Icon(Icons.search, color: Colors.white),
                filled: true,
                fillColor: Colors.white12,
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: movies
                  .where(
                    (movie) => movie.toLowerCase().contains(
                      searchController.text.toLowerCase(),
                    ),
                  )
                  .map((movie) {
                    bool isFavorite = favorites.contains(movie);

                    return Card(
                      color: Colors.white24,
                      child: ListTile(
                        leading: Icon(Icons.movie, color: Colors.red, size: 35),
                        title: Text(
                          movie,
                          style: TextStyle(color: Colors.white),
                        ),
                        trailing: IconButton(
                          icon: Icon(
                            isFavorite ? Icons.favorite : Icons.favorite_border,
                            color: Colors.red,
                          ),
                          onPressed: () {
                            setState(() {
                              if (isFavorite) {
                                favorites.remove(movie);
                              } else {
                                favorites.add(movie);
                              }
                            });
                          },
                        ),
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text(movie),
                              content: Text('This is a movie details page.'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('close'),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    );
                  })
                  .toList(),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15),
            child: Text(
              'Favorites: ${favorites.length}',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
