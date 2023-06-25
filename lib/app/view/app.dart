import 'package:flutter/material.dart';
import 'package:workroom_flutter_app/common/constants/app_colors.dart';
import 'package:workroom_flutter_app/common/services/connection_service/connection_service.dart';
import 'package:workroom_flutter_app/common/services/navigation_service/navigation_service.dart';
import 'package:workroom_flutter_app/core/di/injection.dart';
import 'package:workroom_flutter_app/features/main_screen.dart';
import 'package:workroom_flutter_app/features/part_status_managment/screens/part_status_managment.dart';
import 'package:workroom_flutter_app/features/work_queue/work_queue.dart';
import 'package:workroom_flutter_app/l10n/l10n.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final navigatorKey = getIt<NavigationService>().myNavigatorKey;
    return StreamBuilder<Object>(
      stream: getIt<ConnectionService>().connectionChange,
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data == ConnectionStatus.good) {
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
            home: const MainScreen(),
            builder: (BuildContext context, Widget? child) {
              return SafeArea(child: child!);
            },
            routes: {
              PartStatusManagment.routeName: (context) =>
                  const PartStatusManagment(),
              WorkQueuePage.routeName: (context) => const WorkQueuePage(),
            },
          );
        }
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
            // appBarTheme:
            //     const AppBarTheme(color: Color.fromARGB(255, 15, 16, 16)),
            // colorScheme: ColorScheme.fromSwatch(
            //   accentColor: const Color(0xFF13B9FF),
            // ),
          ),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: Scaffold(
            appBar: AppBar(title: const Text('WorkRoom Automation')),
            body: const Center(
              child: CircularProgressIndicator(),
            ),
          ),
        );
      },
    );
  }
}
