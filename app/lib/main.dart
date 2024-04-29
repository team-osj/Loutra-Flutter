import 'package:app/di/locator.dart';
import 'package:apply_presentation/bloc/apply_bloc.dart';
import 'package:apply_presentation/bloc/apply_event.dart';
import 'package:core/lotura_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laundry_room_presentation/bloc/laundry_bloc.dart';
import 'package:laundry_room_presentation/bloc/laundry_event.dart';
import 'package:notice_presentation/bloc/notice_bloc.dart';
import 'package:notice_presentation/bloc/notice_event.dart';
import 'package:utils/bottom_navi.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initLocator();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: LoturaColors.gray100),
  );
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ApplyBloc>(
            create: (context) =>
                locator<ApplyBloc>()..add(GetApplyListEvent())),
        BlocProvider<LaundryBloc>(
            create: (context) => locator<LaundryBloc>()
              ..add(GetAllLaundryListEvent())
              ..add(GetLaundryEvent())),
        BlocProvider<NoticeBloc>(
            create: (context) => locator<NoticeBloc>()..add(GetNoticeEvent())),
      ],
      child: ScreenUtilInit(
        designSize: const Size(430, 932),
        builder: (context, child) => const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: BottomNavi(),
        ),
      ),
    );
  }
}
