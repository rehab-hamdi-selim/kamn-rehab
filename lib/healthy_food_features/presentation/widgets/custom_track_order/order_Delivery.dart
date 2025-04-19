import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:injectable/injectable.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/healthy_food_features/data/models/order_model.dart';
import 'package:kamn/healthy_food_features/presentation/cubit/order_cubit.dart';
import 'package:kamn/healthy_food_features/presentation/widgets/custom_track_order/custom_card_track_order.dart';

class OrderDelivery extends StatefulWidget {
  OrderDelivery({
    super.key,
  });

  @override
  State<OrderDelivery> createState() => _OrderDeliveryState();
}

class _OrderDeliveryState extends State<OrderDelivery> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderCubit, OrderState>(
      builder: (context, state) {
        if (state is OrderLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is SingleOrderLoaded) {
          final order = state.order;
          final meals = order.meals;

          return SingleChildScrollView(
            child: Column(
              children: [
                const ResturantCard(),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: meals.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CustomCardTrackOrder(
                      item: meals[index],
                    );
                  },
                )
              ],
            ),
          );
        } else if (state is OrderFailure) {
          return Center(
            child: Text('Error: ${state.message}'),
          );
        } else {
          return Center(child: Text('Unexpected state'));
        }
      },
    );
  }
}

class ResturantCard extends StatelessWidget {
  const ResturantCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 315.w,
      height: 83.h,
      child: Row(
        children: [
          SizedBox(
            width: 103.w,
            height: 83.h,
            child: Image.asset('assets/images/resturantTest.png'),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 22.h, horizontal: 8.w),
            child: Column(
              children: [
                Text(
                  'House of Diet',
                  style: TextStyles.circularSpotify16BoldDarkBlack,
                ),
                Text(
                  'Ordered At: Aug 14 . 8:11 AM',
                  style: TextStyles.circularSpotify10LightGrey,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
