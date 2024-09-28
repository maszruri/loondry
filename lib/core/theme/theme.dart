import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4280247687),
      surfaceTint: Color(4280247687),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4291160063),
      onPrimaryContainer: Color(4278197805),
      secondary: Color(4283326829),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4292011508),
      onSecondaryContainer: Color(4278853160),
      tertiary: Color(4284635516),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4293385983),
      onTertiaryContainer: Color(4280162101),
      error: Color(4290386458),
      onError: Color(4294967295),
      errorContainer: Color(4294957782),
      onErrorContainer: Color(4282449922),
      surface: Color(4294376190),
      onSurface: Color(4279770143),
      onSurfaceVariant: Color(4282468429),
      outline: Color(4285626494),
      outlineVariant: Color(4290889678),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281086260),
      inversePrimary: Color(4287745781),
      primaryFixed: Color(4291160063),
      onPrimaryFixed: Color(4278197805),
      primaryFixedDim: Color(4287745781),
      onPrimaryFixedVariant: Color(4278209642),
      secondaryFixed: Color(4292011508),
      onSecondaryFixed: Color(4278853160),
      secondaryFixedDim: Color(4290169304),
      onSecondaryFixedVariant: Color(4281813333),
      tertiaryFixed: Color(4293385983),
      onTertiaryFixed: Color(4280162101),
      tertiaryFixedDim: Color(4291543529),
      onTertiaryFixedVariant: Color(4282991203),
      surfaceDim: Color(4292336351),
      surfaceBright: Color(4294376190),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4293981432),
      surfaceContainer: Color(4293652211),
      surfaceContainerHigh: Color(4293257453),
      surfaceContainerHighest: Color(4292862951),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4278208613),
      surfaceTint: Color(4280247687),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4282088350),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4281550161),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4284774276),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4282728031),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4286082964),
      onTertiaryContainer: Color(4294967295),
      error: Color(4287365129),
      onError: Color(4294967295),
      errorContainer: Color(4292490286),
      onErrorContainer: Color(4294967295),
      surface: Color(4294376190),
      onSurface: Color(4279770143),
      onSurfaceVariant: Color(4282205257),
      outline: Color(4284047461),
      outlineVariant: Color(4285889665),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281086260),
      inversePrimary: Color(4287745781),
      primaryFixed: Color(4282088350),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4279984772),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4284774276),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4283194987),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4286082964),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4284438394),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292336351),
      surfaceBright: Color(4294376190),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4293981432),
      surfaceContainer: Color(4293652211),
      surfaceContainerHigh: Color(4293257453),
      surfaceContainerHighest: Color(4292862951),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4278199606),
      surfaceTint: Color(4280247687),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4278208613),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4279378991),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4281550161),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4280556860),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4282728031),
      onTertiaryContainer: Color(4294967295),
      error: Color(4283301890),
      onError: Color(4294967295),
      errorContainer: Color(4287365129),
      onErrorContainer: Color(4294967295),
      surface: Color(4294376190),
      onSurface: Color(4278190080),
      onSurfaceVariant: Color(4280165674),
      outline: Color(4282205257),
      outlineVariant: Color(4282205257),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281086260),
      inversePrimary: Color(4292538367),
      primaryFixed: Color(4278208613),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4278202437),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4281550161),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4280102714),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4282728031),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4281280584),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292336351),
      surfaceBright: Color(4294376190),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4293981432),
      surfaceContainer: Color(4293652211),
      surfaceContainerHigh: Color(4293257453),
      surfaceContainerHighest: Color(4292862951),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4287745781),
      surfaceTint: Color(4287745781),
      onPrimary: Color(4278203467),
      primaryContainer: Color(4278209642),
      onPrimaryContainer: Color(4291160063),
      secondary: Color(4290169304),
      onSecondary: Color(4280300350),
      secondaryContainer: Color(4281813333),
      onSecondaryContainer: Color(4292011508),
      tertiary: Color(4291543529),
      onTertiary: Color(4281543756),
      tertiaryContainer: Color(4282991203),
      onTertiaryContainer: Color(4293385983),
      error: Color(4294948011),
      onError: Color(4285071365),
      errorContainer: Color(4287823882),
      onErrorContainer: Color(4294957782),
      surface: Color(4279178263),
      onSurface: Color(4292862951),
      onSurfaceVariant: Color(4290889678),
      outline: Color(4287337111),
      outlineVariant: Color(4282468429),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4292862951),
      inversePrimary: Color(4280247687),
      primaryFixed: Color(4291160063),
      onPrimaryFixed: Color(4278197805),
      primaryFixedDim: Color(4287745781),
      onPrimaryFixedVariant: Color(4278209642),
      secondaryFixed: Color(4292011508),
      onSecondaryFixed: Color(4278853160),
      secondaryFixedDim: Color(4290169304),
      onSecondaryFixedVariant: Color(4281813333),
      tertiaryFixed: Color(4293385983),
      onTertiaryFixed: Color(4280162101),
      tertiaryFixedDim: Color(4291543529),
      onTertiaryFixedVariant: Color(4282991203),
      surfaceDim: Color(4279178263),
      surfaceBright: Color(4281678397),
      surfaceContainerLowest: Color(4278849298),
      surfaceContainerLow: Color(4279770143),
      surfaceContainer: Color(4280033316),
      surfaceContainerHigh: Color(4280691502),
      surfaceContainerHighest: Color(4281414969),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4288008953),
      surfaceTint: Color(4287745781),
      onPrimary: Color(4278196517),
      primaryContainer: Color(4284127420),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4290432476),
      onSecondary: Color(4278523939),
      secondaryContainer: Color(4286616481),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4291872238),
      onTertiary: Color(4279767344),
      tertiaryContainer: Color(4287990705),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294949553),
      onError: Color(4281794561),
      errorContainer: Color(4294923337),
      onErrorContainer: Color(4278190080),
      surface: Color(4279178263),
      onSurface: Color(4294507519),
      onSurfaceVariant: Color(4291152850),
      outline: Color(4288521386),
      outlineVariant: Color(4286416010),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4292862951),
      inversePrimary: Color(4278209900),
      primaryFixed: Color(4291160063),
      onPrimaryFixed: Color(4278194974),
      primaryFixedDim: Color(4287745781),
      onPrimaryFixedVariant: Color(4278205011),
      secondaryFixed: Color(4292011508),
      onSecondaryFixed: Color(4278260509),
      secondaryFixedDim: Color(4290169304),
      onSecondaryFixedVariant: Color(4280694852),
      tertiaryFixed: Color(4293385983),
      onTertiaryFixed: Color(4279438378),
      tertiaryFixedDim: Color(4291543529),
      onTertiaryFixedVariant: Color(4281938258),
      surfaceDim: Color(4279178263),
      surfaceBright: Color(4281678397),
      surfaceContainerLowest: Color(4278849298),
      surfaceContainerLow: Color(4279770143),
      surfaceContainer: Color(4280033316),
      surfaceContainerHigh: Color(4280691502),
      surfaceContainerHighest: Color(4281414969),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4294507519),
      surfaceTint: Color(4287745781),
      onPrimary: Color(4278190080),
      primaryContainer: Color(4288008953),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4294507519),
      onSecondary: Color(4278190080),
      secondaryContainer: Color(4290432476),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4294900223),
      onTertiary: Color(4278190080),
      tertiaryContainer: Color(4291872238),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294965753),
      onError: Color(4278190080),
      errorContainer: Color(4294949553),
      onErrorContainer: Color(4278190080),
      surface: Color(4279178263),
      onSurface: Color(4294967295),
      onSurfaceVariant: Color(4294507519),
      outline: Color(4291152850),
      outlineVariant: Color(4291152850),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4292862951),
      inversePrimary: Color(4278201922),
      primaryFixed: Color(4291816447),
      onPrimaryFixed: Color(4278190080),
      primaryFixedDim: Color(4288008953),
      onPrimaryFixedVariant: Color(4278196517),
      secondaryFixed: Color(4292274681),
      onSecondaryFixed: Color(4278190080),
      secondaryFixedDim: Color(4290432476),
      onSecondaryFixedVariant: Color(4278523939),
      tertiaryFixed: Color(4293649407),
      onTertiaryFixed: Color(4278190080),
      tertiaryFixedDim: Color(4291872238),
      onTertiaryFixedVariant: Color(4279767344),
      surfaceDim: Color(4279178263),
      surfaceBright: Color(4281678397),
      surfaceContainerLowest: Color(4278849298),
      surfaceContainerLow: Color(4279770143),
      surfaceContainer: Color(4280033316),
      surfaceContainerHigh: Color(4280691502),
      surfaceContainerHighest: Color(4281414969),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
        useMaterial3: true,
        brightness: colorScheme.brightness,
        colorScheme: colorScheme,
        textTheme: textTheme.apply(
          bodyColor: colorScheme.onSurface,
          displayColor: colorScheme.onSurface,
        ),
        scaffoldBackgroundColor: colorScheme.background,
        canvasColor: colorScheme.surface,
      );

  List<ExtendedColor> get extendedColors => [];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
