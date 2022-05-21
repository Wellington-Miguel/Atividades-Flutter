import 'package:exercise_animation/Componets/animation.dart';
import 'package:exercise_animation/Componets/button_next.dart';
import 'package:exercise_animation/Componets/tab_view.dart';
import 'package:exercise_animation/Componets/title.dart';
import 'package:flutter/material.dart';

class TaskOnboarding extends StatefulWidget {
  const TaskOnboarding({Key? key}) : super(key: key);

  @override
  State<TaskOnboarding> createState() => _TaskOnboardingState();
}

class _TaskOnboardingState extends State<TaskOnboarding>
    with TickerProviderStateMixin {
  int page = 0;
  late AnimationController mainAnimation;

  late AnimationController buttonAnimation;

  late TabController tabController;
  @override
  void initState() {
    mainAnimation = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
    buttonAnimation = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..stop();
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    mainAnimation.dispose();
    buttonAnimation.dispose();
    tabController.dispose();
    super.dispose();
  }

  final List<String> title = [
    'Planeje suas tarefas!'
        'Compartilhe com os amigos!'
        'Cumpra suas metas!'
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TaskOnboarding',
      home: Scaffold(
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AnimationOnboarding(
                controller: mainAnimation,
                index: page,
              ),
              TabView(tabController: tabController),
              AnimatedBuilder(
                animation: mainAnimation,
                builder: (BuildContext context, Widget? child) {
                  return TitleTab(title: title[page]);
                },
              ),
              GestureDetector(
                  onTap: page < 3
                      ? () async {
                          page += 1;
                          await buttonAnimation.forward();
                          tabController.animateTo(page);
                          mainAnimation.forward();
                        }
                      : null,
                  child: ButtonNext(buttonController: buttonAnimation))
            ],
          ),
        ),
      ),
    );
  }
}
