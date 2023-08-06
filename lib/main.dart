import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lotura/data/repository/osj_repository.dart';
import 'package:lotura/domain/model/osj_list.dart';
import 'package:lotura/init/fcm_init.dart';
import 'package:lotura/firebase_options.dart';
import 'package:lotura/presentation/splash_page/bloc/osj_bloc.dart';
import 'package:lotura/presentation/splash_page/ui/view/splash_page.dart';
import 'package:lotura/presentation/utils/osj_colors.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  fcmInit();
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
    return RepositoryProvider(
      lazy: false,
      create: (context) => OSJRepository(StreamController<OsjList>.broadcast()),
      child: BlocProvider(
        lazy: false,
        create: (context) => OSJBloc(context.read<OSJRepository>()),
        child: ScreenUtilInit(
          designSize: const Size(430, 932),
          builder: (context, child) {
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

// class TestPage extends StatelessWidget {
//   const TestPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey,
//       body: Center(
//         child: MachineCard(
//           index: 1,
//           machine: Machine.laundryMachine,
//           status: Status.available,
//         ),
//       ),
//     );
//   }
// }
