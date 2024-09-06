import 'package:calculator/core_controller.dart';
import 'package:calculator/my%20packages/keyboard%20widget/models/button_style.dart';
import 'package:calculator/models/switcher_style.dart';
import 'package:calculator/my%20packages/keyboard%20widget/widgets/keyboard_widget.dart';
import 'package:calculator/style/colors.dart';
import 'package:calculator/widgets/boarderd_container.dart';
import 'package:calculator/widgets/mode_switcher.dart';
import 'package:calculator/widgets/three_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class HomePage extends StatefulWidget{
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: coreController.theme.backgroundColor,
      body: Column(
        children: [
          // top space
          SizedBox(height: 33.h,),

          // mode switcher
          ModeSwitcher(
            height: 40.h,
            width: 150.w,
            switchCommand: (){
              setState(() {
                coreController.switchMode();
              });
            },
            style: SwitcherStyle(
              radius: 12.r,
              boarderColor: coreController.theme.boardersColor,
              backgroundColor: coreController.theme.buttonsBackgroundColor,
              activeIconColor: coreController.theme.equalButtonColor,
              disabledIconColor: AppColors.grey,
              dividerColor: coreController.theme.boardersColor,
            ),
          ),

          // space between
          SizedBox(height: 12.h,),

          // screen widget
          Expanded(
            flex: 25,
            child: BoarderdContainer(
              margin: EdgeInsets.symmetric(horizontal: 12.w),
              padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 18.h),
              backgroundColor: coreController.theme.screenBackgroundColor,
              boarderColor: coreController.theme.boardersColor,
              radius: 20.r,
              boarderWidth: 2.r,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    coreController.equation,
                    style: TextStyle(
                      fontSize: 25.sp,
                      color: coreController.theme.textColor,
                    ),
                  ),
                  Text(
                    coreController.result,
                    style: TextStyle(
                      fontSize: 19.sp,
                      color: coreController.theme.textColor,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // tree buttons widget
          ThreeButtons(
            bracketsCommand: (letter){
              setState((){
                coreController.addToEquation(letter);
              });
            }, 
            clearCommand: (letter){
              setState((){
                coreController.resetEquation();
              });
            },
            deleteCommand: (){
              setState((){
                coreController.removeFromEquation();
              });
            },
          ),

          // keyboard widget
          Expanded(
            flex: 75,
            child: KeyboardWidget(
              submitCommand: (letter){
                setState((){
                  if(letter == '='){
                    coreController.calculate();
                  }
                  else{
                    coreController.addToEquation(letter);
                  }
                });
              },
              boarderColor: coreController.theme.backgroundColor,
              backgroundColor: coreController.theme.backgroundColor,
              spaceBetweenRows: 8.h,
              buttonsStyle: ButtonsStyle(
                buttonBackgroundColor: coreController.theme.buttonsBackgroundColor,
                buttonBoarderColor: coreController.theme.boardersColor,
                buttonBoarderForegroundColor: coreController.theme.buttonsFourgroundBordersColor,
                buttonForegroundColor: coreController.theme.buttonsFourgroundColor,
                buttonRadius: 15.r,
                buttonBoarderWidth: 1.r,
                spaceBetweenButtons: 5,
                textStyle: TextStyle(
                  color: coreController.theme.textColor,
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold,
                )
              ),
            ),
          ),

          // buttom space
          SizedBox(height: 40.h,),
        ],
      )
    );
  }
}