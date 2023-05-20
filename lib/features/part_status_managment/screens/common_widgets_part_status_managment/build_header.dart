import 'package:flutter/material.dart';
import 'package:workroom_flutter_app/common/constants/app_colors.dart';

class BuildHeader extends StatelessWidget {
  const BuildHeader({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        height: 113,
        width: double.infinity,
        color: AppColors.tileColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Text(
                    'Part ID: ',
                    style: TextStyle(
                      color: AppColors.greyColor,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              Container(
                height: 34,
                width: 146,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.greenBorderColor,
                  ),
                  borderRadius: BorderRadius.circular(90),
                ),
                child: const Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Text('Completed'),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
