import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/healthy_food_features/presentation/cubit/order_cubit.dart';
import 'package:kamn/healthy_food_features/presentation/widgets/custom_track_order/custom_aapp_bar.dart';
import 'package:kamn/healthy_food_features/presentation/widgets/custom_track_order/custom_tab_screen.dart';
import 'package:kamn/healthy_food_features/presentation/widgets/custom_track_order/order-line.dart';

class TrackOrderScreen extends StatefulWidget {
  TrackOrderScreen({super.key, required this.id});
  String id;

  @override
  State<TrackOrderScreen> createState() => _TrackOrderScreenState();
}

class _TrackOrderScreenState extends State<TrackOrderScreen> {
  @override
  void initState() {
    context.read<OrderCubit>().fetchOrderById(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: GestureDetector(
        onTap: () {
          showModalBottomSheet(
            context: context,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            backgroundColor: Color(0xffFFFFFF),
            builder: (context) => Bottom_sheet(
              orderId: widget.id,
            ),
          );
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              const SizedBox(
                height: 16,
              ),
              CustomAppBarTrackOrder(
                onTap: () {},
                screenName: 'Track  Order',
              ),
              const Order_line(),
            ],
          ),
        ),
      ),
    );
  }
}

class Bottom_sheet extends StatelessWidget {
  Bottom_sheet({super.key, required this.orderId});
  String orderId;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 375.w,
        child: CustomTabScreenBtnSheet(
          orderId: orderId,
        ));
  }
}
