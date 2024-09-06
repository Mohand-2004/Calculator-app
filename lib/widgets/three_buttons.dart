import 'package:calculator/core_controller.dart';
import 'package:calculator/my%20packages/keyboard%20widget/models/button_style.dart';
import 'package:calculator/my%20packages/keyboard%20widget/widgets/button.dart';
import 'package:calculator/style/colors.dart';
import 'package:calculator/widgets/boarderd_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ThreeButtons extends StatelessWidget{
  final void Function(String letter) bracketsCommand;
  final void Function(String letter) clearCommand;
  final void Function() deleteCommand;
  const ThreeButtons({super.key,required this.bracketsCommand,required this.clearCommand,required this.deleteCommand});
  @override
  Widget build(BuildContext context){
    return BoarderdContainer(
      padding: EdgeInsets.symmetric(horizontal: 5.w,vertical: 5+1.h),
      margin: EdgeInsets.symmetric(horizontal: 15.w,vertical: 15.h),
      backgroundColor: coreController.theme.backgroundColor,
      boarderColor: coreController.theme.boardersColor,
      height: 53.h,
      radius: 12.r,
      boarderWidth: 2.r,
      child: Row(
        children: [
          Expanded(
            child: Button(
              style: ButtonsStyle(
                buttonBackgroundColor: coreController.theme.buttonsBackgroundColor,
                buttonBoarderColor: coreController.theme.boardersColor,
                buttonBoarderForegroundColor: coreController.theme.buttonsFourgroundBordersColor,
                buttonForegroundColor: coreController.theme.buttonsFourgroundColor,
                buttonRadius: 10.r,
                buttonBoarderWidth: 1.r,
                textStyle: TextStyle(
                  fontSize: 16.sp,
                  color: coreController.theme.textColor,
                )
              ),
              letter: '(',
              command: bracketsCommand,
            ),
          ),
          SizedBox(width: 5.w,),
          Expanded(
            child: Button(
              style: ButtonsStyle(
                buttonBackgroundColor: coreController.theme.buttonsBackgroundColor,
                buttonBoarderColor: coreController.theme.boardersColor,
                buttonBoarderForegroundColor: coreController.theme.buttonsFourgroundBordersColor,
                buttonForegroundColor: coreController.theme.buttonsFourgroundColor,
                buttonRadius: 10.r,
                buttonBoarderWidth: 1.r,
                textStyle: TextStyle(
                  fontSize: 16.sp,
                  color: coreController.theme.textColor,
                )
              ),
              letter: ')',
              command: bracketsCommand,
            ),
          ),
          SizedBox(width: 5.w,),
          Expanded(
            child: Button(
              style: ButtonsStyle(
                buttonRadius: 10.r,
                buttonBoarderWidth: 1.r,
                buttonBackgroundColor: AppColors.orange,
                buttonForegroundColor: AppColors.lightOrange,
                buttonBoarderColor: AppColors.black,
                buttonBoarderForegroundColor: AppColors.lightOrange,
                textStyle: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                )
              ),
              letter: 'C',
              command: clearCommand,
            ),
          ),
          SizedBox(width: 5.w,),
          Expanded(
            child: ElevatedButton(
              onPressed: deleteCommand,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                fixedSize: const Size(double.infinity,100),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                )
              ),
              child: Icon(
                color: Colors.white,
                Icons.disabled_by_default_rounded,
                size: 20.r,
              ),
            )
          ),
        ],
      ),
    );
  }
}