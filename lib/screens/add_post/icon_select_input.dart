import 'dart:ui';

import 'package:SeeGestMobileApp/models/icon.dart';
import 'package:SeeGestMobileApp/providers/iconsProvider.dart';
import 'package:SeeGestMobileApp/seegest_theme.dart';
import 'package:SeeGestMobileApp/shared/styled_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class IconSelectInput extends ConsumerStatefulWidget {
  const IconSelectInput({
    super.key,
    required this.onIconSelected,
    this.initialIcon,
  });

  final void Function(IconModel icon) onIconSelected;
  final IconModel? initialIcon;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _IconSelectInputState();
}

class _IconSelectInputState extends ConsumerState<IconSelectInput> {
  IconModel? selectedIcon;

  @override
  void initState() {
    super.initState();
    selectedIcon = widget.initialIcon;
  }

  @override
  Widget build(BuildContext context) {
    AsyncValue<List<IconModel>> iconsData = ref.watch(iconsProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        StyledInputLabelText("Ikonka posta"),
        const SizedBox(height: 4),

        iconsData.when(
          data: (icons) {
            return Container(
              height: 48,
              width: double.infinity,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  IconModel icon = icons[index];

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIcon = icon;
                      });
                      widget.onIconSelected(icon);
                    },
                    child: Container(
                      width: 48,
                      height: 48,
                      margin: const EdgeInsets.only(
                        right: 8.0,
                      ),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.mainColor,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                        color: selectedIcon == icon
                            ? AppColors.mainColor
                            : Colors.transparent,
                      ),
                      child: selectedIcon == icon
                          ? Stack(
                              clipBehavior: Clip.none,
                              children: [
                                // Shadow layer
                                Positioned(
                                  left: -2,
                                  top: -2,
                                  child: ImageFiltered(
                                    imageFilter: ImageFilter.blur(
                                        sigmaX: 4.0, sigmaY: 4.0),
                                    child: Image.network(
                                      icon.file.url,
                                      width: 36,
                                      height: 36,
                                      color:
                                          Colors.white.withValues(alpha: 0.7),
                                      colorBlendMode: BlendMode.srcATop,
                                    ),
                                  ),
                                ),
                                // Main image
                                Image.network(
                                  icon.file.url,
                                  width: 32,
                                  height: 32,
                                ),
                              ],
                            )
                          : Image.network(
                              icon.file.url,
                              width: 32,
                              height: 32,
                            ),
                    ),
                  );
                },
                itemCount: icons.length,
                scrollDirection: Axis.horizontal,
              ),
            );
          },
          error: (error, stack) => Text('Error: $error'),
          loading: () => CircularProgressIndicator(),
        )
        // ListView.builder(itemBuilder: itemBuilder, itemCount: ,)
      ],
    );
  }
}
