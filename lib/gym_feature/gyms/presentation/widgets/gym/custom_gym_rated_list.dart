import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/gym_feature/gyms/presentation/Cubit/gym_details/gymdetails_cubit.dart';
import 'package:kamn/gym_feature/gyms/presentation/Cubit/gym_details/gymdetails_state.dart';
import 'package:kamn/gym_feature/gyms/presentation/screen/gym_details_screen.dart';
import 'package:kamn/gym_feature/gyms/presentation/widgets/gym/custom_top_rated_item.dart';

class CustomGymRatedList extends StatelessWidget {
  const CustomGymRatedList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GymDetailsCubit, GymDetailsState>(
      builder: (context, state) {
        if (state.allGyms == null) {
          context.read<GymDetailsCubit>().fetchAllGyms();
          return const Center(child: CircularProgressIndicator());
        }

        if (state.allGyms!.isEmpty) {
          return const Center(child: Text('No gyms available'));
        }

        return ListView.separated(
          itemBuilder: (context, index) {
            final gym = state.allGyms![index];

            return CustomTopRatedItem(
              gymDescription: gym.description,
              gymDuration: '6-month',
              gymLocation: gym.address,
              gymName: gym.name,
              gymPrice: '10000',
              gymrate: '4.8',
              gymImage: gym.logoUrl,
              onTap: () {
                context.read<GymDetailsCubit>().fetchGymDetails(gym.id);
                final updatedGym = state.gymDetails;
                print(updatedGym?.scoialMediaLinks);
                context.read<GymDetailsCubit>().getGymFeatures(gym.id);
                context.read<GymDetailsCubit>().getGymPlans(gym.id);
                print(state.gymPlans);

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => GymDetailsScreen(
                              imgs: gym.imagesUrl,
                              logo: gym.logoUrl,
                              location: gym.address,
                              id: gym.id,
                              gymName: gym.name,
                              gymDescription: gym.description,
                              gymLinksList: gym.scoialMediaLinks ?? [],
                            )));
              },
            );
          },
          separatorBuilder: (context, index) => verticalSpace(5.h),
          itemCount: state.allGyms!.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
        );
      },
    );
  }
}
