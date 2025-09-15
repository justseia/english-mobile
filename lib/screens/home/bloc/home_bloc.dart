import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;

import '../../../data/api/api_provider.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final ApiProvider _apiProvider = ApiProvider();

  HomeBloc() : super(FetchWordsInitial()) {
    on<FetchWords>((event, emit) async {
      emit(FetchWordsLoading());
      try {
        final http.Response response = await _apiProvider.getWords();
        final Map<String, dynamic> body = jsonDecode(response.body);

        if (response.statusCode == 200) {
          emit(FetchWordsSuccess());
        } else {
          emit(FetchWordsError(message: body['message']));
        }
      } catch (e) {
        emit(FetchWordsError(message: e.toString()));
      }
    });
  }
}
