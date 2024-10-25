class ApiConstant {

  
  static const String baseUrl = "https://api.themoviedb.org/3" ;
  static const apikey = "d60b9f804ecce3ed1cab1ae54e43ed31" ;
  
  static const nowPlayingMovie = "$baseUrl/movie/now_playing?api_key=$apikey" ; 
  static const popularMovie = "$baseUrl/movie/popular?api_key=$apikey" ; 
  static const topRatedMovie = "$baseUrl/movie/top_rated?api_key=$apikey" ; 
  static const baseImageUrl = "https://image.tmdb.org/t/p/w500" ; 
  static String imageUrl (String path) => '$baseImageUrl$path' ;

   
  
  
  
}