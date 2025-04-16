import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/gym_feature/gyms/data/models/gym_model.dart';
import 'package:kamn/gym_feature/gyms/presentation/Cubit/gym_details/gymdetails_cubit.dart';
import 'package:kamn/gym_feature/gyms/presentation/screen/choose_mempership_plan_screen.dart';
import 'package:kamn/gym_feature/gyms/presentation/screen/choose_plan_screen.dart';

class ButtonsRow extends StatelessWidget {
  const ButtonsRow({
    super.key,
    required this.gym,
  });
  final GymModel gym;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => BlocProvider.value(
                            value: context.read<GymDetailsCubit>()
                              ..getGymFeatures(gym.id??""),
                            child:  ChoosePlanScreen(gymModel:gym ,),
                          )));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              minimumSize: const Size(210, 55),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            child: Row(
              spacing: 5,
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Make Your Plan",
                    style: TextStyles.fontCircularSpotify12BlackMedium
                        .copyWith(color: Colors.white, fontSize: 14)),
                const Icon(Icons.add_circle_outline_outlined,
                    color: Colors.white),
              ],
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => BlocProvider.value(
                            value: context.read<GymDetailsCubit>()
                              ..getGymPlans(gym.id??''),
                            child:  ChooseMempershipPlanScreen(gymModel: gym,),
                          )));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              minimumSize: const Size(210, 55),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            child: Text("Select Offer",
                style: TextStyles.fontCircularSpotify14AccentBlackMedium
                    .copyWith(color: Colors.white)),
          ),
        ),
      ],
    );
  }
}
