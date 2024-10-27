part of 'paggination_bloc.dart';

@immutable
abstract class PagginationEvent {}

class GetPlaygroundsEvent extends PagginationEvent {}

class LoadMorePlaygroundsEvent extends PagginationEvent {}
