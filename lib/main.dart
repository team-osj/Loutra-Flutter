import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lotura/di/di.dart';
import 'package:lotura/firebase_options.dart';
import 'package:lotura/init/fcm_init.dart';
import 'package:lotura/presentation/splash_page/ui/view/splash_page.dart';
import 'package:lotura/presentation/utils/osj_colors.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(statusBarColor: OSJColors.gray100),
  );
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp(blocList: di()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.blocList}) : super(key: key);
  final List<BlocProvider> blocList;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: blocList,
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
    );
  }
}

enum Status {
  available,
  working,
  disconnected,
  breakdown,
}

enum Machine { wash, dry }
