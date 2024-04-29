import 'package:app/di/locator.dart';
import 'package:apply_presentation/bloc/apply_bloc.dart';
import 'package:apply_presentation/ui/view/apply_page.dart';
import 'package:core/lotura_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laundry_room_presentation/bloc/laundry_bloc.dart';

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
        BlocProvider<ApplyBloc>(create: (context) => locator<ApplyBloc>()),
        BlocProvider<LaundryBloc>(create: (context) => locator<LaundryBloc>()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(430, 932),
        builder: (context, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          home: ApplyPage(),
        ),
      ),
    );
  }
}
