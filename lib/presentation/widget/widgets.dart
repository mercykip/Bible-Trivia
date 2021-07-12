import 'package:bible_trivia/application/services/services.dart';
import 'package:bible_trivia/application/theme/colors.dart';
import 'package:flutter/material.dart';

// /// Custom button
class CustomButton extends StatelessWidget {
  CustomButton({@required this.icon, this.onPressed});

  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
        elevation: 6.0,
        child: Icon(icon, color: white),
        onPressed: onPressed,
        fillColor: active,
        shape: CircleBorder(),
        constraints: BoxConstraints.tightFor(width: 56.0, height: 56.0));
  }
}

Expanded textWidget({String displayText, Color color}) {
  return Expanded(
      flex: 2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Text(
            displayText ?? '',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 25.0,
              color: color,
            ),
          ),
        ),
      ));
}

Container customContainer(double height, Color color) {
  return Container(
    height: height,
    width: double.infinity,
    decoration:
        BoxDecoration(color: color, borderRadius: BorderRadius.circular(5)),
    margin: EdgeInsets.only(top: 10),
  );
}

Expanded secondaryButton(String displayText, Color color) {
  return Expanded(
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextButton(
        onPressed: () {},
        child: Text(
          displayText,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
          ),
        ),
        style: TextButton.styleFrom(
          backgroundColor: color,
        ),
      ),
    ),
  );
}

Card makeDashboardItem(
  BuildContext context,
  String route,
  String title,
  IconData icon,
) {
  return Card(
      elevation: 1.0,
      margin: new EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(color: britishRacingGreen),
        child: new TextButton(
          onPressed: () {
            routeFunction(context, route);
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            verticalDirection: VerticalDirection.down,
            children: <Widget>[
              SizedBox(height: 50.0),
              Center(
                  child: Icon(
                icon,
                size: 40.0,
                color: Colors.white,
              )),
              SizedBox(height: 20.0),
              new Center(
                child: new Text(title,
                    style: new TextStyle(fontSize: 18.0, color: Colors.white)),
              )
            ],
          ),
        ),
      ));
}

List<Icon> scoreKeeper = [];

// check icon when user selects right answer
void correctAnswerWidget() {
  return (scoreKeeper.add(
    Icon(
      Icons.check,
      color: green,
    ),
  ));
}

// close icon when user selects wrong answer
void wrongAnswerWidget() {
  return (scoreKeeper.add(Icon(Icons.close, color: red)));
}
