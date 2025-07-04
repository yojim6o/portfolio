import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/extensions.dart';

class PoweredByFlutter extends StatelessWidget {
  const PoweredByFlutter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(
          image: AssetImage('assets/images/flutter.png'),
          height: 24,
          width: 24,
        ),
        Gap(8),
        Text(
          context.text.poweredByFlutter,
          style: context.textStyle.bodyMdMedium.copyWith(
            color: context.theme.colorScheme.onBackground,
          ),
        ),
      ],
    );
  }
}