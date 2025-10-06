import 'package:e_commerce_app/core/theme/app_colors/light_app_colors.dart';
import 'package:e_commerce_app/core/theme/app_texts/app_text_styles.dart';
import 'package:flutter/material.dart';

class RememberMeSwitch extends StatefulWidget {
  const RememberMeSwitch({super.key});

  @override
  State<RememberMeSwitch> createState() => _RememberMeSwitchState();
}

class _RememberMeSwitchState extends State<RememberMeSwitch> {
  bool isRemembered = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Remember me', style: AppTextStyles.font14SemiBold),
        Transform.scale(
          scale: 0.8,
          child: Switch(
            value: isRemembered,
            activeThumbColor: LightAppColors.primaryColor,
            inactiveTrackColor: Colors.grey.shade300,
            inactiveThumbColor: Colors.grey,
            onChanged: (value) {
              setState(() {
                isRemembered = value;
              });
            },
          ),
        ),
      ],
    );
  }
}
