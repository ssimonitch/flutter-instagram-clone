import 'package:envied/envied.dart';

part 'env.staging.g.dart';

/// {@template env}
/// Staging Environment variables.
/// Used to access environment variables in the app.
/// {@endtemplate}
@Envied(path: '.env.staging', obfuscate: true)
abstract class EnvStaging {
  /// Supabase url secret.
  @EnviedField(varName: 'SUPABASE_URL', obfuscate: true)
  static String supabaseUrl = _EnvStaging.supabaseUrl;

  /// Supabase anon key secret.
  @EnviedField(varName: 'SUPABASE_ANON_KEY', obfuscate: true)
  static String supabaseAnonKey = _EnvStaging.supabaseAnonKey;

  /// PowerSync ulr secret.
  @EnviedField(varName: 'POWERSYNC_URL', obfuscate: true)
  static String powersyncUrl = _EnvStaging.powersyncUrl;

  /// Firebase cloud messaging server key secret.
  @EnviedField(varName: 'FCM_SERVER_KEY', obfuscate: true)
  static String fcmServerKey = _EnvStaging.fcmServerKey;

  /// iOS client id key secret.
  @EnviedField(varName: 'IOS_CLIENT_ID', obfuscate: true)
  static String iOSClientId = _EnvStaging.iOSClientId;

  /// Web client id key secret.
  @EnviedField(varName: 'WEB_CLIENT_ID', obfuscate: true)
  static String webClientId = _EnvStaging.webClientId;
}
