import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mottu_marvel/app/core/di/injection_container.dart';
import 'package:mottu_marvel/app/core/routes/app_router.dart';
import 'package:mottu_marvel/app/core/routes/constants_routes.dart';
import 'package:mottu_marvel/app/core/utils/global_keys.dart';
import 'package:mottu_marvel/app/core/theme/app_colors.dart';

import 'home/bloc/home_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeBloc>(
          create: (_) => sl<HomeBloc>()..add(const GetCharactersEvent()),
        ),
      ],
      child: MaterialApp(
        title: 'Mottu Marvel',
        scaffoldMessengerKey: rootScaffoldMessengerKey,
        theme: ThemeData(
          primaryColor: AppColors.primary,
          fontFamily: 'Roboto',
        ),
        debugShowCheckedModeBanner: false,
        routes: AppRouter.routes,
        initialRoute: INITIAL_ROUTE,
      ),
    );
  }
}
