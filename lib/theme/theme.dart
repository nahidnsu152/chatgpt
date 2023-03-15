import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../application/local_storage/storage_handler.dart';
import '../utils/utils.dart';

final themeProvider = ChangeNotifierProvider<ThemeController>((ref) {
  final database = ref.watch(databaseService);
  return ThemeController(database);
});

class ThemeController with ChangeNotifier {
  ThemeController(this._database);

  late final DatabaseService _database;

  String get theme => _database.savedTheme;

  void toggle(bool mode) {
    (mode)
        ? _database.toggleSaveTheme("dark")
        : _database.toggleSaveTheme("light");
    notifyListeners();
  }
}

//** DATABASE CLASS */
final databaseService = Provider<DatabaseService>((ref) {
  return DatabaseService(ref);
});

class DatabaseService {
  final Ref ref;

  DatabaseService(this.ref) {
    initTheme();
  }

  get savedTheme => ref.watch(hiveProvider).get(KStrings.theme);

  void initTheme() {
    ref.watch(hiveProvider).put(KStrings.theme, 'light');
  }

  void toggleSaveTheme(String mode) =>
      ref.watch(hiveProvider).put(KStrings.theme, mode);
}

class MyTheme {
  static final lightTheme = FlexThemeData.light(
    colors: const FlexSchemeColor(
      primary: Color(0xff00296b),
      primaryContainer: Color(0xffa0c2ed),
      secondary: Color(0xffd26900),
      secondaryContainer: Color(0xffffd270),
      tertiary: Color(0xff5c5c95),
      tertiaryContainer: Color(0xffc8dbf8),
      appBarColor: Color(0xffc8dcf8),
      error: null,
    ),
    surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
    blendLevel: 20,
    appBarOpacity: 0.95,
    subThemesData: const FlexSubThemesData(
      blendOnLevel: 20,
      blendOnColors: false,
      thinBorderWidth: 1.0,
      thickBorderWidth: 1.0,
      textButtonRadius: 10.0,
      elevatedButtonRadius: 10.0,
      outlinedButtonRadius: 10.0,
      switchSchemeColor: SchemeColor.primary,
      fabUseShape: true,
      fabSchemeColor: SchemeColor.primary,
      cardRadius: 10.0,
    ),
    useMaterial3ErrorColors: true,
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    fontFamily: GoogleFonts.roboto().fontFamily,
    //fontFamily: "baiJamjuree",
  );

  static final darkTheme = FlexThemeData.dark(
    colors: const FlexSchemeColor(
      primary: Color(0xffb1cff5),
      primaryContainer: Color(0xff3873ba),
      secondary: Color(0xffffd270),
      secondaryContainer: Color(0xffd26900),
      tertiary: Color(0xffc9cbfc),
      tertiaryContainer: Color(0xff535393),
      appBarColor: Color(0xff00102b),
      error: null,
    ),
    surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
    blendLevel: 15,
    appBarOpacity: 0.90,
    subThemesData: const FlexSubThemesData(
      blendOnLevel: 30,
      thinBorderWidth: 1.0,
      thickBorderWidth: 1.0,
      textButtonRadius: 10.0,
      elevatedButtonRadius: 10.0,
      outlinedButtonRadius: 10.0,
      switchSchemeColor: SchemeColor.primary,
      fabUseShape: true,
      fabSchemeColor: SchemeColor.primary,
      cardRadius: 10.0,
    ),
    useMaterial3ErrorColors: true,
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    fontFamily: GoogleFonts.roboto().fontFamily,
    //fontFamily: "baiJamjuree",
  );
// If you do not have a themeMode switch, uncomment this line
// to let the device system mode control the theme mode:
// themeMode: ThemeMode.system,
}
