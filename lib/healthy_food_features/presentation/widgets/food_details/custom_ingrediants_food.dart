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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5,
            childAspectRatio: 1.2,
            crossAxisSpacing: 2,
            mainAxisSpacing: 1,
          ),
          itemCount: ingredients.length,
          itemBuilder: (context, index) {
            return _ingredientItem(ingredients[index]);
          },
        ),
      ],
    );
  }

  Widget _ingredientItem(String ingredient) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
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
        const SizedBox(height: 6),
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
