import 'package:calculator/core_controller.dart';
import 'package:calculator/models/switcher_style.dart';
import 'package:calculator/style/app_themes.dart';
import 'package:calculator/widgets/boarderd_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class ModeSwitcher extends StatelessWidget{
  final double? height;
  final double? width;
  final void Function() switchCommand;
  late SwitcherStyle style;
  ModeSwitcher({super.key,required this.switchCommand,SwitcherStyle? style,this.height,this.width}){
    if(style != null){
      this.style = style;
    }
    else{
      this.style = SwitcherStyle();
    }
  }
  @override
  Widget build(BuildContext context) {
    return BoarderdContainer(
      height: height,
      width: width,
      backgroundColor: style.backgroundColor,
      boarderColor: style.boarderColor,
      boarderWidth: style.boarderWidth,
      radius: style.radius,
      padding: EdgeInsets.symmetric(horizontal: 5.w,vertical: 5.w),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: switchCommand, 
              child: Icon(
                color: coreController.theme == AppThemes.light ? style.activeIconColor : style.disabledIconColor,
                Icons.sunny,
                size: 15.r,
              )
            ),
          ),

          SizedBox(
            height: double.infinity,
            width: 10,
            child: VerticalDivider(
              color: style.dividerColor,
              thickness: 2.sp,
            ),
          ),

          Expanded(
            child: GestureDetector(
              onTap: switchCommand, 
              child: Icon(
                color: coreController.theme == AppThemes.dark ? style.activeIconColor : style.disabledIconColor,
                Icons.dark_mode_rounded,
                size: 15.r,
              )
            ),
          ),
        ],
      ),

    );
  }
}