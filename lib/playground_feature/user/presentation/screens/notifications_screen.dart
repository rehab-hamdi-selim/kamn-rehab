import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import '../cubit/notification/notifications_cubit.dart';
import '../cubit/notification/notifications_state.dart';
import '../widgets/notifications/custom_notification_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notifications',
          style: TextStyle(
            color: AppPallete.blackColor,
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: AppPallete.whiteColor,
        elevation: 0,
      ),
      body: BlocBuilder<NotificationsCubit, NotificationsState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppPallete.darkVividVioletColor,
              ),
            );
          }

          if (state.isFailure) {
            return Center(
              child: Text(
                state.errorMessage ?? 'Something went wrong',
                style: TextStyle(
                  color: AppPallete.blackColor,
                  fontSize: 16.sp,
                ),
              ),
            );
          }

          if (state.notifications.isEmpty) {
            return Center(
              child: Text(
                'No notifications',
                style: TextStyle(
                  color: AppPallete.blackColor,
                  fontSize: 16.sp,
                ),
              ),
            );
          }

          return Column(
            children: [
              ListView.builder(
                itemCount: state.notifications.length,
                itemBuilder: (context, index) {
                  final notification = state.notifications[index];
                  return CustomNotificationCard(
                    notification: notification,
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/notification-details',
                        arguments: notification,
                      );
                    },
                  );
                },
              ),
              ElevatedButton(
                onPressed: () async {
                  final firestore = FirebaseFirestore.instance;
                  final notificationsCollection =
                      firestore.collection('notifications');

                  for (int i = 0; i < 50; i++) {
                    await notificationsCollection.add({
                      'title': 'Test Notification $i',
                      'body': 'This is the body of test notification $i.',
                      'timestamp': Timestamp.now(),
                      'isRead': false,
                      'userId':
                          'testUserId', // Replace with actual user ID if needed
                    });
                  }

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('50 notifications added to Firestore')),
                  );
                },
                child: const Text('Add Test Notifications'),
              )
            ],
          );
        },
      ),
    );
  }
}
