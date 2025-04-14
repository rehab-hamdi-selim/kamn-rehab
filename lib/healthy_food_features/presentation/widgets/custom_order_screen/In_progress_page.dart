import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/healthy_food_features/data/models/order_model.dart';
import 'package:kamn/healthy_food_features/presentation/cubit/order_cubit.dart';
import 'package:kamn/healthy_food_features/presentation/widgets/custom_order_screen/custom_card.dart';

class InprogressPage extends StatelessWidget {
  const InprogressPage({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderCubit, OrderState>(builder: (context, state) {
      if (state is OrderLoading) {
        return Center(child: CircularProgressIndicator());
      } else if (state is OrderLoaded) {
        final orders = state.orders;
        return ListView.builder(
            padding: EdgeInsets.only(bottom: 16.h),
            itemCount: orders.length,
            itemBuilder: (context, index) {
              final order = orders[index];
              final meals = orders[index].meals;

              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: CardInProgress(
                  item: order,
                  // meals: meals,
                ),
              );
            });
      } else if (state is OrderFailure) {
        print('Error: ${state.message}');

        return Center(
          child: Text('Error: ${state.message}'),
        );
      } else {
        return Center(child: Text('Unexpected state'));
      }
    });
  }
}
