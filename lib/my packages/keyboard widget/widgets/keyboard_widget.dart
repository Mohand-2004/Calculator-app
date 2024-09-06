import 'package:calculator/core_controller.dart';
import 'package:calculator/my%20packages/keyboard%20widget/models/button_style.dart';
import 'package:calculator/my%20packages/keyboard%20widget/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


// ignore: must_be_immutable
class KeyboardWidget extends StatelessWidget{
  final double? width;
  final double? height;
  final double radius;
  final double boarderWidth;
  final double spaceBetweenRows;
  final EdgeInsetsGeometry? margin;
  final Color? boarderColor;
  final Color? backgroundColor;
  late ButtonsStyle? buttonsStyle;
  final void Function(String letter) submitCommand;
  final List<String> _letters1 = ['7','8','9','+'];
  final List<String> _letters2 = ['4','5','6','-'];
  final List<String> _letters3 = ['1','2','3','×'];
  final List<String> _letters4 = ['0','.','=','÷'];
  KeyboardWidget(
    {
      super.key,
      required this.submitCommand,
      this.height = 200,
      this.width = double.infinity,
      this.backgroundColor = Colors.white,
      this.boarderColor = Colors.black,
      this.radius = 20,
      this.boarderWidth = 3,
      this.spaceBetweenRows = 10,
      this.buttonsStyle,
      this.margin,
    }
  ){
    buttonsStyle ??= ButtonsStyle();
  }
  @override
  Widget build(BuildContext context){
    return Container(
      margin: margin,
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: boarderColor,
        borderRadius: BorderRadius.circular(radius),
      ),
      padding: EdgeInsets.all(boarderWidth),
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(radius-boarderWidth),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w,),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Row(
                  children: _letters1.map((letter) => Expanded(
                    child: Button(
                      command: submitCommand,
                      letter: letter,
                      style: !(letter == '+' || letter == '-' || letter == '×' || letter == '÷') ? buttonsStyle : 
                      ButtonsStyle(
                        buttonRadius: buttonsStyle!.buttonRadius,
                        spaceBetweenButtons: buttonsStyle!.spaceBetweenButtons,
                        buttonBoarderWidth: buttonsStyle!.buttonBoarderWidth,
                        buttonBackgroundColor: buttonsStyle!.buttonBackgroundColor,
                        buttonBoarderColor: buttonsStyle!.buttonBoarderColor,
                        buttonBoarderForegroundColor: buttonsStyle!.buttonBoarderForegroundColor,
                        buttonForegroundColor: buttonsStyle!.buttonForegroundColor,
                        textStyle: buttonsStyle!.textStyle!.copyWith(
                          color: coreController.theme.specialTextColor,
                        )
                      ),
                    ),
                  )).toList(),
                ),
              ),
              SizedBox(height: spaceBetweenRows),
              Expanded(
                child: Row(
                  children: _letters2.map((letter) => Expanded(
                    child: Button(
                      command: submitCommand,
                      letter: letter,
                      style: !(letter == '+' || letter == '-' || letter == '×' || letter == '÷') ? buttonsStyle : 
                      ButtonsStyle(
                        buttonRadius: buttonsStyle!.buttonRadius,
                        spaceBetweenButtons: buttonsStyle!.spaceBetweenButtons,
                        buttonBoarderWidth: buttonsStyle!.buttonBoarderWidth,
                        buttonBackgroundColor: buttonsStyle!.buttonBackgroundColor,
                        buttonBoarderColor: buttonsStyle!.buttonBoarderColor,
                        buttonBoarderForegroundColor: buttonsStyle!.buttonBoarderForegroundColor,
                        buttonForegroundColor: buttonsStyle!.buttonForegroundColor,
                        textStyle: buttonsStyle!.textStyle!.copyWith(
                          color: coreController.theme.specialTextColor,
                        )
                      ),
                    ),
                  )).toList(),
                ),
              ),
              SizedBox(height: spaceBetweenRows),
              Expanded(
                child: Row(
                  children: _letters3.map((letter) => Expanded(
                    child: Button(
                      command: submitCommand,
                      letter: letter,
                      style: !(letter == '+' || letter == '-' || letter == '×' || letter == '÷') ? buttonsStyle : 
                      ButtonsStyle(
                        buttonRadius: buttonsStyle!.buttonRadius,
                        spaceBetweenButtons: buttonsStyle!.spaceBetweenButtons,
                        buttonBoarderWidth: buttonsStyle!.buttonBoarderWidth,
                        buttonBackgroundColor: buttonsStyle!.buttonBackgroundColor,
                        buttonBoarderColor: buttonsStyle!.buttonBoarderColor,
                        buttonBoarderForegroundColor: buttonsStyle!.buttonBoarderForegroundColor,
                        buttonForegroundColor: buttonsStyle!.buttonForegroundColor,
                        textStyle: buttonsStyle!.textStyle!.copyWith(
                          color: coreController.theme.specialTextColor,
                        )
                      ),
                    ),
                  )).toList(),
                ),
              ),
              SizedBox(height: spaceBetweenRows),
              Expanded(
                child: Row(
                  children: _letters4.map((letter) => Expanded(
                    child: Button(
                      command: submitCommand,
                      letter: letter,
                      style: letter == '=' ? ButtonsStyle(
                        buttonRadius: buttonsStyle!.buttonRadius,
                        spaceBetweenButtons: buttonsStyle!.spaceBetweenButtons,
                        buttonBoarderWidth: buttonsStyle!.buttonBoarderWidth,
                        buttonBackgroundColor: coreController.theme.equalButtonColor,
                        buttonBoarderColor: coreController.theme.equalButtonBordersColor,
                        buttonBoarderForegroundColor: coreController.theme.equalButtonFourgroundBordersColor,
                        buttonForegroundColor: coreController.theme.equalButtonFourgroundColor,
                        textStyle: buttonsStyle!.textStyle!.copyWith(
                          color: coreController.theme.backgroundColor,
                        )
                      ) : 
                      ButtonsStyle(
                        buttonRadius: buttonsStyle!.buttonRadius,
                        spaceBetweenButtons: buttonsStyle!.spaceBetweenButtons,
                        buttonBoarderWidth: buttonsStyle!.buttonBoarderWidth,
                        buttonBackgroundColor: buttonsStyle!.buttonBackgroundColor,
                        buttonBoarderColor: buttonsStyle!.buttonBoarderColor,
                        buttonBoarderForegroundColor: buttonsStyle!.buttonBoarderForegroundColor,
                        buttonForegroundColor: buttonsStyle!.buttonForegroundColor,
                        textStyle: buttonsStyle!.textStyle!.copyWith(
                          color: letter == '÷' ? coreController.theme.specialTextColor : buttonsStyle!.textStyle!.color,
                        ),
                      ),
                    ),
                  )).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}