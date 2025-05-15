import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/gym_feature/gyms/presentation/Cubit/Carousel/carousel_cubit.dart';
import 'package:kamn/gym_feature/gyms/presentation/Cubit/Carousel/carousel_state.dart';
import 'package:cached_network_image/cached_network_image.dart';



class ImageStack extends StatelessWidget {
  const ImageStack({
    super.key,
    required this.imgList,
  });

  final List<String> imgList;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 200.0,
            autoPlay: true,
            enlargeCenterPage: true,
            viewportFraction: 1.0,
            onPageChanged: (index, reason) {
              context.read<CarouselPageCubit>().updatePageIndex(index);
            },
          ),
          items: imgList
              .map((item) => Center(
                child: ColorFiltered(
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.2),
                    BlendMode.darken,
                  ),
                  child: CachedNetworkImage(
                    imageUrl: item,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  ),
                ),
              ))
              .toList(),
        ),
        Positioned(
          bottom: 10,
          left: 150,
          right: 150,
          child: BlocBuilder<CarouselPageCubit, CarouselPageState>(
            builder: (context, state) {
              return Container(
                width: 60,
                height: 25,
                decoration: BoxDecoration(
                  color: const Color(0xffa8adad).withOpacity(0.8),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: imgList.asMap().entries.map((entry) {
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 1000),
                      curve: Curves.easeInOut,
                      width: state.currentIndex == entry.key ? 25 : 15.0,
                      height: 15.0,
                      margin: const EdgeInsets.symmetric(horizontal: 4.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 2,
                          color: state.currentIndex == entry.key
                              ? Colors.transparent
                              : Colors.white,
                        ),
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(10),
                        color: state.currentIndex == entry.key
                            ? Colors.white
                            : const Color(0xffa8adad),
                      ),
                    );
                  }).toList(),
                ),
              );
            },
          ),
        ),
        const Positioned(
            top: 50,
            right: 20,
            child: Icon(
              Icons.bookmark_border,
              color: Colors.white,
              size: 40,
              weight: 20,
            )),
        Positioned(
            top: 50,
            left: 20,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black,
                  border: Border.all(color: Colors.white),
                ),
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
            ))
      ],
    );
  }
}
