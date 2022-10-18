import 'package:api_with_cubit/screens/home/home_page.dart';
import 'package:api_with_cubit/screens/signup/cubit/signup_cubit.dart';
import 'package:api_with_cubit/utils/color_resource.dart';
import 'package:api_with_cubit/utils/image_resource.dart';
import 'package:api_with_cubit/utils/string_resource.dart';
import 'package:api_with_cubit/widgets/custom_btn.dart';
import 'package:api_with_cubit/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignupCubit>();
    return SafeArea(
      child: Scaffold(
          body: BlocListener(
        bloc: cubit,
        listener: (context, state) {
          // TODO: implement listener
        },
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(ImageResource.signupBg),
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.4), BlendMode.darken),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: CustomText(
                    StringResource.continueAsGuest,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    textAlign: TextAlign.start,
                    color: ColorResource.textColorW,
                  ),
                ),
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const IntroTexts(),
                  const SizedBox(
                    height: 48,
                  ),
                  Buttuns(
                    color: ColorResource.AppColor,
                    text: StringResource.signIn,
                    textColor: Colors.white,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Buttuns(
                    color: Colors.white.withOpacity(0.8),
                    text: StringResource.signUp,
                    textColor: Colors.black,
                  ),
                  const SizedBox(
                    height: 48,
                  ),
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}

class IntroTexts extends StatelessWidget {
  const IntroTexts({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            StringResource.letsDoSoThing,
            fontWeight: FontWeight.w700,
            fontSize: 44,
            textAlign: TextAlign.start,
            color: ColorResource.textColorW,
          ),
          const SizedBox(
            height: 16,
          ),
          CustomText(
            StringResource.weAreAll,
            fontWeight: FontWeight.w400,
            fontSize: 18,
            color: ColorResource.textColorW,
          ),
        ],
      ),
    );
  }
}

class Buttuns extends StatelessWidget {
  final Color? color;
  final String? text;
  final Color? textColor;
  const Buttuns({Key? key, this.color, this.text, this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultButton(
      color: color,
      textColor: textColor,
      press: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      },
      text: text,
    );
  }
}
