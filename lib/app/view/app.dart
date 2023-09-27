import 'package:flutter/material.dart';
import 'package:workroom_flutter_app/common/constants/app_colors.dart';
import 'package:workroom_flutter_app/common/services/connection_service/connection_service.dart';
import 'package:workroom_flutter_app/common/services/logger_service/logger_service.dart';
import 'package:workroom_flutter_app/common/services/navigation_service/navigation_service.dart';
import 'package:workroom_flutter_app/common/services/supertoken_service/supertoken_service.dart';
import 'package:workroom_flutter_app/core/di/injection.dart';
import 'package:workroom_flutter_app/features/authentication/auth.dart';
// import 'package:workroom_flutter_app/features/auth_screen/workroom_login.dart';
// import 'package:workroom_flutter_app/features/main_screen.dart';
import 'package:workroom_flutter_app/features/operations_screen/operations_screen.dart';
import 'package:workroom_flutter_app/features/part_status_managment/screens/part_status_managment.dart';
import 'package:workroom_flutter_app/features/quality_app/insepection_list.dart';
import 'package:workroom_flutter_app/features/quality_app/sample_list.dart';
import 'package:workroom_flutter_app/features/work_queue/work_queue.dart';
import 'package:workroom_flutter_app/l10n/l10n.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  bool isValidSession = false;
  @override
  void initState() {
    checkSessionValidity();
    super.initState();
  }

  Future<void> checkSessionValidity() async {
    final validSession = await SupertokenService.doesSessionExist();
    if (validSession) {
      setState(() {
        isValidSession = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // check for current session..
    final navigatorKey = getIt<NavigationService>().myNavigatorKey;
    return StreamBuilder<Object>(
      stream: getIt<ConnectionService>().connectionChange,
      builder: (context, snapshot) {
        return MaterialApp(
          navigatorKey: navigatorKey,
          theme: ThemeData(
            useMaterial3: true,
            scaffoldBackgroundColor: AppColors.whiteColor,
            dialogBackgroundColor: AppColors.whiteColor,
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              backgroundColor: AppColors.whiteColor,
            ),
            dialogTheme: const DialogTheme(
              backgroundColor: AppColors.whiteColor,
            ),
            // appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
            // colorScheme: ColorScheme.fromSwatch(
            //   accentColor: const Color(0xFF13B9FF),
            // ),
          ),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          // home: const HomeScreen(),
          home: const AuthScreen(),
          builder: (BuildContext context, Widget? child) {
            return SafeArea(child: child!);
          },
          routes: {
            PartStatusManagment.routeName: (context) =>
                const PartStatusManagment(),
            WorkQueuePage.routeName: (context) => const WorkQueuePage(),
            OperationsScreen.routeName: (context) => const OperationsScreen(),
            SampleList.routeName: (context) => const SampleList(),
          },
        );
        // if (snapshot.hasData && snapshot.data == ConnectionStatus.good) {

        // }
        // return MaterialApp(
        //   navigatorKey: navigatorKey,
        //   theme: ThemeData(
        //     useMaterial3: true,
        //     scaffoldBackgroundColor: AppColors.whiteColor,
        //     dialogBackgroundColor: AppColors.whiteColor,
        //     bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        //       backgroundColor: AppColors.whiteColor,
        //     ),
        //     dialogTheme: const DialogTheme(
        //       backgroundColor: AppColors.whiteColor,
        //     ),
        //     // appBarTheme:
        //     //     const AppBarTheme(color: Color.fromARGB(255, 15, 16, 16)),
        //     // colorScheme: ColorScheme.fromSwatch(
        //     //   accentColor: const Color(0xFF13B9FF),
        //     // ),
        //   ),
        //   localizationsDelegates: AppLocalizations.localizationsDelegates,
        //   supportedLocales: AppLocalizations.supportedLocales,
        //   home: Scaffold(
        //     appBar: AppBar(title: const Text('WorkRoom Automation')),
        //     body: const Center(
        //       child: CircularProgressIndicator(),
        //     ),
        //   ),
        // );
      },
    );
  }
}
