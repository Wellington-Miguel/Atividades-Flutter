import 'package:exercise_animation/Componets/animation.dart';
import 'package:exercise_animation/Componets/button_next.dart';
import 'package:exercise_animation/Componets/tab_view.dart';
import 'package:exercise_animation/Componets/title.dart';
import 'package:exercise_animation/mobx/controller_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

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
  final controllerPage = ControllerPage();
  @override
  void initState() {
    mainAnimation = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
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
    'Planeje suas tarefas!',
    'Compartilhe com os amigos!',
    'Cumpra suas metas!',
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TaskOnboarding',
      home: Scaffold(
        backgroundColor: Colors.green[800],
        body: Stack(children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: IconButton(
                onPressed: () {
                  controllerPage.decrement();
                  print(controllerPage.page);
                  tabController.animateTo(controllerPage.page);
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                )),
          ),
          Center(
            child: Observer(
              builder: (BuildContext context) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AnimationOnboarding(
                      controller: mainAnimation,
                      index: controllerPage.page,
                    ),
                    TabView(tabController: tabController),
                    AnimatedBuilder(
                      animation: mainAnimation,
                      builder: (BuildContext context, Widget? child) {
                        return TitleTab(title: title[controllerPage.page]);
                      },
                    ),
                    controllerPage.page == 2
                        ? Text('')
                        : GestureDetector(
                            onTap: () async {
                              await buttonAnimation.forward();
                              buttonAnimation.reset();
                              mainAnimation.fling();
                              controllerPage.increment();
                              tabController.animateTo(controllerPage.page);
                              mainAnimation.repeat();
                            },
                            child:
                                ButtonNext(buttonController: buttonAnimation))
                  ],
                );
              },
            ),
          )
        ]),
      ),
    );
  }
}
