import 'package:flutter/material.dart';
import 'package:playground/data/constants.dart';
import 'package:playground/data/notifiers.dart';
import 'package:playground/widgets/hero_widget.dart';
import 'package:playground/widgets/todos_widget.dart';

class HomePage extends StatelessWidget {
  
   const HomePage({super.key});
  
    static List<String> list = [
    KValue.basicLayout,
    KValue.cleanUi,
    KValue.fixBugs,
    KValue.keyConcepts,
  ];


  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: counterNotifier,
      builder: (context, counterValue, child) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  SizedBox(height: 10),
                  const HeroWidget(),
                  TodosWidget()
                  // const ContainerWidget(
                  //   title: 'This is the title',
                  //   description: 'This is the description',
                  // ),
                  //   ...List.generate(list.length, (index) {
                  //     return ContainerWidget(
                  //       title: list.elementAt(index),
                  //       description: 'ciao ${list.elementAt(index)}',
                  //     );
                  //   }),
                  
                ],
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              counterNotifier.value++;
            },
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}
