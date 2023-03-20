import 'package:clean_kochi_test/test_screens/home.dart';
import 'package:onboarding/onboarding.dart';
import 'package:flutter/material.dart';
/* import 'package:sk_onboarding_screen/sk_onboarding_screen.dart';
import 'package:sk_onboarding_screen/sk_onboarding_model.dart'; */

class OnBoard extends StatefulWidget {
  const OnBoard({super.key});

  @override
  State<OnBoard> createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> {
  late Material materialButton;
  late int index;

  final onboardingPagesList = [
    PageModel(
      widget: Column(
        children: [
          Container(
              padding: EdgeInsets.only(bottom: 45.0),
              child: Image.asset('assets/images/onBoarding1.svg',
                  color: pageImageColor)),
          Container(
              width: double.infinity,
              child: Text('Welcome to our waste managemt app',
                  style: pageTitleStyle)),
          /* Container(
            width: double.infinity,
            child: Text(
              'A Healthy Atmosphere Created at Your Place, every single day!',
              style: pageInfoStyle,
            ),
          ), */
        ],
      ),
    ),
    PageModel(
      widget: Column(
        children: [
          Image.asset('assets/images/onBoarding2.svg', color: pageImageColor),
          Text('A Healthy Atmosphere Created at your place every single day',
              style: pageTitleStyle),
          /* Text(
            'Give others access to any file or folder you choose',
            style: pageInfoStyle,
          ) */
        ],
      ),
    ),
    PageModel(
      widget: Column(
        children: [
          Image.asset('assets/images/onBoarding3.svg', color: pageImageColor),
          Text('How to use', style: pageTitleStyle),
          Column(
            children: <Widget>[
              new ListTile(
                leading: new MyBullet(),
                title: new Text(
                    'Create an account with your E-mail or phone number'),
              ),
              new ListTile(
                leading: new MyBullet(),
                title: new Text('Select a plan'),
              ),
              new ListTile(
                leading: new MyBullet(),
                title: new Text('Update your daily activity'),
              )
            ],
          )
        ],
      ),
    ),
  ];

  @override
  void initState() {
    super.initState();
    materialButton = _skipButton();
    index = 0;
  }

  Material _skipButton({void Function(int)? setIndex}) {
    return Material(
      borderRadius: defaultSkipButtonBorderRadius,
      color: defaultSkipButtonColor,
      child: InkWell(
        borderRadius: defaultSkipButtonBorderRadius,
        onTap: () {
          if (setIndex != null) {
            index = 2;
            setIndex(2);
          }
        },
        child: const Padding(
          padding: defaultSkipButtonPadding,
          child: Text(
            'Skip',
            style: defaultSkipButtonTextStyle,
          ),
        ),
      ),
    );
  }

  Material get _signupButton {
    return Material(
      borderRadius: defaultProceedButtonBorderRadius,
      color: defaultProceedButtonColor,
      child: InkWell(
        borderRadius: defaultProceedButtonBorderRadius,
        onTap: () {},
        child: const Padding(
          padding: defaultProceedButtonPadding,
          child: Text(
            'Sign up',
            style: defaultProceedButtonTextStyle,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        body: Onboarding(
          pages: onboardingPagesList,
          onPageChange: (int pageIndex) {
            index = pageIndex;
          },
          startPageIndex: 0,
          footerBuilder: (context, dragDistance, pagesLength, setIndex) {
            return DecoratedBox(
              decoration: BoxDecoration(
                color: background,
                border: Border.all(
                  width: 0.0,
                  color: background,
                ),
              ),
              child: ColoredBox(
                color: background,
                child: Padding(
                  padding: const EdgeInsets.all(45.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomIndicator(
                        netDragPercent: dragDistance,
                        pagesLength: pagesLength,
                        indicator: Indicator(
                          indicatorDesign: IndicatorDesign.line(
                            lineDesign: LineDesign(
                              lineType: DesignType.line_uniform,
                            ),
                          ),
                        ),
                      ),
                      index == pagesLength - 1
                          ? _signupButton
                          : _skipButton(setIndex: setIndex)
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class MyBullet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 15.0,
      width: 15.0,
      decoration: new BoxDecoration(
        color: Colors.black,
        shape: BoxShape.circle,
      ),
    );
  }
}
