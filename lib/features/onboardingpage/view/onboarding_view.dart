import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kartal/kartal.dart';
import '../../../core/constant/strings/onboarding_strings.dart';
import '../../../core/theme/color/color_theme.dart';
import '../../../core/widgets/custom_button.dart';
import '../model/onboarding_model.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int selectedSlider = 0;
  PageController sliderController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(flex: 7, child: _builderPageView()),
            Container(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: context.height / 20,
                      vertical: context.width / 20),
                  child: _buildCustomButton(),
                ))
          ],
        ),
      ),
    );
  }

  PageView _builderPageView() {
    return PageView.builder(
      onPageChanged: (index) {
        setState(() {
          selectedSlider = index;
        });
      },
      controller: sliderController,
      itemCount: models.length,
      itemBuilder: (context, index) {
        return _builderColumn(index, context);
      },
    );
  }

  Column _builderColumn(
    int index,
    BuildContext context,
  ) {
    return Column(children: [
      SizedBox(
        height: context.height / 20,
      ),
      _builderSvgPicture(index),
      _buildModelContainer(index, context),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          models.length,
          (index) => buildSliderNav(index: index),
        ),
      ),
    ]);
  }

  SvgPicture _builderSvgPicture(int index) {
    return SvgPicture.asset(
      models[index].image,
      height: context.height / 4,
    );
  }

  Container _buildModelContainer(int index, BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding:
          EdgeInsets.symmetric(vertical: context.height / 10, horizontal: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              models[index].title,
              style: Theme.of(context).textTheme.headline5?.copyWith(
                    color: isDark ? AppColors().white : AppColors().black,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: context.height / 40),
            child: Text(
              models[index].description,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText1?.copyWith(
                  color: isDark ? AppColors().white : AppColors().darkerGrey,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }

  CustomButton _buildCustomButton() {
    return CustomButton(
      func: () {
        if (selectedSlider != (models.length - 1)) {
          sliderController.animateToPage(selectedSlider + 1,
              duration: const Duration(milliseconds: 400),
              curve: Curves.linear);
        }
      },
      isLoading: false,
      text: selectedSlider == models.length - 1
          ? OnBoardingStrings.buttonBasla
          : OnBoardingStrings.buttonIleri,
    );
  }

  AnimatedContainer buildSliderNav({required int index}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.only(right: 5),
      height: context.height * 0.01,
      width: context.height * 0.01,
      decoration: BoxDecoration(
          color: selectedSlider == index
              ? const Color(0XFFff6a6a)
              : const Color(0xFFD7D7D7),
          borderRadius: BorderRadius.circular(5)),
    );
  }
}
