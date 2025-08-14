import 'dart:convert';
import 'package:SeeGestMobileApp/models/tags.dart';
import 'package:SeeGestMobileApp/providers/tagsProvider.dart';
import 'package:SeeGestMobileApp/seegest_theme.dart';
import 'package:SeeGestMobileApp/shared/styled_input.dart';
import 'package:SeeGestMobileApp/shared/styled_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class TagsInput extends ConsumerStatefulWidget {
  const TagsInput(
      {super.key,
      this.scrollableKey,
      this.scrollController,
      this.dynamicExpanderKey,
      this.createNewTags = false,
      this.onTagsChanged,
      this.initialTags});

  final GlobalKey? scrollableKey;
  final ScrollController? scrollController;
  final GlobalKey<DynamicDropdownExpanderState>? dynamicExpanderKey;
  final bool createNewTags;
  final void Function(List<TagsModel>)? onTagsChanged;
  final List<TagsModel>? initialTags;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TagsInputState();
}

class _TagsInputState extends ConsumerState<TagsInput> {
  final TextEditingController _tagSearchController = TextEditingController();
  final OverlayPortalController _autoCompleteController =
      OverlayPortalController();

  final LayerLink _link = LayerLink();

  final GlobalKey _dropdownKey = GlobalKey();

  final FocusNode _focusNode = FocusNode();

  final GlobalKey _inputKey = GlobalKey();

  double? _inputWidth;

  List<TagsModel> _selectedTags = [];

  @override
  void dispose() {
    _tagSearchController.dispose();
    _focusNode.dispose();

    super.dispose();
  }
  
  @override
  void initState() {
    super.initState();
    _selectedTags = widget.initialTags ?? [];
  }

  void ensureLayoutAndCalculateOverflow() {
    print("Ensure invoked");
    if (widget.dynamicExpanderKey == null) {
      print(
          "Dynamic expander key not provided - skipping overflow calculation");

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
      print(
          "Cannot determine scrollable height - skipping overflow calculation");
      return;
    }

    double? endOfDropdownInScrollable = dropdownPositionInScrollable();
    if (endOfDropdownInScrollable == null) {
      print(
          "Cannot determine dropdown position - skipping overflow calculation");
      return;
    }

    double? offsetPadding = getOffsetPadding();
    if (offsetPadding == null) {
      print("Cannot determine offset padding - skipping overflow calculation");
      return;
    }

    double dropdownOverflow =
        (endOfDropdownInScrollable - scrollableHeight) + offsetPadding;
    double currentExpanderHeight =
        widget.dynamicExpanderKey!.currentState!.currentHeight;

    if (dropdownOverflow < 0) {
      double newHeight = currentExpanderHeight + dropdownOverflow > 0
          ? currentExpanderHeight + dropdownOverflow
          : 0;
      widget.dynamicExpanderKey!.currentState!.updateHeight(newHeight);
    } else if (dropdownOverflow == 0) {
      widget.dynamicExpanderKey!.currentState!
          .updateHeight(currentExpanderHeight);
    } else {
      widget.dynamicExpanderKey!.currentState!.updateHeight(dropdownOverflow);
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollDropdownIntoView();
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
    RenderBox? expanderBox = widget.dynamicExpanderKey?.currentContext
        ?.findRenderObject() as RenderBox?;
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
    final AsyncValue<List<TagsModel>> tagsSuggestions =
        ref.watch(tagsSearchProvider);

    ref.listen(tagsSearchProvider,
        (previous, AsyncValue<List<TagsModel>> next) {
      // Gdy dane się zmienią i dropdown jest otwarty
      if (next.valueOrNull != null && next.value!.isNotEmpty) {
        _inputWidth = context.size?.width;
        _autoCompleteController.show();
        // Poczekaj aż UI się zaktualizuje
        WidgetsBinding.instance.addPostFrameCallback((_) {
          ensureLayoutAndCalculateOverflow();
        });
      } else {
        _autoCompleteController.hide();
        if (widget.dynamicExpanderKey?.currentState != null) {
          widget.dynamicExpanderKey!.currentState!.updateHeight(0);
        }
      }
    });

    void createTag(String name) async {
      http.Response response = await http.post(
        Uri.parse("https://api.seegest.com/tags"),
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          "name": name,
        }),
      );

      if (response.statusCode == 200) {
        final newTag = TagsModel.fromJson(jsonDecode(response.body));
        setState(() {
          _selectedTags.add(newTag);
        });
        if (widget.onTagsChanged != null) {
          widget.onTagsChanged!(_selectedTags);
        }
      } else {
        throw Exception("Failed to create tag: ${response.body}");
      }
    }

    void selectOrCreateTag(String name) async {
      if (_selectedTags.any((tag) => tag.name == name)) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Tag '$name' jest już dodany."),
          ),
        );
        return;
      }
      if (tagsSuggestions.valueOrNull != null) {
        final searchedTag = tagsSuggestions.value!
            .where((TagsModel tag) => tag.name == name)
            .firstOrNull;

        if (searchedTag != null) {
          setState(() {
            _selectedTags.add(searchedTag);
          });
          if (widget.onTagsChanged != null) {
            widget.onTagsChanged!(_selectedTags);
          }
        } else {
          if (widget.createNewTags) {
            createTag(name);
          }
        }
        ref.read(tagsSearchProvider.notifier).clear();
        _tagSearchController.clear();
      }
    }

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
                    child: TapRegion(
                      onTapOutside: (PointerDownEvent event) {
                        final RenderBox? inputBox = _inputKey.currentContext
                            ?.findRenderObject() as RenderBox?;
                        if (inputBox != null) {
                          final Offset inputPosition =
                              inputBox.localToGlobal(Offset.zero);
                          final Size inputSize = inputBox.size;

                          final bool clickedInInput =
                              event.position.dx >= inputPosition.dx &&
                                  event.position.dx <=
                                      inputPosition.dx + inputSize.width &&
                                  event.position.dy >= inputPosition.dy &&
                                  event.position.dy <=
                                      inputPosition.dy + inputSize.height;

                          if (clickedInInput) {
                            return;
                          }
                        }

                        ref.read(tagsSearchProvider.notifier).clear();
                        _focusNode.unfocus();
                      },
                      child: AutoCompleteContianer(
                        width: _inputWidth ?? 200,
                        key: _dropdownKey,
                        onAutocompleteSelected: (tag) {
                          setState(() {
                            _selectedTags.add(tag);
                          });
                          if (widget.onTagsChanged != null) {
                            widget.onTagsChanged!(_selectedTags);
                          }
                          _tagSearchController.clear();
                          ref.read(tagsSearchProvider.notifier).clear();
                        },
                      ),
                    )),
              );
            },
            child: StyledInput(
              controller: _tagSearchController,
              labelText: "Tagi: ",
              hintText: "Dodaj tagi do wyszkuiwania",
              focusNode: _focusNode,
              key: _inputKey,
              onSubmitted: (value) {
                selectOrCreateTag(value);
              },
              onTap: () {
                if (!_focusNode.hasFocus) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    ref.read(tagsSearchProvider.notifier).search(
                        _tagSearchController.text,
                        exclude: _selectedTags);
                  });
                }
              },
              inputFormatters: [
                TextInputFormatter.withFunction((oldValue, newValue) {
                  return newValue.copyWith(text: newValue.text.toLowerCase());
                }),
                FilteringTextInputFormatter.allow(RegExp(r'[a-z0-9_]')),
              ],
              suffixIcon: widget.createNewTags
                  ? IconButton(
                      icon: Icon(FontAwesomeIcons.plus),
                      onPressed: () {
                        selectOrCreateTag(_tagSearchController.text);
                      },
                      style: IconButton.styleFrom(
                        foregroundColor: AppColors.mainColor,
                        elevation: 0,
                      ))
                  : null,
              onChanged: (value) {
                if (value.isNotEmpty) {
                  ref
                      .read(tagsSearchProvider.notifier)
                      .search(value, exclude: _selectedTags);
                } else {
                  ref
                      .read(tagsSearchProvider.notifier)
                      .clear(); // Clear search when input is empty
                }
              },
            ),
          ),
        ),
        const SizedBox(height: 4),
        Container(
          width: double.infinity,
          child: Wrap(
            spacing: 8,
            children: [
              ..._selectedTags.map((tag) {
                return Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 4.0),
                  margin: const EdgeInsets.only(top: 4.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: AppColors.mainColor,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(tag.name,
                          style: GoogleFonts.lato(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: AppColors.whiteColor)),
                      const SizedBox(width: 4),
                      Container(
                        padding: const EdgeInsets.all(0),
                        width: 12,
                        height: 12,
                        alignment: Alignment.center,
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                          icon: Icon(
                            FontAwesomeIcons.xmark,
                            size: 12,
                            color: AppColors.whiteColor,
                          ),
                          onPressed: () {
                            // Handle remove tag action
                            setState(() {
                              _selectedTags.remove(tag);
                            });
                            if (widget.onTagsChanged != null) {
                              widget.onTagsChanged!(_selectedTags);
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ],
          ),
        )
      ],
    );
  }
}

class AutoCompleteContianer extends ConsumerWidget {
  const AutoCompleteContianer(
      {super.key, required this.width, required this.onAutocompleteSelected});

  final void Function(TagsModel) onAutocompleteSelected;

  final double width;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<List<TagsModel>> tags = ref.watch(tagsSearchProvider);

    return Container(
      margin: const EdgeInsets.only(top: 4.0),
      width: width,
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
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final tag = tags[index];
              return ListBody(
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.all(16),
                    ),
                    onPressed: () {
                      // Handle tag selections
                      onAutocompleteSelected(tag);
                    },
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
