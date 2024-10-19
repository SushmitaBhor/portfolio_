import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          RichText(
              text: TextSpan(
                  text:
                      '\u2022 I\u0027ve designed and developed high-quality applications using',
                  style: Theme.of(context).textTheme.labelLarge,
                  children: [
                TextSpan(
                  text: ' Flutter',
                  style: Theme.of(context).textTheme.titleSmall,
                )
              ])),
          SizedBox(
            height: 20,
          ),
          RichText(
              text: TextSpan(
                  text: '\u2022 I\u0027ve ',
                  style: Theme.of(context).textTheme.labelLarge,
                  children: [
                TextSpan(
                  text: 'Proficiency in Mobile architecture',
                  style: Theme.of(context).textTheme.titleSmall,
                )
              ])),
          SizedBox(
            height: 20,
          ),
          RichText(
              text: TextSpan(
                  text: '\u2022 I\u0027ve hands on experience in',
                  style: Theme.of(context).textTheme.labelLarge,
                  children: [
                TextSpan(
                  text:
                      ' Widget, UI Elements, Grid & other components of Flutter',
                  style: Theme.of(context).textTheme.titleSmall,
                )
              ])),
          SizedBox(
            height: 20,
          ),
          RichText(
              text: TextSpan(
                  text: '\u2022 I\u0027ve ability to',
                  style: Theme.of(context).textTheme.labelLarge,
                  children: [
                TextSpan(
                  text:
                      ' Taking responsibility & ownership in the team’s work, good communication',
                  style: Theme.of(context).textTheme.titleSmall,
                )
              ])),
          SizedBox(
            height: 20,
          ),
          RichText(
              text: TextSpan(
                  text: '\u2022 I\u0027ve participated',
                  style: Theme.of(context).textTheme.labelLarge,
                  children: [
                TextSpan(
                  text: ' Agile process',
                  style: Theme.of(context).textTheme.titleSmall,
                )
              ])),
          SizedBox(
            height: 20,
          ),
          RichText(
              text: TextSpan(
                  text: '\u2022 I\u0027ve ability to',
                  style: Theme.of(context).textTheme.labelLarge,
                  children: [
                TextSpan(
                  text: ' participate in planning, reviewing, coding',
                  style: Theme.of(context).textTheme.titleSmall,
                )
              ])),
          SizedBox(
            height: 20,
          ),
          RichText(
              text: TextSpan(
                  text: '\u2022 I\u0027ve ability to',
                  style: Theme.of(context).textTheme.labelLarge,
                  children: [
                TextSpan(
                  text:
                      ' proactively & collaboratively participate in problem solving skills.',
                  style: Theme.of(context).textTheme.titleSmall,
                )
              ])),
        ],
      ),
    );
  }
}
