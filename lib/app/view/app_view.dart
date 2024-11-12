import 'package:env/env.dart';
import 'package:flutter/material.dart';
import 'package:flutter_instagram_clone/l10n/l10n.dart';
import 'package:get_it/get_it.dart';
import 'package:shared/shared.dart';

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        useMaterial3: true,
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: SafeArea(
        child: Scaffold(
          body: Text(
            'Hello ${GetIt.instance.get<AppFlavor>().getEnv(Env.iOSClientId)}',
          ),
        ),
      ),
    );
  }
}
