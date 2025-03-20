import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kamn/healthy_food_features/data/models/category_data.dart';

class CustomIngredients extends StatelessWidget {
  Category? category;

  CustomIngredients({super.key}); // Accept a single category

  @override
  Widget build(BuildContext context) {
    if (category?.ingredients == null || category!.ingredients!.isEmpty) {
      return const Center(child: Text("No ingredients available"));
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5, // 5 items per row
            childAspectRatio: 1.2,
            crossAxisSpacing: 2,
            mainAxisSpacing: 1,
          ),
          itemCount: category?.ingredients!.length,
          // Use category.ingredients
          itemBuilder: (context, index) {
            return _ingredientItem(category!.ingredients![index]);
          },
        ),
      ],
    );
  }

  Widget _ingredientItem(Category ingredient) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.green[50], // Light green background
            borderRadius: BorderRadius.circular(10),
          ),
          child: SvgPicture.asset(
            ingredient.icon,
            width: 20,
            height: 20,
            fit: BoxFit.contain,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          ingredient.name,
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
