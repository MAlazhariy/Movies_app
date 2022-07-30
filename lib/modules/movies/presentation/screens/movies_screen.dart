import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/services/services_locator.dart';
import 'package:movies/modules/movies/presentation/controller/movies_bloc.dart';
import 'package:movies/modules/movies/presentation/controller/movies_events.dart';
import 'package:movies/modules/movies/presentation/controller/movies_states.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MoviesBloc(ServicesLocator.getIt())..add(GetNowPlayingMoviesEvent()),
      child: BlocBuilder<MoviesBloc, MoviesStates>(
        builder: (context, state){
          return const Scaffold(
            body: Center(
              child: Text('Clean Architecture'),
            ),
          );
        },
      ),
    );
  }
}
