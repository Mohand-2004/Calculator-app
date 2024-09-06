import 'package:calculator/data%20structure/linkedlist.dart';
import 'package:calculator/helper/equation_model.dart';
import 'package:calculator/style/app_theme.dart';
import 'package:calculator/style/app_themes.dart';


class CoreController{
  Node<String> _equation = Node();
  num? _result;
  AppTheme _theme = AppThemes.light;

  void resetEquation(){
    _equation = Node();
    _result = null;
  }

  void addToEquation(String symbol){
    _equation.insert(value: symbol);
  }

  void removeFromEquation(){
    _equation.pop();
  }

  void switchMode(){
    if(_theme == AppThemes.light){
      _theme = AppThemes.dark;
    }
    else{
      _theme = AppThemes.light;
    }
  }

  void calculate(){
    if(_equation.lenght != 0){
      String eq = _equation.toString().replaceAll('×','*');
      eq = eq.replaceAll('÷','/');
      try{
        _result = Equation.calculate(eq);
      }
      catch(_){
        resetEquation();
        String error = 'Syntax Error !';
        for(int i = 0;i<error.length;i++){
          _equation.insert(value:  error[i]);
        }
      }
    }
  }

  String get result => '${_result ?? ''}';
  String get equation => _equation.toString();
  AppTheme get theme => _theme;
}

CoreController coreController = CoreController();