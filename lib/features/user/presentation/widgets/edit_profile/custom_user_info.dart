import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/common/cubit/app_user/app_user_cubit.dart';
import 'package:kamn/features/user/presentation/cubit/edit_profile/edit_profile_cubit.dart';

class CustomUserInfo extends StatelessWidget {
  const CustomUserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit=context.read<EditProfileCubit>();
    final user=context.watch<AppUserCubit>().state.user;
    return Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("  Username", style: TextStyle(color: Colors.grey)),
                TextField(
                  controller: cubit.nameController,
                  decoration:  InputDecoration(
                    hintText: user?.name??'',
                    border: InputBorder.none,
                  ),
                ),
                const Divider(),
                const Text("YOUR EMAIL", style: TextStyle(color: Colors.grey)),
                TextField(
                  enabled: false,
                  controller: cubit.emailController,
                  decoration:  InputDecoration(
                    hintText: user?.email??'',
                    border: InputBorder.none,
                  ),
                ),
                const Divider(),
                const SizedBox(height: 16),
                const Text("YOUR PHONE", style: TextStyle(color: Colors.grey)),
                TextField(
                  controller: cubit.phoneController,
                  keyboardType: TextInputType.phone,
                  decoration:  InputDecoration(
                    hintText: user?.phoneNumber??'',
                    border: InputBorder.none,
                  ),
                ),
                const Divider(),
                const SizedBox(height: 16),
                const Text("CITY, STATE", style: TextStyle(color: Colors.grey)),
                TextField(
                  controller: cubit.cityController,
                  decoration:  InputDecoration(
                    hintText:user?.city??'' ,
                    border: InputBorder.none,
                  ),
                ),
                const Divider(),
              ],
            ),
          );
  }
}