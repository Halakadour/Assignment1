import 'package:flutter/cupertino.dart';

class AppColors {
  const AppColors._();

  // Brand Colors
  static const red50 = Color(0xFFFDE6E6);
  static const red100 = Color(0xFFFBCCCC);
  static const red200 = Color(0xFFF69999);
  static const red300 = Color(0xFFF26666);
  static const red400 = Color(0xFFEE3333);
  static const redDefault = Color(0xFFE90000);
  static const red600 = Color(0xFFBB0000);
  static const red700 = Color(0xFF8C0000);
  static const red800 = Color(0xFF5D0000);

  static const cyan50 = Color(0xFFE6FDFD);
  static const cyan100 = Color(0xFFCCFBF9);
  static const cyan200 = Color(0xFF99F6F0);
  static const cyan300 = Color(0xFF66F2F0);
  static const cyan400 = Color(0xFF33EEDE);
  static const cyanDefault = Color(0xFF00E1E9);
  static const cyan600 = Color(0xFF00B5BB);
  static const cyan700 = Color(0xFF00878C);
  static const cyan800 = Color(0xFF004C5D);

  static const green50 = Color(0xFFE6FDE8);
  static const green100 = Color(0xFFCCF9D0);
  static const green200 = Color(0xFF99F4A1);
  static const green300 = Color(0xFF66EE71);
  static const green400 = Color(0xFF33E942);
  static const greenDefault = Color(0xFF00E313);
  static const green600 = Color(0xFF00B60F);
  static const green700 = Color(0xFF00880B);
  static const green800 = Color(0xFF005B08);

  static const blue50 = Color(0xFFE6ECFD);
  static const blue100 = Color(0xFFCCD8F9);
  static const blue200 = Color(0xFF99B1F4);
  static const blue300 = Color(0xFF668AEE);
  static const blue400 = Color(0xFF3363E9);
  static const blueDefault = Color(0xFF003DE3);
  static const blue600 = Color(0xFF0030B6);
  static const blue700 = Color(0xFF002488);
  static const blue800 = Color(0xFF00185B);

  static const orange50 = Color(0xFFFDF0E6);
  static const orange100 = Color(0xFFF9E0CC);
  static const orange200 = Color(0xFFF4C299);
  static const orange300 = Color(0xFFEEA366);
  static const orange400 = Color(0xFFE98533);
  static const orangeDefault = Color(0xFFE36600);
  static const orange600 = Color(0xFFB65200);
  static const orange700 = Color(0xFF883D00);
  static const orange800 = Color(0xFF5B2900);

  static const gray50 = Color(0xFFEDEDEE);
  static const gray100 = Color(0xFFDADBDD);
  static const gray200 = Color(0xFFB4B6BB);
  static const gray300 = Color(0xFF8F9299);
  static const gray400 = Color(0xFF696D77);
  static const grayDefault = Color(0xFF444955);
  static const gray600 = Color(0xFF363A44);
  static const gray700 = Color(0xFF292C33);
  static const gray800 = Color(0xFF1B1D22);
  static const gray850 = Color(0xFF0A0B0D);

  static const white = Color(0xFFFFFFFF);
  static const black = Color(0xFF0C0C0C);

  // Alias Colors
  static const primary50 = cyan50;
  static const primary100 = cyan100;
  static const primary200 = cyan200;
  static const primary300 = cyan300;
  static const primary400 = cyan400;
  static const primaryDefault = cyanDefault;
  static const primary600 = cyan600;
  static const primary700 = cyan700;
  static const primary800 = cyan800;

  static const success50 = green50;
  static const success100 = green100;
  static const success200 = green200;
  static const success300 = green300;
  static const success400 = green400;
  static const successDefault = greenDefault;
  static const success600 = green600;
  static const success700 = green700;
  static const success800 = green800;

  static const error50 = red50;
  static const error100 = red100;
  static const error200 = red200;
  static const error300 = red300;
  static const error400 = red400;
  static const errorDefault = redDefault;
  static const error600 = red600;
  static const error700 = red700;
  static const error800 = red800;

  static const warning50 = orange50;
  static const warning100 = orange100;
  static const warning200 = orange200;
  static const warning300 = orange300;
  static const warning400 = orange400;
  static const warningDefault = orangeDefault;
  static const warning600 = orange600;
  static const warning700 = orange700;
  static const warning800 = orange800;

  static const info50 = blue50;
  static const info100 = blue100;
  static const info200 = blue200;
  static const info300 = blue300;
  static const info400 = blue400;
  static const infoDefault = blueDefault;
  static const info600 = blue600;
  static const info700 = blue700;
  static const info800 = blue800;

  static const neutral50 = gray50;
  static const neutral100 = gray100;
  static const neutral200 = gray200;
  static const neutral300 = gray300;
  static const neutral400 = gray400;
  static const neutralDefault = grayDefault;
  static const neutral600 = gray600;
  static const neutral700 = gray700;
  static const neutral800 = gray800;
  static const neutral850 = gray850;

  // Mapped Colors
  // For The Light Mode
  static const hoverColorLight = neutral800;
  static const focusColorLight = neutral700;
  static const disableColorLight = neutral400;

  static const textHeadingsLight = neutral800;
  static const textBodyLight = neutral700;
  static const textLabelLight = neutral200;
  static const textActionLight = primaryDefault;
  static const textActionHoverLight = primary600;
  static const textOnActionLight = white;
  static const textDisabledLight = neutral400;
  static const textInfoLight = infoDefault;
  static const textWarningLight = warningDefault;
  static const textSuccessLight = successDefault;
  static const textErrorLight = errorDefault;

  static const iconsDefaultLight = neutral600;
  static const iconsActionLight = primaryDefault;
  static const iconsActionHoverLight = primary600;
  static const iconsOnActionLight = white;
  static const iconsDisabledLight = neutral400;
  static const iconsInfoLight = infoDefault;
  static const iconsWarningLight = warningDefault;
  static const iconsSuccessLight = successDefault;
  static const iconsErrorLight = errorDefault;

  static const surfaceDefaultLight = white;
  static const surfacePageLight = neutral50;
  static const surfaceContainerLight = neutral100;
  static const surfaceActionLight = primaryDefault;
  static const surfaceActionHoverLight = primary600;
  static const surfaceDisabledLight = neutral50;
  static const surfaceInfoLight = info50;
  static const surfaceWarningLight = warning50;
  static const surfaceSuccessLight = success50;
  static const surfaceErrorLight = error50;

  static const borderDefaultLight = neutral200;
  static const borderSuccessLight = success200;
  static const borderWarningLight = warning200;
  static const borderInfoLight = info200;
  static const borderErrorLight = error200;
  static const borderDisabledLight = neutral200;
  static const borderActionLight = primary200;
  static const borderFocusLight = primaryDefault;
  static const borderActionHoverLight = primary600;

  // For The Dark Mode
  static const hoverColorDark = neutral50;
  static const focusColorDark = neutral100;
  static const disableColorDark = neutralDefault;

  static const textHeadingsDark = neutral50;
  static const textBodyDark = neutral200;
  static const textLabelDark = neutral400;
  static const textActionDark = primaryDefault;
  static const textActionHoverDark = primary400;
  static const textOnActionDark = white;
  static const textDisabledDark = neutral400;
  static const textInfoDark = info400;
  static const textWarningDark = warning400;
  static const textSuccessDark = success400;
  static const textErrorDark = error400;

  static const iconsDefaultDark = neutral400;
  static const iconsActionDark = primaryDefault;
  static const iconsActionHoverDark = primary400;
  static const iconsOnActionDark = black;
  static const iconsDisabledDark = neutralDefault;
  static const iconsInfoDark = info400;
  static const iconsWarningDark = warning400;
  static const iconsSuccessDark = success400;
  static const iconsErrorDark = error300;

  static const surfacePageDark = neutral850;
  static const surfaceDefaultDark = neutral800;
  static const surfaceContainerDark = neutral700;
  static const surfaceActionDark = primaryDefault;
  static const surfaceActionHoverDark = primary400;
  static const surfaceDisabledDark = neutral600;
  static const surfaceInfoDark = info800;
  static const surfaceWarningDark = warning800;
  static const surfaceSuccessDark = success800;
  static const surfaceErrorDark = error800;

  static const borderDefaultDark = neutralDefault;
  static const borderSuccessDark = success600;
  static const borderWarningDark = warning600;
  static const borderInfoDark = info600;
  static const borderErrorDark = error600;
  static const borderDisabledDark = neutral600;
  static const borderActionDark = primaryDefault;
  static const borderFocusDark = primaryDefault;
  static const borderActionHoverDark = primary400;
}
