import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:workroom_flutter_app/common/constants/app_colors.dart';

const mobileScreenSizeLimit = 600;
const tabletScreenSizeLimit = 1200;

class Shared {
  Shared._();
  static void toast(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  static Image getIcon(String iconName) {
    return Image.asset(
      iconName,
      color: AppColors.bottomNavigationBarDeactivatedIconColor,
    );
  }

  static Image getColoredIcon(String iconName, Color color) {
    return Image.asset(
      iconName,
      color: color,
    );
  }

  static Color getColorFromGradient(List<Color> colors, double position) {
    if (colors.isEmpty) return Colors.transparent;
    if (position <= 0) return colors.first;
    if (position >= 1) return colors.last;

    final segment = 1 / (colors.length - 1);
    final index = (position / segment).floor();
    final t = (position - index * segment) / segment;

    return Color.lerp(colors[index], colors[index + 1], t)!;
  }

  static Future<Uint8List?> imagepicker(ImageSource source) async {
    final image = await ImagePicker().pickImage(
      source: source,
    );
    if (image != null) {
      return image.readAsBytes();
    }
    return null;
  }

  static Widget loading() {
    return const Center(
      child: SpinKitFadingCube(
        color: AppColors.loadingColor,
      ),
    );
  }
}

enum QualityStatus {
  start,
  ongoing,
  accepted,
}

const String authBaseUrl = 'https://dev.api.onworkroom.com:9006';
const String inspectionListBaseUrl =
    'https://dev.api.onworkroom.com:8005/api/v1';
