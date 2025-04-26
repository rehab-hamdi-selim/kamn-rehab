import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomIngredients extends StatelessWidget {
  final List<String> ingredients;

  const CustomIngredients({
    super.key,
    required this.ingredients,
  });

  @override
  Widget build(BuildContext context) {
    if (ingredients.isEmpty) {
      return const Center(child: Text("No ingredients available"));
    }

    return SizedBox(
      height: 80,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: ingredients.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: _ingredientItem(ingredients[index]),
          );
        },
      ),
    );
  }

  Widget _ingredientItem(String ingredient) {
    return Column(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.green[50],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            Icons.restaurant,
            size: 20,
            color: Colors.green[700],
          ),
        ),
        const SizedBox(height: 10),
        Text(
          ingredient,
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            fontSize: 10,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
