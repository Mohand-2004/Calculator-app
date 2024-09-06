abstract class Equation{

  // map of string and function to link functions
  // with it's equavalent operation
  static final Map<String,double Function(double n1,double n2)> _operations = {
    '+' : (double n1,double n2) => n1+n2,
    '*' : (double n1,double n2) => n1*n2,
    '/' : (double n1,double n2) => n1/n2,
    '-' : (double n1,double n2) => n1-n2, 
  };

  // return the operations from the equation
  static String _getOperations(String eq){

    // declarate an empty string
    String operations = '';

    // iterate over the basic equation
    for(int i = 0;i<eq.length;i++){
      // if the current char is an operator
      if(['+','-','/','*'].contains(eq[i])){
        // add it to the string
        operations+=eq[i];
      }
    }
    
    // return a string of the operators
    return operations;
  }

  // basic recursive function to calculate the result
  // of a string equation
  static num calculate(String eq){

    // declarate an empty string
    String finalEquation = '';

    // iterate over the basic equation
    for(int i = 0;i<eq.length;i++){
      // if current char is open braket
      if(eq[i] == '('){
        // define int variable to store 
        // the index of the closed bracket
        int j = i+1;

        // define int variable to store number of opening bracket
        // in case of there is a nested brackets
        int indicator = 1;

        // loop until number of opening brackets equal zero
        while(indicator != 0){
          // if current char is a closed bracket
          if(eq[j] == ')'){
            // then decremet the number of the opening brackets
            indicator--;
          }
          // if current char is an opend bracket
          else if(eq[j] == '('){
            // then increment the number of the opening brackets
            indicator++;
          }

          // increment the current char index
          j++;
        }

        // add the bracket result to the equation
        finalEquation += '${calculate(eq.substring(i+1,j))}';

        // move the iteration variable after the closed bracket
        i = j-1;
      }
      // if current char isn't a bracket
      else{
        // then add it to equation
        finalEquation += eq[i];
      }
    }

    // return the equation result after removing the brackets
    return _getResult(finalEquation);
  }

  // calculate the string equation result without bracket
  static num _getResult(String eq){

    // extract the numbers from the string equation
    // and store them in a list
    List<double> numbers = eq.extractNumbers();

    // extract the operations from the equation string
    // and store them in a string variable
    String operations = _getOperations(eq);

    // correct numbers signs
    for(int i = 0;i<operations.length;i++){
      if(operations[i] == '-'){
        numbers[i+1] = -numbers[i+1];
      }
    }

    // replace mul and div expressions with it's results
    for(int i = 0;i<operations.length;i++){
      // check if the operator is mul or div
      if(operations[i] == '*' || operations[i] == '/'){
        numbers.replaceRange(
          i,i+2,
          [
            0,/*adding this zero on left to avoid changing the numbers lenght to avoid out of range index error*/
            _operations[operations[i]]!(numbers[i],numbers[i+1]),
          ],
        );
      }
    }
    // define the resualt variable set to zero
    double res = 0;

    // iterate over numbers list
    for(double number in numbers/*numbers is a list of double contaning the equation numbers with it's sign*/){
      // add each number to the result
      res+=number;
    }

    // return res if it's a double or converte to int if there isn't a decimal part
    return res - res.toInt() == 0 ? res.toInt() : res;
  }
}

// extenstion to the String class 
// to return a list of int containig the numbers inside it 
extension Split on String{
  List<double> extractNumbers(){
    // define an empty list to store the numbers
    List<double> numbers = [];

    // define a string variable to store the numbers temporary
    String tempNumber = '';

    for(int i = 0;i<length;i++){
      // if current char is a number or a decimal point
      if(RegExp(r"[0-9]{1}").hasMatch(this[i]) || this[i] == '.'){
        // then add it to the temp number
        tempNumber+=this[i];
      }
      else{
        // if the number is match a decimal number or int number regex
        if(RegExp(r"[0-9]{1,}.?[0-9]{0,}").hasMatch(tempNumber)){
          // then parse it to double and add to the list
          numbers.add(double.parse(tempNumber));

          // reset the temp number
          tempNumber = '';
        }
      }
    }
    // if there is a number in the end of the string
    // then add it to the list 
    // as the add condition in the loop is if the current char isn't a number
    // so if there is a number in the end of the string it won't be added
    if(RegExp(r"[0-9]{1,}.?[0-9]{0,}").hasMatch(tempNumber)){
      numbers.add(double.parse(tempNumber));
    }

    // return the numbers list
    return numbers;
  }
}