import 'package:coffee_api/features/auth/representation/view/signin.dart';
import 'package:coffee_api/features/auth/representation/view/signup.dart';
import 'package:coffee_api/features/coffee_detail/representation/viewmodel/cubit/button_cubit.dart';
import 'package:coffee_api/features/home/presentation/view/hom1.dart';
import 'package:coffee_api/features/home/presentation/viewmodel/cubit/home_cubit.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/auth/representation/viewmodel/cubit/signin_cubit/signin_cubit.dart';
import 'features/auth/representation/viewmodel/cubit/signup_cubit/signup_cubit.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  FirebaseAnalyticsObserver observer =
      FirebaseAnalyticsObserver(analytics: analytics);

  runApp(MyApp(analytics: analytics, observer: observer));
}

class MyApp extends StatelessWidget {
  final FirebaseAnalytics analytics;
  final FirebaseAnalyticsObserver observer;

  MyApp({required this.analytics, required this.observer});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ButtonCubit()),
        BlocProvider(create: (context) => HomeCubit()),
        BlocProvider(create: (context) => SignInCubit()),
        BlocProvider(create: (context) => SignUpCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
        navigatorObservers: [observer],
      ),
    );
  }
}
