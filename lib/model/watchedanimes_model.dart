class WatchedAnimes {
  String id;
  String animeWatched;
  String date;

  WatchedAnimes({
    required this.id, 
    required this.animeWatched, 
    required this.date
  });

  factory WatchedAnimes.fromJson(Map<String,dynamic> json){
    return WatchedAnimes(
      id: json['id'], 
      animeWatched: json['animeWatched'], 
      date: json['date']
    );
  }
}