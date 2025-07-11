import 'package:SeeGestMobileApp/seegest_theme.dart';
import 'package:SeeGestMobileApp/shared/styled_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ConnectedAccounts extends ConsumerStatefulWidget {
  const ConnectedAccounts({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ConnectedAccountsState();
}

class _ConnectedAccountsState extends ConsumerState<ConnectedAccounts> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        StyledHeadingText("Powiązane konta"),
        const SizedBox(
          height: 8,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                padding: EdgeInsets.all(4),
                alignment: AlignmentDirectional.center,
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: AppColors.mainColor),
                child: FaIcon(
                  FontAwesomeIcons.google,
                  color: Colors.white,
                  size: 20,
                )),
            const SizedBox(
              width: 8,
            ),
            StyledBodyTextLarge("Google"),
            const Expanded(child: SizedBox()),
            FilledButton.icon(
              onPressed: () {
                print("Hello");
              },
              label: Text(
                "Powiąż",
              ),
              style: FilledButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 2),
              ),
              icon: Icon(
                FontAwesomeIcons.link,
                size: 12,
              ),
              iconAlignment: IconAlignment.end,
            ),
          ],
        ),
        const SizedBox(
          height: 4,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                padding: EdgeInsets.all(4),
                alignment: AlignmentDirectional.center,
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: AppColors.mainColor),
                child: FaIcon(
                  FontAwesomeIcons.facebookF,
                  color: Colors.white,
                  size: 20,
                )),
            const SizedBox(
              width: 8,
            ),
            StyledBodyTextLarge("Facebook"),
            const Expanded(child: SizedBox()),
            FilledButton.icon(
              onPressed: () {
                print("Hello");
              },
              label: Text(
                "Powiąż",
              ),
              style: FilledButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 2),
              ),
              icon: FaIcon(
                FontAwesomeIcons.link,
                size: 12,
              ),
              iconAlignment: IconAlignment.end,
            ),
          ],
        )
      ],
    );
  }
}
