import 'package:SeeGestMobileApp/models/post.dart';
import 'package:SeeGestMobileApp/screens/post_details/post_comments.dart';
import 'package:SeeGestMobileApp/seegest_theme.dart';
import 'package:SeeGestMobileApp/shared/dashboard_layout.dart';
import 'package:SeeGestMobileApp/shared/seegest_marker.dart';
import 'package:SeeGestMobileApp/shared/styled_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:widget_to_marker/widget_to_marker.dart';

class PostDetailsScreen extends ConsumerStatefulWidget {
  const PostDetailsScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PostDetailsScreenState();
}

class _PostDetailsScreenState extends ConsumerState<PostDetailsScreen> {
  late final GoogleMapController _mapController;

  bool mapReady = false;

  late final Marker postMarker;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Future<Marker> createPostMarker(PostModel post) async {
    BitmapDescriptor bitmapDescriptor =
        await SeegestMarker(postIcon: post.icon).toBitmapDescriptor();

    return Marker(
        markerId: MarkerId(post.title),
        icon: bitmapDescriptor,
        position: LatLng(post.latitude, post.longitude));
  }

  List<String> months = const [
    'Styczenia',
    'Lutego',
    'Marca',
    'Kwietnia',
    'Maja',
    'Czerwca',
    'Lipca',
    'Sierpnia',
    'Września',
    'Października',
    'Listopada',
    'Grudnia'
  ];

  @override
  Widget build(BuildContext context) {
    final post = ModalRoute.of(context)!.settings.arguments as PostModel;

    if (!mapReady) {
      createPostMarker(post).then((marker) {
        setState(() {
          postMarker = marker;
          mapReady = true;
        });
      });
    }

    return DashboardLayout(
        body: SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  const SizedBox(
                    height: 32,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 24,
                            height: 24,
                            child: CircleAvatar(
                              backgroundImage:
                                  NetworkImage(post.author.avatar.url ?? ''),
                              backgroundColor: Colors.transparent,
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                        post.author.name,
                        style: GoogleFonts.lato(
                            fontSize: 18,
                            color: AppColors.mainColor,
                            fontWeight: FontWeight.w700),
                      ),
                        ],
                      ),
                      
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "${post.createdAt.day} ${months[post.createdAt.month - 1]} ${post.createdAt.year} | ${post.createdAt.hour}:${post.createdAt.minute}",
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
                                post.location,
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
                        post.icon.file.url,
                        width: 48,
                        height: 48,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      StyledHeadingText(post.title)
                    ],
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  StyledBodyText(
                    post.content,
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
                                  target: LatLng(post.latitude, post.longitude),
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
                        ...post.tags.map((tag) => Container(
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
                  SizedBox(
                    width: double.infinity,
                    child: PostCommentsScreen(),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            )
          ],
        ),
      ),
    ));
  }
}
