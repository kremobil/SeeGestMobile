import 'dart:io';

import 'package:SeeGestMobileApp/controllers/storage_controller.dart';
import 'package:SeeGestMobileApp/providers/profileProvider.dart';
import 'package:SeeGestMobileApp/shared/styled_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';

class AvatarUpload extends ConsumerWidget {
  const AvatarUpload({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StyledFilledButton(
          text: "Zmień zdjęcie profilowe",
          icon: Icons.image_outlined,
          callback: () async {
            final ImagePicker picker = ImagePicker();
            final XFile? image =
                await picker.pickImage(source: ImageSource.gallery);
            if (image == null) return;
            final File file = File(image.path);

            final request = MultipartRequest(
                "POST", Uri.parse("https://api.seegest.com/upload-avatar"));

            request.files.add(await MultipartFile.fromPath(
              'image', // nazwa pola w formularzu
              image.path,
              filename: image.name, // opcjonalne, ale zalecane
            ));

            request.headers.addAll({
              "Authorization": "Bearer ${await StorageController().getToken()}",
              "Accept": "application/json",
              "Content-Type": "multipart/form-data",
            });

            // Wyślij żądanie
            try {
              final response = await request.send();
              print('Status code: ${response.statusCode}');

              // DODAJ TO - sprawdź co zwraca serwer
              final responseBody = await response.stream.bytesToString();
              print('Response body: $responseBody');

              if (response.statusCode == 201) {
                print('Upload successful');
                ref.read(profileProvider.notifier).fetchProfile();
              } else {
                print('Upload failed');
              }
            } catch (e) {
              print('Error: $e');
            }
          },
        );
  }
}