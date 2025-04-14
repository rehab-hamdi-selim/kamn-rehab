import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kamn/core/utils/time_picker.dart';
import 'package:kamn/gym_feature/add_gym/presentation/cubits/membership_offer/membership_offer_cubit.dart';
import 'package:kamn/gym_feature/add_gym/presentation/cubits/membership_offer/membership_offer_state.dart';

class CustomTimeDropdown extends StatefulWidget {
  const CustomTimeDropdown({super.key, required this.onChanged, this.title});
  final void Function(TimeOfDay) onChanged;
  final String? title;

  @override
  _CustomTimeDropdownState createState() => _CustomTimeDropdownState();
}

class _CustomTimeDropdownState extends State<CustomTimeDropdown> {
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;
  final GlobalKey _key = GlobalKey();

  String selectedTime = "09:00";

  final times = [
    "12:00",
    "12:30",
    "01:00",
    "01:30",
    "02:00",
    "02:30",
    "03:00",
    "03:30",
    "04:00",
    "04:30",
    "05:00",
    "05:30",
    "06:00",
    "06:30",
    "07:00",
    "07:30",
    "08:00",
    "08:30",
    "09:00",
    "09:30",
    "10:00",
    "10:30",
    "11:00",
    "11:30"
  ];
  bool isAM = true;

  void _showOverlay() {
    _overlayEntry = _createOverlayEntry();
    Overlay.of(context).insert(_overlayEntry!);
  }

  void _hideOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  OverlayEntry _createOverlayEntry() {
    RenderBox renderBox = _key.currentContext!.findRenderObject() as RenderBox;
    final size = renderBox.size;
    final offset = renderBox.localToGlobal(Offset.zero);

    return OverlayEntry(
      builder: (context) => Positioned(
        width: size.width,
        left: offset.dx,
        top: offset.dy + size.height + 5,
        child: CompositedTransformFollower(
          link: _layerLink,
          showWhenUnlinked: false,
          offset: Offset(0, size.height + 5),
          child: Material(
            elevation: 4,
            borderRadius: BorderRadius.circular(12),
            child: Container(
              constraints: BoxConstraints(
                maxHeight: 200,
                maxWidth: size.width,
              ),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: times.map((time) {
                          final isSelected = selectedTime == time;
                          return GestureDetector(
                            onTap: () {
                              setState(() => selectedTime = time);
                              widget.onChanged(parseTimeOfDay(
                                  '$time ${isAM ? "AM" : "PM"}'));
                              _hideOverlay();
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 5.h),
                              child: Text(
                                time,
                                style: TextStyle(
                                  color: isSelected
                                      ? AppPallete.lightGreenColor
                                      : Colors.black,
                                  fontWeight: isSelected
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildAmPmButton("AM", isAM),
                      const SizedBox(height: 8),
                      _buildAmPmButton("PM", !isAM),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAmPmButton(String label, bool selected) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isAM = (label == "AM");
        });
        _overlayEntry?.markNeedsBuild();
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 3),
        decoration: BoxDecoration(
          color: selected
              ? AppPallete.lightGreenColor.withOpacity(.3)
              : AppPallete.ofWhiteColor,
          borderRadius: BorderRadius.circular(15.r),
          border: Border.all(
              color: selected
                  ? AppPallete.lightGreenColor
                  : AppPallete.darkGreyColor,
              width: .2),
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              label == "AM" 
                ? 'assets/icons/sun.svg'
                : 'assets/icons/moon.svg',
              width: 16,
              height: 16,
              color: selected
                  ? AppPallete.lightGreenColor
                  : AppPallete.darkGreyColor,
            ),
            SizedBox(width: 4),
            Text(
              label,
              style: TextStyle(
                color: selected
                    ? AppPallete.lightGreenColor
                    : AppPallete.darkGreyColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: BlocBuilder<MembershipOfferCubit, MembershipOfferState>(
        builder: (context, state) {
          final isDisabled = state.is24Hours;

          return GestureDetector(
            onTap: () {
              if (!isDisabled) {
                if (_overlayEntry == null) {
                  _showOverlay();
                } else {
                  _hideOverlay();
                }
              }
            },
            child: Container(
                key: _key,
                height: 40.h,
                padding: EdgeInsets.symmetric(horizontal: 5.w,),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: isDisabled ? AppPallete.darkGreyColor.withOpacity(0.3) : Colors.grey.shade300,
                  ),
                  borderRadius: BorderRadius.circular(8.r),
                  color: isDisabled ? AppPallete.tooLightGray : AppPallete.whiteColor,
                ),
                child: Row(
                  children: [
                    Icon(Icons.access_time,
                        size: 14.r,
                        color: isDisabled
                            ? AppPallete.darkGreyColor
                            : AppPallete.darkGrayColor),
                    horizontalSpace(4),
                    if (widget.title == "Start time"
                        ? state.startTime == null
                        : state.endTime == null)
                      Text(
                        widget.title ?? 'Time',
                        style: TextStyles.fontCircularSpotify12GrayRegular
                            .copyWith(
                          color: isDisabled
                              ? AppPallete.darkGreyColor
                              : AppPallete.mediumGrayColor,
                        ),
                      ),
                    if (widget.title == "Start time"
                        ? state.startTime != null
                        : state.endTime != null)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            widget.title ?? 'Time',
                            style: TextStyles.fontCircularSpotify8GrayRegular
                                .copyWith(
                              color: isDisabled
                                  ? AppPallete.darkGreyColor
                                  : AppPallete.mediumGrayColor,
                            ),
                          ),
                          Text(
                            '${widget.title== "Start time"?formatTimeOfDay(state.startTime??TimeOfDay.now()):formatTimeOfDay(state.endTime??TimeOfDay.now())} ${isAM ? "AM" : "PM"}',
                            style: TextStyles.fontCircularSpotify10GrayRegular
                                .copyWith(
                              color: isDisabled
                                  ? AppPallete.darkGreyColor
                                  : AppPallete.accentBlackColor,
                            ),
                          ),
                        ],
                      ),
                    Spacer(),
                    if(!isDisabled)
                    Icon(
                      Icons.keyboard_arrow_down,
                      size: 20.r,
                      color:
                          isDisabled ? AppPallete.darkGreyColor : Colors.black,
                    ),
                  ],
                )),
          );
        },
      ),
    );
  }
}
