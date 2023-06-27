import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const Color red = Colors.red;
  // rejected MO status
  static const Color redColor = Color.fromRGBO(255, 8, 68, 0.19);
  static const Color redBorderColor = Color(0xFFED0000);
  // rejected MO status
  static const Color whiteColor = Colors.white;
  static const Color greyColor = Color(0xFF7D7676);
  static const Color textColor = Colors.black;
  static const Color tileTextColor = Colors.white;
  static const Color subtitleColor = Color(0xFF7D7676);
  static const Color iconColor = Colors.black;
  static const Color tileIconColor = Colors.white;
  static const Color borderColor = Colors.black;
  static const Color greyBorderColor = Color(0xFFDADADA);
  static const Color tileColor = Colors.white;
  // static const Color tileColor = Color.fromRGBO(217, 217, 217, 0.3);
  static const Color blueColor = Color.fromRGBO(177, 226, 253, 0.8);
  static const Color blueBorderColor = Color(0xFF009AFF);
  // completed MO status
  static const Color greenColor = Color.fromRGBO(206, 244, 187, 0.4);
  static const Color greenBorderColor = Color(0xFF27C052);

  static const Color disabledTextColor = Color(0XFF7D7676);

  // completed MO status
  static LinearGradient linearGradient = const LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFF00C6FB), // #00C6FB
      Color(0xFF005BEA), // #005BEA
    ],
  );
  static LinearGradient gradientLeftToRight = const LinearGradient(
    colors: [
      Color(0xFF00C6FB),
      Color(0xFF005BEA),
    ],
  );
  static LinearGradient gradientRightToLeft = const LinearGradient(
    colors: [
      Color(0xFF005BEA),
      Color(0xFF00C6FB),
    ],
  );
  static LinearGradient gradientRightToLeftTile = const LinearGradient(
    colors: [
      Color(0xFF005BEA),
      Color(0xFFD900FF),
    ],
  );

  static LinearGradient gradientOngoingMo = const LinearGradient(
    colors: [
      Color(0xFFFF9533), // #FF9533
      Color(0xFFEE4242), // #EE4242
    ],
    stops: [0.0, 1.0],
  );

  static List<Color> gradientColors = const [
    Color(0xFF00C6FB), // #00C6FB
    Color(0xFF005BEA), // #005BEA
  ];

  //counterBoxColors
  static const Color counterBoxCompletedColor = Color(0xFF27C052);
  static const Color counterBoxOpenColor = Color(0xFF009AFF);
  static const Color counterBoxRejectedColor = Color(0xFFED0000);
  static const Color counterBoxReworkColor = Color(0xFFFF9E44);

  // status colors
  static const Color completedStatusColor = Color(0xFF27C052);
  static const Color openStatusColor = Color(0xFF009AFF);
  static const Color rejectedStatusColor = Color(0xFFED0000);
  static const Color reworkStatusColor = Color(0xFFFF9E44);
  static const Color inProgressStatusColor = Color(0xFFFF9E44);
  static const Color scrappedStatusColor = Color.fromRGBO(25, 71, 233, 0.61);
  static const Color onHoldStatusColor = Color(0xFFA49F9F);

  static const Color timerBorderColor = Color(0xFFDADADA);
  static const Color timericonColor = Color(0xFF7D7676);

  // transparent
  static const Color transparent = Colors.transparent;

  // bottom sheet colors
  static Color bottomSheetColor = Colors.grey[200]!;

  // inputs modal
  static const Color inputsModalExternalcolor = Color(0xFFAC32E4);
  static const Color inputsModalRoutingcolor = Color(0xFF009AFF);
  static const Color inputsModalAvailabilityBordercolor = Color(0xFFDADADA);

  // part status managment header status box color
  static const Color partStatusManagementHeaderStatusBoxColor =
      Color(0xFFFCE3A3);
  static const Color partStatusManagementHeaderStatusBoxBorderColor =
      Color(0xFFFF9E44);

  // pinned sheet
  static const Color pinnedSheetBoxShadowColor = Color.fromRGBO(0, 0, 0, 0.25);

  // bottom navigation baar
  static const Color bottomNavigationBarDeactivatedIconColor =
      Color(0xFFC4C4C4);

  // worK queue
  static const headerTextColor = Color(0xFF7D7676);
  static const statusTileBackgroundContainerColor =
      Color.fromRGBO(245, 245, 245, 0.6);
  static const statusCircleColor = Color(0xFFE5E5E5);
  static const selectedRadioButtonTileColor =
      Color.fromRGBO(208, 235, 255, 0.35);
  static const selectedButtonColor = Color(0xFF009AFF);

  // sheet basic detail background color
  static const basicDetailTileColor = Color.fromRGBO(208, 235, 255, 0.35);

  // form
  static const formFieldDisabledColor = Color(0xFFCCCCCC);
  static LinearGradient disabledGradient = LinearGradient(
    colors: [Colors.grey.withOpacity(0.2), Colors.grey.withOpacity(0.4)],
  );

  // home screen colors
  static const historyDotColor = Color(0XFF7918F2);
}
