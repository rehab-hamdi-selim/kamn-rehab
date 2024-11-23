import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/const/constants.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/features/admin/data/data_source/second_page_data_source.dart';
import 'package:kamn/features/admin/data/repository/second_page_repository.dart';
import 'package:kamn/features/admin/presentation/cubits/second_page_cubit/second_page_cubit.dart';
import 'package:kamn/features/admin/presentation/cubits/second_page_cubit/second_page_state.dart';
import 'package:kamn/features/admin/presentation/widgets/second_page/custom_analytics_chart.dart';
import 'package:kamn/features/admin/presentation/widgets/second_page/custom_text_app_bar.dart';
import 'package:kamn/features/admin/presentation/widgets/second_page/custom_expacted_earning_chart.dart';
import 'package:kamn/features/admin/presentation/widgets/second_page/custom_income_outcome_item.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SecondPageCubit>(
        create: (context) => SecondPageCubit(
            repository: SecondPageRepositoryImpl(
                secondPageDataSource: SecondPageDataSourceImpl(
                    firestore: FirebaseFirestore.instance)))
          ..getChartData(),
        child: BlocBuilder<SecondPageCubit, SecondPageState>(
          builder: (context, state) {
            return Scaffold(
              backgroundColor: AppPallete.whiteColor,
              appBar: CustomTextAppBar.appBar(
                notificationIconFunction: () {},
                profileFunction: () {},
                badgesIconFunction: () {},
                titleWidget: Padding(
                  padding: EdgeInsets.only(left: 15.w),
                  child: Text(
                    Constants.financialReports,
                    style: TextStyles.fontRoboto24MediumBlack,
                  ),
                ),
              ),
              body: state is GetChartDataLoading
                  ? const Center(child: CircularProgressIndicator())
                  : SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Center(
                          child: Column(
                            children: [
                              const CustomExpactedEarningChart(),
                              const CustomAnalyticsChart(),
                              verticalSpace(18.h),
                              InkWell(
                                onTap: () {
                                  SecondPageCubit.get(context).getChartData();
                                },
                                child: const CustomIncomeOutcomeItem(
                                  text: 'Income',
                                  money: '345,334 EGP',
                                  increase: -2,
                                ),
                              ),
                              verticalSpace(18.h),
                              const CustomIncomeOutcomeItem(
                                text: 'outcome',
                                money: '15,334 EGP',
                                increase: 2.6,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
            );
          },
        ));
  }
}
