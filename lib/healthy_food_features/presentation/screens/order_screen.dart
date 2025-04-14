import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/common/cubit/app_user/app_user_cubit.dart';
import 'package:kamn/healthy_food_features/presentation/cubit/order_cubit.dart';
import 'package:kamn/healthy_food_features/presentation/widgets/custom_order_screen/custom_app_bar.dart';
import 'package:kamn/healthy_food_features/presentation/widgets/custom_order_screen/custom_tap_bar.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  void initState() {
    super.initState();
    final userId = context.read<AppUserCubit>().state.user!.uid;
    context.read<OrderCubit>().fetchOrders(userId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          children: [
            CustomAppBar(),
            CustomTabScreen(),
          ],
        ),
      ),
    );
  }
}
