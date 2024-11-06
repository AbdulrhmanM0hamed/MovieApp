import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:movia_app/movies/domain/entities/genres.dart';

class Detials  extends Equatable{
  final String poster_path ; 
  final int id ; 
  final String title ;
  final String overview ; 
  final String vote_average ; 
  final int runtime ;
  final List<Genres> genres;
  final String release_date ; 

 const Detials({ required this.release_date, required this.poster_path, required this.id, required this.title, required this.overview, required this.vote_average, required this.runtime, required this.genres}); 


  @override
  List<Object?> get props => [
    release_date,
    poster_path, 
    id, 
    title,
    overview,
    vote_average,
    runtime,
    genres
    
  ] ;
}