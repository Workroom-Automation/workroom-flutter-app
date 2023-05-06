import 'package:flutter/material.dart';
import 'package:workroom_flutter_app/common/services/connectivity_service.dart';
import 'package:workroom_flutter_app/counter/counter.dart';
import 'package:workroom_flutter_app/l10n/l10n.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Object>(
      stream: connectionServiceSingleton.connectionChange,
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data == ConnectionStatus.good) {
          return MaterialApp(
            theme: ThemeData(
              appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
              colorScheme: ColorScheme.fromSwatch(
                accentColor: const Color(0xFF13B9FF),
              ),
            ),
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            home: const CounterPage(),
          );
        }
        return MaterialApp(
          theme: ThemeData(
            appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
            colorScheme: ColorScheme.fromSwatch(
              accentColor: const Color(0xFF13B9FF),
            ),
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
