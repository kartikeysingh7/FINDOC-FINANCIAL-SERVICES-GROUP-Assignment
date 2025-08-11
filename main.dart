import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app/bloc/auth/auth_bloc.dart';
import 'package:flutter_bloc_app/screens/home_screen.dart';
import 'package:flutter_bloc_app/screens/login_screen.dart';
import 'package:flutter_bloc_app/utils/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthBloc()),
      ],
      child: MaterialApp(
        title: 'Flutter BLoC App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'Montserrat',
        ),
        onGenerateRoute: AppRouter.generateRoute,
        initialRoute: '/login',
      ),
    );
  }
}