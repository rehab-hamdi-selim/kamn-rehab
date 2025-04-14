import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:injectable/injectable.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/healthy_food_features/presentation/cubit/order_cubit.dart';
import 'package:kamn/healthy_food_features/presentation/widgets/custom_order_screen/custom_card.dart';
import 'package:kamn/healthy_food_features/presentation/widgets/custom_order_screen/custom_history_card.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderCubit, OrderState>(
      builder: (context, state) {
        if (state is OrderLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is OrderLoaded) {
          final orders = state.orders;
          if (orders.isEmpty) {
            return Center(child: Text('لا يوجد طلبات حالياً.'));
          }
          return ListView.builder(
              padding: EdgeInsets.only(bottom: 16.h),
              itemCount: 4,
              itemBuilder: (context, index) {
                final order = orders[index];

                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: CardHistory(
                    item: order,
                    index: index,
                  ),
                );
              });
        }
        return Center(child: Text('Unexpected state'));
      },
    );
  }
}
