import 'package:env/env.dart';
import 'package:flutter/material.dart';
import 'package:flutter_instagram_clone/app/di/di.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared/shared.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GoogleSignInButton(),
              SizedBox(height: 12),
              LogOutButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class GoogleSignInButton extends StatelessWidget {
  const GoogleSignInButton({super.key});

  Future<void> _googleSignIn() async {
    final webClientId = getIt<AppFlavor>().getEnv(Env.webClientId);
    final iosClientId = getIt<AppFlavor>().getEnv(Env.iOSClientId);

    final googleSignIn =
        GoogleSignIn(clientId: iosClientId, serverClientId: webClientId);

    final googleUser = await googleSignIn.signIn();
    final googleAuth = await googleUser?.authentication;

    if (googleAuth == null) {
      throw Exception('Google sign in was canceled');
    }

    final accessToken = googleAuth.accessToken;
    final idToken = googleAuth.idToken;

    if (accessToken == null) {
      throw Exception('No access token found');
    }

    if (idToken == null) {
      throw Exception('No id token found');
    }

    await Supabase.instance.client.auth.signInWithIdToken(
      provider: OAuthProvider.google,
      idToken: idToken,
      accessToken: accessToken,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () async {
        try {
          await _googleSignIn();
        } catch (error, stackTrace) {
          logE(
            'Failed to login with Google',
            error: error,
            stackTrace: stackTrace,
          );
        }
      },
      icon: const Icon(Icons.auto_awesome),
      label: Text(
        'Google Sign In',
        style: Theme.of(context).textTheme.headlineSmall,
      ),
    );
  }
}

class LogOutButton extends StatelessWidget {
  const LogOutButton({super.key});

  Future<void> _logOut() async {
    await Supabase.instance.client.auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Supabase.instance.client.auth.onAuthStateChange,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final session = snapshot.data?.session;
          if (session == null) return const SizedBox.shrink();
          return ElevatedButton.icon(
            onPressed: _logOut,
            icon: const Icon(Icons.logout, color: Colors.red),
            label: Text(
              'Log out',
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.apply(color: Colors.red),
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
