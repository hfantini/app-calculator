import 'package:flutter/material.dart';
import './about.dart';
import '../widgets/calculator_button.dart';
import 'package:expressions/expressions.dart';

void main() 
{
  runApp(const MainApp());
}

class MainApp extends StatelessWidget 
{
  // CONSTRUCTOR
  const MainApp({Key? key}) : super(key: key);

  // METHODS
  @override
  Widget build(BuildContext context) 
  {
    return MaterialApp
    (
      title: 'Flutter Demo',
      theme: ThemeData
      (
        primarySwatch: Colors.blue,
        backgroundColor: Colors.white
      ),
      home: const MainWidget(),
    );
  }
}

class MainWidget extends StatefulWidget 
{
  // CONSTRUCTOR
  const MainWidget() : super();

  // 
  @override
  State<MainWidget> createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> 
{

  String lastExp = "";
  String strExp = "";
  List<String> operatorList = ["+", "-", "*", "/"];

  void clearLastCharOfExpression()
  {
    if(strExp.length > 0)
    {
      setState( ()
      {
        strExp = strExp.substring(0, strExp.length - 1); 
      });
    }
  }

  void clearExpression()
  {
    setState(() 
    {
      lastExp = "";
      strExp = "";
    });
  }

  void executeExpression()
  {
    if(strExp.length > 0)
    {
      try
      {
        Expression exp = Expression.parse(strExp);
        ExpressionEvaluator expEvaluator = ExpressionEvaluator();

        var value = expEvaluator.eval(exp, {});

        setState(() 
        {
          lastExp = strExp;
          strExp = value.toString();
        });
      }
      catch(e)
      {
        setState(() 
        {
          lastExp = strExp;
          strExp = "ERR";
        });
      }
    }
  }

  void onPressedInfo()
  {
      Navigator.push
      (
        context,
        MaterialPageRoute( builder: (context) => ViewAbout() )
      );
  }

  void onPressedCalculatorKey(String key)
  {
    if(strExp.length <= 20)
    {
      if(strExp == "ERR")
      {
        strExp = "";
      }

      if( !operatorList.contains(key) )
      {
        setState(() {
          strExp += key;
        });
      }
      else
      {
        if(strExp.length > 0)
        {
          String lastChar = strExp[strExp.length - 1];

          if( operatorList.contains(lastChar) )
          {
            strExp = strExp.substring(0, strExp.length - 1); 
          }
        }

        setState(() 
        {
            strExp += key;
        });
      }
    }
  }

  void onClearExpressionPressed()
  {
    clearExpression();
  }

  Future<bool> onBackPressed()
  {
      clearLastCharOfExpression();
      return Future.value(false);
  }

  void onEqualsPressed(String char)
  {
    executeExpression();
  }

  @override
  Widget build(BuildContext context) 
  {
      return WillPopScope
      (
        onWillPop: onBackPressed,
        child: Scaffold
        (
          backgroundColor: Theme.of(context).backgroundColor,
          appBar: AppBar
          (
            title: Text("Calculator"),
            actions: 
            [
              IconButton
              (
                icon: const Icon(Icons.info),
                onPressed: onPressedInfo,
              )
            ],
          ),
          body: Column
          (
            children: 
            [
              Expanded
              (
                flex: 1,
                child: Container
                (
                  child: Column
                  (
                    children: 
                    [
                      Expanded
                      (
                        flex: 3,
                        child: Align
                        (
                          alignment: const Alignment(0.91, 0.85),
                          child: Text
                          (
                            lastExp,
                            maxLines: 1,
                            style: const TextStyle(fontSize: 22),
                            textAlign: TextAlign.end,
                          ),
                        )
                      ),
                      Expanded
                      (
                        flex: 5,
                        child: Align
                        (
                          alignment: const Alignment(0.91, 0.85),
                          child: Text
                          (
                            strExp,
                            maxLines: 2,
                            style: const TextStyle(fontSize: 48),
                            textAlign: TextAlign.end,
                          ),
                        )
                      )
                    ],
                  ),
                  decoration: BoxDecoration
                  (
                    border: Border
                    (
                      bottom: BorderSide
                      (
                        color: Theme.of(context).primaryColor,
                        width: 1
                      )
                    )
                  ),
                ),
              ),
              Expanded
              (
                flex: 3,
                child: Container
                (
                  color: Colors.grey[100],
                  child: Column
                  (
                    children: 
                    [
                      Expanded
                      (
                        child: Row
                        (
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: 
                          [
                            Expanded
                            (
                              child: Container
                              (
                                padding: EdgeInsets.all(10.0),
                                child: CalculatorButton
                                (
                                  character: "7", 
                                  onPress: onPressedCalculatorKey
                                ),
                              ),
                            ),
                            Expanded
                            (
                              child: Container
                              (
                                padding: EdgeInsets.all(10.0),
                                child: CalculatorButton
                                (
                                  character: "8", 
                                  onPress: onPressedCalculatorKey
                                ),
                              ),
                            ),
                            Expanded
                            (
                              child: Container
                              (
                                padding: EdgeInsets.all(10.0),
                                child: CalculatorButton
                                (
                                  character: "9", 
                                  onPress: onPressedCalculatorKey
                                ),
                              ),
                            ),
                            Expanded
                            (
                              child: Container
                              (
                                padding: EdgeInsets.all(10.0),
                                child: CalculatorButton
                                (
                                  character: "+", 
                                  onPress: onPressedCalculatorKey
                                ),
                              ),
                            ),
                          ],
                        )
                      ),
                      Expanded
                      (
                        child: Row
                        (
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: 
                          [
                            Expanded
                            (
                              child: Container
                              (
                                padding: EdgeInsets.all(10.0),
                                child: CalculatorButton
                                (
                                  character: "4", 
                                  onPress: onPressedCalculatorKey
                                ),
                              ),
                            ),
                            Expanded
                            (
                              child: Container
                              (
                                padding: EdgeInsets.all(10.0),
                                child: CalculatorButton
                                (
                                  character: "5", 
                                  onPress: onPressedCalculatorKey
                                ),
                              ),
                            ),
                            Expanded
                            (
                              child: Container
                              (
                                padding: EdgeInsets.all(10.0),
                                child: CalculatorButton
                                (
                                  character: "6", 
                                  onPress: onPressedCalculatorKey
                                ),
                              ),
                            ),
                            Expanded
                            (
                              child: Container
                              (
                                padding: EdgeInsets.all(10.0),
                                child: CalculatorButton
                                (
                                  character: "-", 
                                  onPress: onPressedCalculatorKey
                                ),
                              ),
                            ),
                          ],
                        )
                      ),
                      Expanded
                      (
                        child: Row
                        (
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: 
                          [
                            Expanded
                            (
                              child: Container
                              (
                                padding: EdgeInsets.all(10.0),
                                child: CalculatorButton
                                (
                                  character: "1", 
                                  onPress: onPressedCalculatorKey
                                ),
                              ),
                            ),
                            Expanded
                            (
                              child: Container
                              (
                                padding: EdgeInsets.all(10.0),
                                child: CalculatorButton
                                (
                                  character: "2", 
                                  onPress: onPressedCalculatorKey
                                ),
                              ),
                            ),
                            Expanded
                            (
                              child: Container
                              (
                                padding: EdgeInsets.all(10.0),
                                child: CalculatorButton
                                (
                                  character: "3", 
                                  onPress: onPressedCalculatorKey
                                ),
                              ),
                            ),
                            Expanded
                            (
                              child: Container
                              (
                                padding: EdgeInsets.all(10.0),
                                child: CalculatorButton
                                (
                                  character: "*", 
                                  onPress: onPressedCalculatorKey
                                ),
                              ),
                            ),
                          ],
                        )
                      ),
                      Expanded
                      (
                        child: Row
                        (
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: 
                          [
                            Expanded
                            (
                              flex: 3,
                              child: Container
                              (
                                padding: EdgeInsets.all(10.0),
                                child: CalculatorButton
                                (
                                  character: "0", 
                                  onPress: onPressedCalculatorKey
                                ),
                              ),
                            ),
                            Expanded
                            (
                              child: Container
                              (
                                padding: EdgeInsets.all(10.0),
                                child: CalculatorButton
                                  (
                                    character: "/", 
                                    onPress: onPressedCalculatorKey
                                  ),
                              ),
                            ),
                          ],
                        )
                      ),
                      Expanded
                      (
                        child: Row
                        (
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: 
                          [
                            Expanded
                            (
                              flex: 1,
                              child: Container
                              (
                                padding: EdgeInsets.all(10.0),
                                child: OutlinedButton
                                (
                                  onPressed: onClearExpressionPressed,
                                  child: const Icon(Icons.backspace),
                                ),
                              ),
                            ),
                            Expanded
                            (
                              flex: 3,
                              child: Container
                              (
                                padding: EdgeInsets.all(10.0),
                                child: CalculatorButton
                                (
                                  character: "=", 
                                  onPress: onEqualsPressed
                                ),
                              ),
                            ),
                          ],
                        )
                      ),
                    ],
                  ),
                ),
              ),            
            ],
          ),
        )
      );
  }
}
