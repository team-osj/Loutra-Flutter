import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lotura/init/fcm_init.dart';
import 'package:lotura/screen/main_page.dart';
import 'package:lotura/firebase_options.dart';
import 'package:lotura/screen/splash_page.dart';
import 'package:lotura/widget/bottom_navi.dart';
import 'package:lotura/widget/machine_card.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  fcmInit();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
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
