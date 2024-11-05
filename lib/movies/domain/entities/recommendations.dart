import 'package:equatable/equatable.dart';

class Recommendations  extends Equatable{
  final String backdrop_path ;
  final int id ;

const  Recommendations({required this.backdrop_path, required this.id});
  
  @override
  // TODO: implement props
  List<Object?> get props => [backdrop_path,id]; 
  
  
}