class RandomAnime {
  final int mal_id;
  final String image;
  final String title;
  final String synopsis;
  final String genre;

  const RandomAnime({
    required this.mal_id,
    required this.image,
    required this.title,
    required this.synopsis,
    required this.genre,
  });

  factory RandomAnime.fromJson(Map<String,dynamic> json) {
    return RandomAnime(
      mal_id: json['mal_id'] as int, 
      image: json['image'] as String, 
      title: json['title'] as String, 
      synopsis: json['synopsis'] as String, 
      genre: json['genre'] as String,
    );
  }
}