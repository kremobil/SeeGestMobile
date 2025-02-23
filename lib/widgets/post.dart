import 'package:flutter/material.dart';

class PostWidget extends StatefulWidget {
  final String profileImageUrl;
  final String userName;
  final String time;
  final String title;
  final String location;
  final String content;
  final List<String> tags;

  const PostWidget({
    super.key,
    required this.profileImageUrl,
    required this.userName,
    required this.time,
    required this.title,
    required this.location,
    required this.content,
    required this.tags,
  });

  @override
  _PostWidgetState createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0), // Add 16px bottom margin
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0), // 8px border radius
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(121, 107, 107, 107), // Add a shadow around the post
              spreadRadius: 2.0, // Spread the shadow by 2px
              blurRadius: 2.0, // Soften the shadow by 4px
              offset: const Offset(0, 4), // Offset the shadow by 2px
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(widget.profileImageUrl),
                      radius: 16.0, // Small profile picture
                    ),
                    const SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              widget.userName,
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              widget.time,
                              style: const TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                IconButton(
                  icon: const Icon(Icons.more_horiz_outlined),
                  onPressed: () {
                    // Define the action when the three dots are pressed
                  },
                ),
              ],
            ),
            const SizedBox(height: 4), // Reduce the height to make rows closer
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.mic_external_off, size: 18.0), // Add an icon before the title
                    const SizedBox(width: 4), // Add some space between the icon and the title
                    Text(
                      widget.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18.0,
                      ),
                    ),
                  ],
                ),
                Text(
                  widget.location,
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(height: 4), // Add some space before the content
            Text(
              widget.content,
              maxLines: 4, // Limit the content to 4 lines
              overflow: TextOverflow.ellipsis, // Add ellipsis if the content exceeds 4 lines
              style: const TextStyle(color: Colors.black),
            ),
            const SizedBox(height: 4), // Add some space before the tags
            Wrap(
              spacing: 4.0, // Space between tags
              runSpacing: 4.0, // Space between lines of tags
              children: widget.tags.map((tag) => Chip(
                label: Text(
                  tag,
                  style: const TextStyle(
                    fontSize: 10.0, // Set the font size to 10.0
                  ),
                ),
                backgroundColor: const Color(0xFF162968), // Set the background color to blue
                labelStyle: const TextStyle(color: Colors.white), // Set the text color to white
                padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 0.0), // Adjust padding
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap, // Reduce the size of the chip
                visualDensity: VisualDensity.compact, // Make the chip more compact
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0), // Set the border radius to half the height
                ),
              )).toList(),
            ),
          ],
        ),
      ),
    );
  }
}