import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lotura/init/fcm_init.dart';
import 'package:lotura/firebase_options.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:lotura/domain/model/osj_list.dart';
import 'package:lotura/presentation/main_page/bloc/apply_bloc.dart';
import 'package:lotura/presentation/utils/osj_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lotura/domain/model/apply_response_list.dart';
import 'package:lotura/domain/repository/apply_repository.dart';
import 'package:lotura/domain/repository/laundry_repository.dart';
import 'package:lotura/data/repository/apply_repository_impl.dart';
import 'package:lotura/presentation/laundry_room_page/bloc/laundry_bloc.dart';
import 'package:lotura/data/repository/laundry_repository_impl.dart';
import 'package:lotura/presentation/splash_page/ui/view/splash_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(statusBarColor: OSJColors.gray100),
  );
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<LaundryRepository>(
            lazy: false,
            create: (context) =>
                LaundryRepositoryImpl(StreamController<OsjList>.broadcast())),
        RepositoryProvider<ApplyRepository>(
            lazy: false,
            create: (context) => ApplyRepositoryImpl(
                StreamController<ApplyResponseList>.broadcast())),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<LaundryBloc>(
              lazy: false,
              create: (context) =>
                  LaundryBloc(context.read<LaundryRepository>())),
          BlocProvider<ApplyBloc>(
              lazy: false,
              create: (context) => ApplyBloc(context.read<ApplyRepository>())),
        ],
        child: ScreenUtilInit(
          designSize: const Size(430, 932),
          builder: (context, child) {
            fcmInit(context);
            return MaterialApp(
              theme: ThemeData(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
              ),
              debugShowCheckedModeBanner: false,
              home: const SplashPage(),
            );
          },
        ),
      ),
    );
  }
}

enum Status {
  available,
  working,
  breakdown,
}

enum Machine { WASH, DRY }
