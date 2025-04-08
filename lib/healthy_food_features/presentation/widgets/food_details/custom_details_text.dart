import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomDetailsText extends StatefulWidget {
  final String text;

  const CustomDetailsText({
    super.key,
    required this.text,
  });

  @override
  State<CustomDetailsText> createState() => _CustomDetailsTextState();
}

class _CustomDetailsTextState extends State<CustomDetailsText> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isExpanded = !isExpanded;
        });
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            widget.text,
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: Colors.black54,
            ),
            maxLines: isExpanded ? null : 3,
            overflow: isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
          ),
          if (!isExpanded)
            Text(
              'Show more',
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
              textAlign: TextAlign.end,
            ),
          if (isExpanded)
            Text(
              'Show less',
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
        ],
      ),
    );
  }
}
