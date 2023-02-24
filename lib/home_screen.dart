import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  // 필수 오버라이드. (StatefulWidget) state를 리턴 함.
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}



class _HomeScreenState extends State<HomeScreen> {

  final PageController pageController = PageController();

  @override
  void initState() {
    print('1');
    super.initState();    // 부모 initState 실행.
    print('2');
    Timer.periodic(
      Duration(seconds: 3),
      (timer) {
        print('3');
        // 현재 페이지 get. .page를 통해 값을 가져오면 double형태로 가져온다.
        // 여기서 animateToPage에 정수만 넣어야 하기 때문에 미리 정수로 변경(toInt)
        int? currentPage = pageController.page?.toInt();
        print('4');
        String aa = 'Page = $currentPage';
        print(aa);
        // 현재 페이지가 없으면 종료
        if(currentPage == null) {
          print('5');
          return;
        }

        // 마지막 5페이지 까지 돌았으면 다시 현재페이지를 0으로 설정.
        if(currentPage == 4) {
          currentPage = 0;
          print('6 => 밑에 나오는 currentPage는 0이냐?');
        } else {
          currentPage++;
          print('7');
        }

        pageController.animateToPage(
          currentPage,
          duration: Duration(seconds: 1),
          curve: Curves.ease
        );
        print('8');

      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // 상태바 색상 변경
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    return Scaffold(
      body: PageView(
        controller: pageController,
        children: [1,2,3,4,5].map(
            (number) => Image.asset('asset/img/image_$number.jpeg', fit: BoxFit.cover,),
        ).toList(),
      ),
    );
  }
}