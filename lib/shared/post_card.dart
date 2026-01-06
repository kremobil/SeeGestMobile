import 'package:SeeGestMobileApp/models/post.dart';
import 'package:SeeGestMobileApp/seegest_theme.dart';
import 'package:SeeGestMobileApp/shared/styled_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class PostCard extends StatelessWidget {
  const PostCard({super.key, required this.post});

  final PostModel post;

  final List<String> months = const [
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
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/postDetails', arguments: post);
      },
      child: Card(
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          color: AppColors.whiteColor,
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(post.author.avatar.url ?? ''),
                      radius: 12,
                    ),
                    const SizedBox(width: 4),
                    Text(post.author.name,
                        style: GoogleFonts.lato(
                            color: AppColors.mainColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w600)),
                    const SizedBox(width: 8),
                    Text(
                        "${post.createdAt.day} ${months[post.createdAt.month - 1]} ${post.createdAt.year} | ${post.createdAt.hour.toString().padLeft(2, '0')}:${post.createdAt.minute.toString().padLeft(2, '0')}",
                        style: GoogleFonts.lato(
                            color: AppColors.secondaryColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w400)),
                    const Expanded(child: SizedBox()),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        FontAwesomeIcons.ellipsis,
                        color: AppColors.mainColor,
                        size: 24,
                      ),
                      constraints: BoxConstraints(),
                      padding: EdgeInsets.all(4),
                    )
                  ],
                ),
                // const SizedBox(height: 4),
                SizedBox(
                  width: double.infinity,
                  child: Wrap(
                    direction: Axis.horizontal,
                    alignment: WrapAlignment.spaceBetween,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: 8,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.network(post.icon.file.url ?? '',
                              width: 32, height: 32, fit: BoxFit.contain),
                          const SizedBox(width: 8),
                          Text(
                            post.title,
                            style: GoogleFonts.lato(
                                color: AppColors.mainColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w700),
                          )
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(FontAwesomeIcons.locationDot,
                              color: AppColors.secondaryColor, size: 14),
                          const SizedBox(width: 4),
                          Text(post.location,
                              style: GoogleFonts.lato(
                                  color: AppColors.secondaryColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400)),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                Text(post.content,
                    style: GoogleFonts.lato(
                        color: AppColors.mainColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w400), textAlign: TextAlign.justify,),
                const SizedBox(height: 8),
                SizedBox(
                  width: double.infinity,
                  child: Wrap(
                    spacing: 4,
                    children: post.tags
                        .map((tag) => Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 4.0),
                              decoration: BoxDecoration(
                                color: AppColors.mainColor,
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              child: Text(tag.name,
                                  style: GoogleFonts.lato(
                                      color: AppColors.whiteColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400)),
                            ))
                        .toList(),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
