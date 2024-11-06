import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movia_app/movies/domain/entities/detials.dart';
import 'package:movia_app/movies/domain/usecases/get_movie_detials.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final GetMovieDetialsUseCase getMovieDetialsUseCase;

  MovieDetailsBloc(this.getMovieDetialsUseCase) : super(MovieDetailsInitial()) {
    on<GetDetailsEvent>((event, emit) async {
      try {
        print("Fetching movie details for movieId: ${event.movieId}");
        emit(MovieDetailsLoading());

        // محاولة الحصول على التفاصيل
        final result = await getMovieDetialsUseCase(event.movieId);

        result.fold(
          (failure) {
            print("Error fetching movie details: ${failure.errMessage}");
            emit(MovieDetailsFailure(errMessage: failure.errMessage));
          },
          (details) {
            print("Movie details fetched successfully");
            emit(MovieDetailsSuccess(detials: details));
          },
        );
      } catch (e) {
        // التعامل مع أي أخطاء غير متوقعة قد تحدث أثناء التنفيذ
        print("Unexpected error: $e");
        emit(MovieDetailsFailure(errMessage: "Unexpected error: $e"));
      }
    });
  }
}
