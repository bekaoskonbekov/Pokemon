import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokemon/providers/shared_preference.dart';
import 'package:pokemon/providers/theme_mode.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '/router.dart';
import 'constants/constant.dart';
import 'constants/enum/theme_mode.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sharedPreference = await SharedPreferences.getInstance();

  ThemeMode defaultThemeMode = themeModeFromString(
      sharedPreference.getString(SHARED_PREFERENCE_KEY_THEME_MODE));

  runApp(ProviderScope(
    overrides: [
      sharedPreferencesProvider.overrideWithValue(sharedPreference),
      themeModeProvider.overrideWith((ref) {
        return defaultThemeMode;
      }),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    return MaterialApp.router(
      title: 'Pokemon Flutter',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: themeMode,
      routerConfig: router,
    );
  }
}
