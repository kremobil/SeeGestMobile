import 'dart:convert';

import 'package:SeeGestMobileApp/classes/user.dart';
import 'package:SeeGestMobileApp/controllers/post_controller.dart';
import 'package:SeeGestMobileApp/controllers/storage_controller.dart';
import 'package:SeeGestMobileApp/models/icon.dart';
import 'package:SeeGestMobileApp/models/tags.dart';
import 'package:SeeGestMobileApp/models/user.dart';
import 'package:SeeGestMobileApp/providers/profileProvider.dart';
import 'package:SeeGestMobileApp/seegest_theme.dart';
import 'package:SeeGestMobileApp/shared/seegest_marker.dart';
import 'package:SeeGestMobileApp/shared/styled_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:SeeGestMobileApp/shared/styled_text.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:widget_to_marker/widget_to_marker.dart';

class Step3 extends ConsumerStatefulWidget {
  const Step3(
      {super.key,
      required this.title,
      required this.date,
      required this.locationName,
      required this.content,
      required this.icon,
      required this.latitide,
      required this.longitude,
      required this.tags});

  final String title;
  final DateTime date;
  final String locationName;
  final String content;
  final IconModel icon;
  final double latitide;
  final double longitude;
  final List<TagsModel> tags;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _Step3State();
}

class _Step3State extends ConsumerState<Step3> {
  bool _isAnnonymous = false;

  late final GoogleMapController _mapController;

  bool mapReady = false;

  late final Marker postMarker;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    createPostMarker().then((marker) {
      setState(() {
        postMarker = marker;
        mapReady = true;
      });
    });
  }

  Future<Marker> createPostMarker() async {
    BitmapDescriptor bitmapDescriptor =
        await SeegestMarker(postIcon: widget.icon).toBitmapDescriptor();

    return Marker(
        markerId: MarkerId(widget.title),
        icon: bitmapDescriptor,
        position: LatLng(widget.latitide, widget.longitude));
  }

  @override
  Widget build(BuildContext context) {
    final AsyncValue<User> userFuture = ref.watch(profileProvider);

    final List<String> _monthNames = [
      "Stycznia",
      "Lutego",
      "Marca",
      "Kwietnia",
      "Maja",
      "Czerwca",
      "Lipca",
      "Sierpnia",
      "Września",
      "Listopada",
      "Grudnia"
    ];

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StyledHeadingText("Podgląd posta"),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  Row(
                    spacing: 32,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      userFuture.when(
                          data: (user) => Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 24,
                                    height: 24,
                                    child: CircleAvatar(
                                      backgroundImage: NetworkImage(_isAnnonymous
                                          ? "https://api.seegest.com/static/images/default_profile.webp"
                                          : user.avatarUrl ??
                                              "https://api.seegest.com/static/images/default_profile.webp"),
                                      backgroundColor: Colors.transparent,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    _isAnnonymous ? "Anonim" : user.name,
                                    style: GoogleFonts.lato(
                                        fontSize: 18,
                                        color: AppColors.mainColor,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ],
                              ),
                          error: (error, stack) => Text(
                                "Nie udało się pobrać profilu",
                                style: GoogleFonts.lato(color: Colors.red),
                              ),
                          loading: () => Text(
                                "Pobieranie danych...",
                                style: GoogleFonts.lato(
                                    fontSize: 14, color: AppColors.mainColor),
                              )),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "${widget.date.day} ${_monthNames[widget.date.month - 1]} ${widget.date.year} | ${widget.date.hour}:${widget.date.minute}",
                            style: GoogleFonts.lato(
                              fontSize: 14,
                              color: AppColors.secondaryColor,
                            ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(
                                FontAwesomeIcons.locationDot,
                                color: AppColors.secondaryColor,
                                size: 18,
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Text(
                                widget.locationName,
                                style: GoogleFonts.lato(
                                    color: AppColors.secondaryColor,
                                    fontSize: 14),
                                overflow: TextOverflow.ellipsis,
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      Image.network(
                        widget.icon.file.url,
                        width: 48,
                        height: 48,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      StyledHeadingText(widget.title)
                    ],
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  StyledBodyText(
                    widget.content,
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: AppColors.mainColor, width: 1),
                        borderRadius: BorderRadius.circular(8)),
                    child: mapReady
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: GoogleMap(
                              initialCameraPosition: CameraPosition(
                                  target:
                                      LatLng(widget.latitide, widget.longitude),
                                  zoom: 16.0),
                              onMapCreated: (controller) {
                                _mapController = controller;
                              },
                              markers: {postMarker},
                            ),
                          )
                        : Center(
                            child: CircularProgressIndicator(),
                          ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Wrap(
                      alignment: WrapAlignment.start,
                      spacing: 8,
                      children: [
                        ...widget.tags.map((tag) => Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 4.0),
                              margin: const EdgeInsets.only(top: 4.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: AppColors.mainColor,
                              ),
                              child: Text(tag.name,
                                  style: GoogleFonts.lato(
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                      color: AppColors.whiteColor)),
                            ))
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Checkbox(
                        value: _isAnnonymous,
                        onChanged: (isAnnonymous) {
                          setState(() {
                            _isAnnonymous = isAnnonymous ?? false;
                          });
                        },
                        activeColor: AppColors.mainColor,
                      ),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              _isAnnonymous = !_isAnnonymous;
                            });
                          },
                          child: StyledBodyTextLarge("Dodaj anonimowo"))
                    ],
                  ),
                ],
              ),
            ),
            StyledFilledButton(
              text: "Dodaj post",
              callback: () async {
                bool success = await PostController.createPost(
                  content: widget.content,
                  createdAt: widget.date,
                  iconId: widget.icon.id,
                  location: widget.locationName,
                  title: widget.title,
                  tagsIds: widget.tags.map((tag) => tag.id).toList(),
                  latitude: widget.latitide,
                  longitude: widget.longitude,
                  isAnonymous: _isAnnonymous,
                );

                if (context.mounted) {
                  if (success) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Pomyślnie utworzono posta!"),
                      showCloseIcon: true,
                      duration: Duration(seconds: 10),
                    ));

                    Navigator.of(context).pop();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                            "Coś poszło nie tak podczas dodawania posta.")));
                  }
                }
              },
              icon: FontAwesomeIcons.circlePlus,
            ),
            const SizedBox(
              height: 16,
            )
          ],
        ),
      ),
    );
  }
}
