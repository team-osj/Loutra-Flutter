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
import 'package:lotura/presentation/utils/lotura_colors.dart';
import 'package:lotura/presentation/utils/lotura_icons.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: LoturaColors.gray100),
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
  working(
      icon: LoturaIcons.working,
      color: LoturaColors.primary50,
      deepColor: LoturaColors.primary700,
      deviceIconColor: LoturaColors.primary400,
      text: "작동중"),
  available(
      icon: LoturaIcons.checkCircle,
      color: LoturaColors.green50,
      deepColor: LoturaColors.green700,
      deviceIconColor: LoturaColors.green400,
      text: "사용 가능"),
  disconnected(
      icon: LoturaIcons.disconnected,
      color: LoturaColors.white,
      deepColor: LoturaColors.black,
      deviceIconColor: LoturaColors.gray400,
      text: "연결 끊김"),
  breakdown(
      icon: LoturaIcons.cancelCircle,
      color: LoturaColors.red50,
      deepColor: LoturaColors.red700,
      deviceIconColor: LoturaColors.red400,
      text: "고장");

  bool get isWorking => this == CurrentState.working;
  bool get isNotWorking => this != CurrentState.working;

  bool get isAvailable => this == CurrentState.available;

  bool get isDisconnected => this == CurrentState.disconnected;

  bool get isBreakdown => this == CurrentState.breakdown;

  final IconData icon;
  final Color color, deepColor, deviceIconColor;
  final String text;

  const CurrentState({
    required this.icon,
    required this.color,
    required this.deepColor,
    required this.deviceIconColor,
    required this.text,
  });
}

enum DeviceType {
  wash(
    text: "세탁기",
    icon: LoturaIcons.laundry,
    imagePath: "assets/laundry_image.jpeg",
  ),
  dry(
    text: "건조기",
    icon: LoturaIcons.dry,
    imagePath: "assets/dry_image.jpeg",
  ),
  empty(
    text: "",
    icon: Icons.abc,
    imagePath: "",
  );

  bool get isWash => this == DeviceType.wash;

  bool get isDry => this == DeviceType.dry;

  bool get isEmpty => this == DeviceType.empty;

  final String text, imagePath;
  final IconData icon;

  const DeviceType({
    required this.text,
    required this.icon,
    required this.imagePath,
  });
}

enum Gender {
  boy(text: "남자 세탁실"),
  girl(text: "여자 세탁실");

  bool get isBoy => this == Gender.boy;

  bool get isGirl => this == Gender.girl;

  const Gender({required this.text});

  final String text;
}

enum RoomLocation {
  schoolSide(roomName: "남자 학교측 세탁실"),
  dormitorySide(roomName: "남자 기숙사측 세탁실"),
  schoolGirlSide(roomName: "여자 기숙사측 세탁실");

  bool get isSchoolSide => this == RoomLocation.schoolSide;

  bool get isDormitorySide => this == RoomLocation.dormitorySide;

  bool get isSchoolGirlSide => this == RoomLocation.schoolGirlSide;

  bool get isNotSchoolGirlSide => this != RoomLocation.schoolGirlSide;

  const RoomLocation({required this.roomName});

  final String roomName;
}

enum LaundryRoomLayer {
  first(icon: Icons.looks_one_outlined),
  second(icon: Icons.looks_two_outlined);

  bool get isFirst => this == LaundryRoomLayer.first;

  bool get isSecond => this == LaundryRoomLayer.second;

  const LaundryRoomLayer({required this.icon});

  final IconData icon;
}
