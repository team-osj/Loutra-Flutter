import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lotura/di/di.dart';
import 'package:lotura/firebase_options.dart';
import 'package:lotura/init/fcm_init.dart';
import 'package:lotura/presentation/splash_page/ui/view/splash_page.dart';
import 'package:lotura/presentation/utils/osj_colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(statusBarColor: OSJColors.gray100),
  );
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await Hive.initFlutter();
  const platformMsg = MethodChannel('com.osj.lotura/nfc_info');
  final data = await platformMsg.invokeMethod("getNFCInfo");
  runApp(MyApp(
    blocList: await di(),
    nfcTagData: (jsonDecode(data)['index'] as int),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.blocList, required this.nfcTagData});

  final List<BlocProvider> blocList;
  final int nfcTagData;

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
            home: SplashPage(nfcTagData: nfcTagData),
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
