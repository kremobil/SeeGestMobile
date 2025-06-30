import 'package:SeeGestMobileApp/models/tags.dart';
import 'package:SeeGestMobileApp/providers/tagsProvider.dart';
import 'package:SeeGestMobileApp/seegest_theme.dart';
import 'package:SeeGestMobileApp/shared/styled_input.dart';
import 'package:SeeGestMobileApp/shared/styled_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TagsInput extends ConsumerStatefulWidget {
  const TagsInput(
      {super.key,
      this.scrollableKey,
      this.scrollController,
      this.dynamicExpanderKey});

  final GlobalKey? scrollableKey;
  final ScrollController? scrollController;
  final GlobalKey<DynamicDropdownExpanderState>? dynamicExpanderKey;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TagsInputState();
}

class _TagsInputState extends ConsumerState<TagsInput> {
  final TextEditingController _tagSearchController = TextEditingController();
  final OverlayPortalController _autoCompleteController =
      OverlayPortalController();

  final LayerLink _link = LayerLink();

  final GlobalKey _dropdownKey = GlobalKey();

  double? _inputWidth;

  void ensureLayoutAndCalculateOverflow() {
    print("Ensure invoked");
    if (widget.dynamicExpanderKey == null) {
      print("Dynamic expander key not provided - skipping overflow calculation");
      
      return;
    }
    
    WidgetsBinding.instance.addPostFrameCallback((_) {
      calculateOverflow();
    });
  }

  void scrollDropdownIntoView() {
    if (widget.scrollController == null) {
      print("Scroll controller not provided - skipping scroll to view");
      return;
    }

    ScrollableState? scrollableState = Scrollable.of(context);
    if (scrollableState == null) {
      print("Scrollable state not found - cannot scroll dropdown into view");
      return;
    }

    double? endOfDropdownInScrollable = dropdownPositionInScrollable();
    if (endOfDropdownInScrollable == null) {
      print("Cannot determine dropdown position - skipping scroll");
      return;
    }

    double? offsetPadding = getOffsetPadding();
    if (offsetPadding == null) {
      print("Cannot determine offset padding - skipping scroll");
      return;
    }

    double targetScrollPosition = endOfDropdownInScrollable -
        scrollableState.position.viewportDimension +
        offsetPadding;

    double currentScrollPosition = widget.scrollController!.offset;
    if ((targetScrollPosition - currentScrollPosition).abs() < 1.0) {
      print("Scroll not needed - dropdown already in view");
      return;
    }

    widget.scrollController!.animateTo(
      targetScrollPosition,
      duration: Duration(milliseconds: 200),
      curve: Curves.easeInOut,
    );
  }

  void calculateOverflow() {    
    if (widget.dynamicExpanderKey?.currentState == null) {
      print("Dynamic expander state not available - cannot calculate overflow");
      return;
    }

    double? scrollableHeight = getScrollableHeight();
    if (scrollableHeight == null) {
      print("Cannot determine scrollable height - skipping overflow calculation");
      return;
    }

    double? endOfDropdownInScrollable = dropdownPositionInScrollable();
    if (endOfDropdownInScrollable == null) {
      print("Cannot determine dropdown position - skipping overflow calculation");
      return;
    }

    double? offsetPadding = getOffsetPadding();
    if (offsetPadding == null) {
      print("Cannot determine offset padding - skipping overflow calculation");
      return;
    }

    double dropdownOverflow = (endOfDropdownInScrollable - scrollableHeight) + offsetPadding;
    double currentExpanderHeight = widget.dynamicExpanderKey!.currentState!.currentHeight;

    if (dropdownOverflow < 0) {
      double newHeight = currentExpanderHeight + dropdownOverflow > 0
          ? currentExpanderHeight + dropdownOverflow
          : 0;
      widget.dynamicExpanderKey!.currentState!.updateHeight(newHeight);
    } else if (dropdownOverflow == 0) {
      widget.dynamicExpanderKey!.currentState!.updateHeight(currentExpanderHeight);
    } else {
      widget.dynamicExpanderKey!.currentState!.updateHeight(dropdownOverflow);
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        scrollDropdownIntoView();
      });
    });
  }

  double? getOffsetPadding() {
    double? scrollableHeight = getScrollableHeight();
    if (scrollableHeight == null) return null;

    double? expanderEndPosition = expanderPositionInScrollable();
    if (expanderEndPosition == null) return null;

    return scrollableHeight - expanderEndPosition;
  }

  double? getScrollableHeight() {
    ScrollableState? scrollableState = Scrollable.of(context);
    if (scrollableState == null) return null;

    ScrollPosition? scrollPosition = scrollableState.position;
    if (scrollPosition == null) return null;

    return scrollPosition.maxScrollExtent + scrollPosition.viewportDimension;
  }

  double? dropdownPositionInScrollable() {
    RenderBox? dropdownBox =
        _dropdownKey.currentContext?.findRenderObject() as RenderBox?;
    if (dropdownBox == null) return null;

    RenderBox? scrollableBox =
        widget.scrollableKey?.currentContext?.findRenderObject() as RenderBox?;
    if (scrollableBox == null) return null;

    ScrollableState? scrollableState = Scrollable.of(context);
    if (scrollableState == null) return null;

    ScrollPosition? scrollPosition = scrollableState.position;
    if (scrollPosition == null) return null;

    Offset viewportPosition = scrollableBox.localToGlobal(Offset.zero);
    Offset dropdownPosition = dropdownBox.localToGlobal(Offset.zero);

    return (dropdownPosition.dy - viewportPosition.dy) +
        scrollPosition.pixels +
        dropdownBox.size.height;
  }

  double? expanderPositionInScrollable() {
    RenderBox? expanderBox =
        widget.dynamicExpanderKey?.currentContext?.findRenderObject() as RenderBox?;
    if (expanderBox == null) return null;

    RenderBox? scrollableBox =
        widget.scrollableKey?.currentContext?.findRenderObject() as RenderBox?;
    if (scrollableBox == null) return null;

    ScrollableState? scrollableState = Scrollable.of(context);
    if (scrollableState == null) return null;

    ScrollPosition? scrollPosition = scrollableState.position;
    if (scrollPosition == null) return null;

    Offset viewportPosition = scrollableBox.localToGlobal(Offset.zero);
    Offset expanderPosition = expanderBox.localToGlobal(Offset.zero);

    return (expanderPosition.dy - viewportPosition.dy) +
        scrollPosition.pixels +
        expanderBox.size.height;
  }

  @override
  Widget build(BuildContext context) {
    final AsyncValue<List<TagsModel>> tags = ref.watch(tagsSearchProvider);

    return Column(
      children: [
        CompositedTransformTarget(
          link: _link,
          child: OverlayPortal(
            controller: _autoCompleteController,
            overlayChildBuilder: (context) {
              return CompositedTransformFollower(
                link: _link,
                targetAnchor: Alignment.bottomLeft,
                followerAnchor: Alignment.topLeft,
                child: Align(
                    alignment: AlignmentDirectional.topStart,
                    child: AutoCompleteContianer(
                      width: _inputWidth ?? 200,
                      key: _dropdownKey,
                    )),
              );
            },
            child: StyledInput(
              labelText: "Tagi: ",
              hintText: "Dodaj tagi do wyszkuiwania",
              onChanged: (value) {
                ref.read(tagsSearchProvider.notifier).search(value);
                if (value.isNotEmpty) {
                  _inputWidth = context.size?.width;
                  _autoCompleteController.show();

                  ensureLayoutAndCalculateOverflow();
                } else {
                  _autoCompleteController.hide();
                  if (widget.dynamicExpanderKey?.currentState != null) {
                    widget.dynamicExpanderKey!.currentState!.updateHeight(0);
                  }
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}

class AutoCompleteContianer extends ConsumerWidget {
  const AutoCompleteContianer({super.key, required this.width});

  final double width;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<List<TagsModel>> tags = ref.watch(tagsSearchProvider);

    return Container(
      margin: const EdgeInsets.only(top: 4.0),
      width: width,
      height: 200,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: AppColors.mainColor,
          width: 1.5,
        ),
      ),
      child: tags.when(
        data: (tags) {
          return ListView.builder(
            itemCount: tags.length,
            itemBuilder: (context, index) {
              final tag = tags[index];
              return ListBody(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        StyledBodyText(tag.name),
                        const Spacer(),
                        StyledBodyText(tag.count.toString())
                      ],
                    ),
                  ),
                ],
              );
            },
          );
        },
        error: (error, stackTrace) => Center(child: Text('Error: $error')),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}

class DynamicDropdownExpander extends StatefulWidget {
  const DynamicDropdownExpander({super.key});

  @override
  State<DynamicDropdownExpander> createState() =>
      DynamicDropdownExpanderState();
}

class DynamicDropdownExpanderState extends State<DynamicDropdownExpander> {
  double _height = 0;

  void updateHeight(double newHeight) {
    if (_height != newHeight) {
      setState(() {
        _height = newHeight;
      });
    }
  }

  double get currentHeight => _height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _height,
    );
  }
}
