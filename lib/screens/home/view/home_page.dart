import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travelrent/core/constants/colors_const.dart';
import 'package:travelrent/extensions/context_extension.dart';
import 'package:travelrent/screens/home/cubit/home_cubit.dart';
import 'package:travelrent/widgets/text_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            Container(
              height: context.h * 0.421,
              width: context.w,
              decoration: const BoxDecoration(
                  // color: Colors.red,
                  image: DecorationImage(
                      image: AssetImage("assets/images/homebackground.png"),
                      fit: BoxFit.cover)),
              child: Stack(children: [
                Positioned(
                  top: context.h * 0.04859,
                  right: context.w * 0.1028,
                  child: dropButton(context),
                ),
                Positioned(
                  top: context.h * 0.044,
                  left: context.w * 0.0747,
                  child: CircleAvatar(
                      radius: context.w * 0.06,
                      backgroundImage:
                          AssetImage("assets/images/circleavatar.png")),
                ),
                Positioned(
                  top: context.h * 0.1738,
                  left: context.w * 0.06,
                  child: StyledText.styledText("hello".tr(), 20.0,
                      color: ColorConst.kwhiteColor),
                ),
                Positioned(
                  top: context.h * 0.23,
                  left: context.w * 0.06,
                  child: StyledText.styledText("find the best place here".tr(), 25.0,
                      color: ColorConst.kwhiteColor,
                      fontWeight: FontWeight.bold
                      ),
                ),
              ]),
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FloatingActionButton(onPressed: () {
              // context.locale  = Locale("uz", 'UZ');
              context.setLocale(Locale("uz", 'UZ'));
              setState(() {});
            }),
            FloatingActionButton(onPressed: () {
              context.setLocale(Locale("en", 'US'));
              setState(() {});
            })
          ],
        ));
  }

  DropdownButtonHideUnderline dropButton(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: Center(
        child: DropdownButton(
            elevation: 0,
            iconSize: 10,
            icon: SvgPicture.asset(
              'assets/icons/Category.svg',
              color: Colors.white,
            ),
            items: [
              DropdownMenuItem(
                value: 'uz',
                child: Text(
                  "Uz",
                  style: TextStyle(color: ColorConst.kbottomNavigationColor),
                ),
              ),
              DropdownMenuItem(
                value: 'en',
                child: Text(
                  "En",
                  style: TextStyle(color: ColorConst.kbottomNavigationColor),
                ),
              ),
            ],
            onChanged: (v) async {
              // value = v.toString();
              if (v == 'uz') {
                // ChangeLocale().changeLocalization(context, 'uz', 'UZ');
                context
                    .read<HomeCubit>()
                    .changeLocalization(context, 'uz', 'UZ');
              } else {
                // ChangeLocale().changeLocalization(context, 'en', 'US');
                context
                    .read<HomeCubit>()
                    .changeLocalization(context, 'en', 'US');
              }
              // await context.read<HomeCubit>().signInUser();
              // setState(() {});
            }),
      ),
    );
  }
}
