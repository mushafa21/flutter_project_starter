import 'package:flutter/material.dart';
import 'package:flutter_project_starter/presentation/resources/values/typography.dart';
import 'color.dart';
import 'dimension.dart';

class AppTheme {
  // Settings Light Theme
  static ThemeData get light {
    return ThemeData(
        fontFamily: "Satoshi",
        useMaterial3: true,
        colorScheme: const ColorScheme(
            brightness: Brightness.light,
            primary: primary500Color,
            onPrimary: light1Color,
            primaryContainer: primary500Color,
            onPrimaryContainer: light1Color,
            secondary: primary500Color,
            onSecondary: light1Color,
            secondaryContainer: primary500Color,
            onSecondaryContainer: light1Color,
            error: primary500Color,
            onError: light1Color,
            surface: light1Color,
            onSurface: neutral400Color,
            surfaceBright: light2Color,
            onSurfaceVariant: neutral500Color),
        textTheme: TextTheme(
          displayLarge: heading1Bold.copyWith(color: titleColor),
          displayMedium: heading2Bold.copyWith(color: titleColor),
          displaySmall: heading3Bold.copyWith(color: titleColor),
          headlineLarge: largeBold.copyWith(color: titleColor),
          headlineMedium: normalBold.copyWith(color: titleColor),
          headlineSmall: smallBold.copyWith(color: titleColor),
          titleLarge: normalMedium.copyWith(color: titleColor),
          titleMedium: normalMedium.copyWith(color: titleColor),
          titleSmall: xSmallMedium.copyWith(color: titleColor),
          bodyLarge: largeRegular.copyWith(color: titleColor),
          bodyMedium: normalRegular.copyWith(color: titleColor),
          bodySmall: smallRegular.copyWith(color: titleColor),
          labelLarge: normalRegular.copyWith(color: titleColor),
          labelMedium: smallRegular.copyWith(color: titleColor),
          labelSmall: xSmallRegular.copyWith(color: titleColor),
        ),
        checkboxTheme: _checkboxThemeData,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: _appBarThemeLight,
        inputDecorationTheme: _inputDecorationThemeLight,
        outlinedButtonTheme: _outlinedButtonThemeDataLight,
        elevatedButtonTheme: _elevatedButtonThemeData,
        scaffoldBackgroundColor: light1Color,
        textButtonTheme: _textButtonThemeData,
        iconButtonTheme: _iconButtonThemeData,
        chipTheme: _chipThemeData,
        bottomSheetTheme: _bottomSheetThemeData,
        radioTheme: _radioTheme,
        floatingActionButtonTheme: _floatingActionButtonThemeData,
        listTileTheme: _listTileThemeData,
        switchTheme: _switchThemeData
      /*searchBarTheme: _searchBarThemeData,
      searchViewTheme: _searchViewThemeData,*/
    );
  }

  static ThemeData get dark {
    return ThemeData(
        fontFamily: "Satoshi",
        useMaterial3: true,
        colorScheme: const ColorScheme(
          brightness: Brightness.dark,
          primary: primary500Color,
          onPrimary: dark1Color,
          primaryContainer: primary500Color,
          onPrimaryContainer: dark1Color,
          secondary: primary500Color,
          onSecondary: dark1Color,
          secondaryContainer: primary500Color,
          onSecondaryContainer: dark1Color,
          error: primary500Color,
          onError: dark1Color,
          surface: dark1Color,
          onSurface: whiteColor,
          surfaceBright: dark2Color,
          onSurfaceVariant: whiteColor,
        ),
        textTheme: TextTheme(
          displayLarge: heading1Bold.copyWith(color: neutral50Color),
          displayMedium: heading2Bold.copyWith(color: neutral50Color),
          displaySmall: heading3Bold.copyWith(color: neutral50Color),
          headlineLarge: largeBold.copyWith(color: neutral50Color),
          headlineMedium: normalBold.copyWith(color: neutral50Color),
          headlineSmall: smallBold.copyWith(color: neutral50Color),
          titleLarge: normalMedium.copyWith(color: neutral50Color),
          titleMedium: normalMedium.copyWith(color: neutral50Color),
          titleSmall: xSmallMedium.copyWith(color: neutral50Color),
          bodyLarge: largeRegular.copyWith(color: neutral50Color),
          bodyMedium: normalRegular.copyWith(color: neutral50Color),
          bodySmall: smallRegular.copyWith(color: neutral50Color),
          labelLarge: normalRegular.copyWith(color: neutral50Color),
          labelMedium: smallRegular.copyWith(color: neutral50Color),
          labelSmall: xSmallRegular.copyWith(color: neutral50Color),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: _appBarThemeDark,
        inputDecorationTheme: _inputDecorationThemeDark,
        outlinedButtonTheme: _outlinedButtonThemeDataDark,
        elevatedButtonTheme: _elevatedButtonThemeData,
        scaffoldBackgroundColor: dark1Color,
        textButtonTheme: _textButtonThemeData,
        iconButtonTheme: _iconButtonThemeData,
        chipTheme: _chipThemeData,
        bottomSheetTheme: _bottomSheetThemeData,
        radioTheme: _radioTheme,
        floatingActionButtonTheme: _floatingActionButtonThemeData,
        listTileTheme: _listTileThemeData,
        checkboxTheme: _checkboxThemeData,
        switchTheme: _switchThemeData
      /*searchBarTheme: _searchBarThemeData,
      searchViewTheme: _searchViewThemeData,*/
    );
  }




  static final AppBarTheme _appBarThemeLight = AppBarTheme(
      backgroundColor: light1Color,
      elevation: 0,
      titleTextStyle: largeBold.copyWith(color: neutral500Color),
      centerTitle: true,
      scrolledUnderElevation: 0);

  static const AppBarTheme _appBarThemeDark = AppBarTheme(
      titleSpacing: screenPadding,
      backgroundColor: dark1Color,
      elevation: 0,
      titleTextStyle: largeBold,
      centerTitle: true,
      scrolledUnderElevation: 0);

  static final SwitchThemeData _switchThemeData = SwitchThemeData(
      trackOutlineColor: WidgetStateProperty.resolveWith(
            (final Set<WidgetState> states) {
          if (states.contains(WidgetState.selected)) {
            return primary500Color;
          }
          return neutral100Color;
        },
      ),
      trackColor: WidgetStateProperty.resolveWith(
            (final Set<WidgetState> states) {
          if (states.contains(WidgetState.selected)) {
            return primary500Color;
          }
          return neutral100Color;
        },
      ),
      thumbColor: WidgetStatePropertyAll(whiteColor));

  static const RadioThemeData _radioTheme = RadioThemeData(
    fillColor: WidgetStatePropertyAll<Color>(primary500Color),
  );

  static final InputDecorationTheme _inputDecorationThemeLight =
  InputDecorationTheme(
      hintStyle: smallRegular,
      labelStyle: xSmallRegular,
      counterStyle: xSmallMedium.copyWith(color: descriptionColor),
      floatingLabelBehavior: FloatingLabelBehavior.always,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: spacing6,
        vertical: spacing4,
      ),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radiusM),
          borderSide: const BorderSide(
            color: neutral200Color,
          )),
      focusColor: primary50Color,
      disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radiusM),
          borderSide: const BorderSide(color: neutral200Color)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radiusM),
          borderSide: const BorderSide(color: neutral200Color)),
      focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radiusM),
          borderSide: const BorderSide(color: primary500Color)),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radiusM),
          borderSide: const BorderSide(color: primary500Color)));

  static final InputDecorationTheme _inputDecorationThemeDark =
  InputDecorationTheme(
      hintStyle: smallRegular.copyWith(color: neutral50Color),
      labelStyle: xSmallRegular.copyWith(color: neutral50Color),
      counterStyle: xSmallMedium.copyWith(color: neutral50Color),
      floatingLabelBehavior: FloatingLabelBehavior.always,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: spacing6,
        vertical: spacing4,
      ),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radiusM),
          borderSide: const BorderSide(
            color: neutral200Color,
          )),
      focusColor: primary50Color,
      disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radiusM),
          borderSide: const BorderSide(color: neutral200Color)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radiusM),
          borderSide: const BorderSide(color: neutral200Color)),
      focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radiusM),
          borderSide: const BorderSide(color: primary500Color)),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radiusM),
          borderSide: const BorderSide(color: primary500Color)));

  static final ListTileThemeData _listTileThemeData = ListTileThemeData(
    // tileColor: light1Color,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radiusS)),
    titleTextStyle: smallBold,
    textColor: titleColor,
  );

  static final OutlinedButtonThemeData _outlinedButtonThemeDataLight =
  OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: titleColor,
        textStyle: largeBold,
        padding:
        const EdgeInsets.symmetric(horizontal: spacing4, vertical: spacing4),
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(radiusXxl)),
        side: const BorderSide(
          color: neutral100Color,
        ),
        disabledForegroundColor: neutral100Color,
      ));

  static final OutlinedButtonThemeData _outlinedButtonThemeDataDark =
  OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: neutral50Color,
        textStyle: largeBold,
        padding:
        const EdgeInsets.symmetric(horizontal: spacing4, vertical: spacing4),
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(radiusXxl)),
        side: const BorderSide(
          color: neutral100Color,
        ),
        disabledForegroundColor: neutral100Color,
      ));

  static final ElevatedButtonThemeData _elevatedButtonThemeData =
  ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(radiusXxl)),
        padding:
        const EdgeInsets.symmetric(horizontal: spacing5, vertical: spacing4),
        foregroundColor: whiteColor,
        backgroundColor: primary500Color,
        disabledForegroundColor: whiteColor,
        disabledBackgroundColor: backgroundDisable,
        textStyle: normalBold,
      ));

  static final ChipThemeData _chipThemeData = ChipThemeData(
      backgroundColor: neutral100Color,
      shape:
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(radiusXl)),
      side: const BorderSide(color: neutral100Color, width: 1));

  static final TextButtonThemeData _textButtonThemeData = TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: smallBold,
        foregroundColor: accent500Color,
        minimumSize: Size.zero,
        padding: EdgeInsets.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ));

  static final IconButtonThemeData _iconButtonThemeData = IconButtonThemeData(
      style: IconButton.styleFrom(
        minimumSize: Size.zero,
        padding: EdgeInsets.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ));

  static const BottomSheetThemeData _bottomSheetThemeData =
  BottomSheetThemeData(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(radiusLg),
          topRight: Radius.circular(radiusLg),
        )),
  );

  static const FloatingActionButtonThemeData _floatingActionButtonThemeData =
  FloatingActionButtonThemeData(
    backgroundColor: primary500Color,
  );

  static final CheckboxThemeData _checkboxThemeData =
  CheckboxThemeData(side: BorderSide(color: neutral100Color, width: 2));
}
