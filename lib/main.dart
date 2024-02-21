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
import 'package:lotura/presentation/utils/lotura_icons.dart';
import 'package:lotura/presentation/utils/osj_colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: OSJColors.gray100),
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

enum CurrentState {
  available(
      icon: LoturaIcons.checkCircle,
      color: OSJColors.green50,
      deepColor: OSJColors.green700,
      text: "사용 가능"),
  working(
      icon: LoturaIcons.working,
      color: OSJColors.primary50,
      deepColor: OSJColors.primary700,
      text: "작동중"),
  disconnected(
      icon: LoturaIcons.disconnected,
      color: OSJColors.white,
      deepColor: OSJColors.black,
      text: "연결 끊김"),
  breakdown(
      icon: LoturaIcons.cancelCircle,
      color: OSJColors.red50,
      deepColor: OSJColors.red700,
      text: "고장");

  final IconData icon;
  final Color color, deepColor;
  final String text;

  const CurrentState({
    required this.icon,
    required this.color,
    required this.deepColor,
    required this.text,
  });
}

enum Machine { wash, dry }

enum RoomLocation {
  schoolSide(roomName: "남자 학교측 세탁실"),
  dormitorySide(roomName: "남자 기숙사측 세탁실"),
  womanRoom(roomName: "여자 세탁실");

  const RoomLocation({required this.roomName});

  final String roomName;
}

enum ButtonView {
  image,
  icon;

  Widget get triangle => this == ButtonView.image
      ? const SizedBox.shrink()
      : const Icon(LoturaIcons.triangleUp, color: Colors.grey);
}
