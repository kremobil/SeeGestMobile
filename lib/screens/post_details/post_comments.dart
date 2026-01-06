import 'package:SeeGestMobileApp/seegest_theme.dart';
import 'package:SeeGestMobileApp/shared/styled_input.dart';
import 'package:SeeGestMobileApp/shared/styled_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostCommentsScreen extends ConsumerStatefulWidget {
  const PostCommentsScreen({super.key});

  @override
  ConsumerState<PostCommentsScreen> createState() => _PostCommentsScreenState();
}

class _PostCommentsScreenState extends ConsumerState<PostCommentsScreen> {
  bool _showButtons = false;
  FocusNode _focusNode = FocusNode();
  TextEditingController _commentInputController = TextEditingController();

  _focusNodeListener() {
    print(_focusNode.hasFocus);
    setState(() {
      _showButtons = _focusNode.hasFocus;
    });
  }

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_focusNodeListener);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_focusNodeListener);
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      // Row(dwad
      //   children: [
      //     StyledHeadingText('Komentarze'),
      //     Spacer(),
      //     StyledHeadingText("3")
      //   ],
      // ),
      // SizedBox(height: 16),
      StyledInput(
        labelText: "Komentarze",
        additionalLabelWidget: StyledInputLabelText("78"),
        hintText: "Dodaj komentarz",
        focusNode: _focusNode,
        keyboardType: TextInputType.multiline,
        controller: _commentInputController,
        minLines: 1,
        maxLines: 3,
      ),
      SizedBox(height: 8),
      if (_showButtons)
        Row(
          children: [
            SizedBox(
              height: 32,
              child: OutlinedButton(
                onPressed: () {
                  _focusNode.unfocus();
                  setState(() {
                    _showButtons = false;
                  });
                },
                style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    minimumSize: Size.zero,
                    side: BorderSide(color: AppColors.mainColor, width: 1.5),
                    foregroundColor: AppColors.mainColor),
                child: Text(
                  "Anuluj",
                  style: TextStyle(fontSize: 12),
                ),
              ),
            ),
            Expanded(child: SizedBox()),
            SizedBox(
              height: 32,
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    minimumSize: Size.zero,
                    side: BorderSide(color: AppColors.mainColor, width: 1.5),
                    foregroundColor: AppColors.mainColor),
                child: Text(
                  "Dodaj anonimowo",
                  style: TextStyle(fontSize: 12),
                ),
              ),
            ),
            SizedBox(width: 8),
            SizedBox(
              height: 32,
              child: FilledButton(
                onPressed: () {
                  print(_commentInputController.text);
                },
                style: FilledButton.styleFrom(
                    surfaceTintColor: AppColors.mainColor,
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    minimumSize: Size.zero,
                    backgroundColor: AppColors.mainColor),
                child: Text(
                  "Dodaj komentarz",
                  style: TextStyle(fontSize: 12),
                ),
              ),
            ),
          ],
        )
    ]);
  }
}
