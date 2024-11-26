// ignore_for_file: public_member_api_docs

import 'package:env/env.dart';

/// Flavor
enum Flavor {
  development,
  staging,
  production,
}

sealed class AppEnv {
  const AppEnv();

  String getEnv(Env env);
}

class AppFlavor extends AppEnv {
  const AppFlavor._({required this.flavor});

  factory AppFlavor.development() => const AppFlavor._(
        flavor: Flavor.development,
      );
  factory AppFlavor.staging() => const AppFlavor._(
        flavor: Flavor.staging,
      );
  factory AppFlavor.production() => const AppFlavor._(
        flavor: Flavor.production,
      );

  final Flavor flavor;

  @override
  String getEnv(Env env) => switch (env) {
        Env.supabaseUrl => switch (flavor) {
            Flavor.development => EnvDev.supabaseUrl,
            Flavor.production => EnvProd.supabaseUrl,
            Flavor.staging => EnvStaging.supabaseUrl,
          },
        Env.powerSyncUrl => switch (flavor) {
            Flavor.development => EnvDev.powersyncUrl,
            Flavor.production => EnvProd.powersyncUrl,
            Flavor.staging => EnvStaging.powersyncUrl,
          },
        Env.supabaseAnonKey => switch (flavor) {
            Flavor.development => EnvDev.supabaseAnonKey,
            Flavor.production => EnvProd.supabaseAnonKey,
            Flavor.staging => EnvStaging.supabaseAnonKey,
          },
        Env.fcmServerKey => switch (flavor) {
            Flavor.development => EnvDev.fcmServerKey,
            Flavor.production => EnvProd.fcmServerKey,
            Flavor.staging => EnvStaging.fcmServerKey,
          },
        Env.iOSClientId => switch (flavor) {
            Flavor.development => EnvDev.iOSClientId,
            Flavor.production => EnvProd.iOSClientId,
            Flavor.staging => EnvStaging.iOSClientId,
          },
        Env.webClientId => switch (flavor) {
            Flavor.development => EnvDev.webClientId,
            Flavor.production => EnvProd.webClientId,
            Flavor.staging => EnvStaging.webClientId,
          }
      };
}
