import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/home_cooked__features/data/models/meals_model.dart';
import 'package:kamn/home_cooked__features/presentation/cubits/meal_review_cubit/meal_cubit.dart';
import 'package:kamn/home_cooked__features/presentation/screen/add_meal_pop_up_screen.dart';
import 'package:kamn/home_cooked__features/presentation/screen/food_etails_info_screen.dart';

class AddMealTest extends StatelessWidget {
  const AddMealTest({super.key});

  @override
  Widget build(BuildContext context) {    
    final cubit = context.read<MealCubit>();

    void navigateToEditMealScreen(MealModel mealModel) {
    cubit.selectedMeal(mealModel);
    Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => BlocProvider.value(
                      value: cubit,
                      child: EditMealScreen(),
                    ),
                  ));
    }

//     void navigateToEditMealScreen(MealModel meal) {
//   context.read<MealCubit>().selectedMeal(meal); // Store in cubit
//   Navigator.of(context).push(MaterialPageRoute(
//     builder: (context) => BlocProvider.value(
//       value: context.read<MealCubit>(), // Use the same cubit
//       child: EditMealScreen(),
//     ),
//   ));
// }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Meal'),
      ),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    isScrollControlled:
                        true, // Allows the bottom sheet to take full height
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20.r)),
                    ),
                    builder: (context) => BlocProvider.value(
                          value: cubit,
                          child: AddMealPopUpScreen(),
                        ));
              },
              child: const Text("Add Meal")),
          Expanded(
              child: ListView.builder(
            itemCount: cubit.state.myMeals!.length,
            itemBuilder: (context, index) {
              final meal = cubit.state.myMeals![index];
              return InkWell(
                onTap: () => navigateToEditMealScreen(meal),
                child: SizedBox(
                  width: double.infinity,
                  height: 200.h,
                  child: Text(meal.name),
                ),
              );
            },
          ))
        ],
      ),
    );
  }
}
