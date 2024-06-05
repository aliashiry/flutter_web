part of 'news_cubit.dart';

@immutable
sealed class NewsState {}

final class NewsInitial extends NewsState {}
 class NewsLoading extends NewsState {}
class NewsError extends NewsState {
 String? message;
 NewsError({ required this.message});
}
class NewsSuccessState extends NewsState {
 List<Articles> newsList;

 NewsSuccessState({required this.newsList});
}

