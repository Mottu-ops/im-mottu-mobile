import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel/di/di.dart';
import 'package:marvel/presentation/home/home.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider<GetListCharactersBloc>(
        create: (context) =>
            getIt<GetListCharactersBloc>()..add(const GetListCharacters()),
        child: const HomeView(),
      );
}
