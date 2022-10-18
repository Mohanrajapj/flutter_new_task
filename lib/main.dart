import 'package:api_with_cubit/repository/api_reposiitory.dart';
import 'package:api_with_cubit/screens/home/cubit/figma_fetch_cubit.dart';
import 'package:api_with_cubit/screens/home/home_page.dart';
import 'package:api_with_cubit/screens/signup/cubit/signup_cubit.dart';
import 'package:api_with_cubit/screens/signup/signup_page.dart';
import 'package:api_with_cubit/service/api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit.dart';

Future<void> main() async {
  BlocOverrides.runZoned(
    () {
      runApp(MultiBlocProvider(
        providers: [
          BlocProvider<FigmaFetchCubit>(
            create: (context) => FigmaFetchCubit(
              apiRepository: ApiRepository(
                apiService: ApiService(),
              ),
            )..fetchPostApi(),
          ),
          BlocProvider<SignupCubit>(
            create: (context) => SignupCubit()..init(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const HomePage(),
        ),
      ));
    },
    blocObserver: EchoCubitDelegate(),
  );
}
