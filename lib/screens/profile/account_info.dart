import 'dart:io';

import 'package:SeeGestMobileApp/controllers/storage_controller.dart';
import 'package:SeeGestMobileApp/providers/profileProvider.dart';
import 'package:SeeGestMobileApp/screens/profile/avatar_upload.dart';
import 'package:SeeGestMobileApp/screens/profile/change_password_form.dart';
import 'package:SeeGestMobileApp/screens/profile/connected_accounts.dart';
import 'package:SeeGestMobileApp/shared/styled_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';

class AccountInfo extends ConsumerStatefulWidget {
  const AccountInfo({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AccountInfoState();
}

class _AccountInfoState extends ConsumerState<AccountInfo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AvatarUpload(),
        const SizedBox(height: 32,),
        ConnectedAccounts(),
        const SizedBox(height: 32,),
        ChangePasswordForm(),
        const SizedBox(height: 32,),
      ],
    );
  }
}
