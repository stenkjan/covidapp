import 'constants.dart';

/** Implementation for the backround colors */
BackgroundColors backgroundColorFromString(String backgroundColor) {
  return BackgroundColors.values
      .firstWhere((element) => element.toString() == backgroundColor);
}
