import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomDetailsText extends StatefulWidget {
  const CustomDetailsText({super.key});

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
            'A delicious grilled chicken salad packed with vibrant greens, colorful vegetables, and topped with a light vinaigrette. The tender chicken adds a lean source of protein, while the mix of nuts and seeds provides healthy fats and essential micronutrients.',
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
