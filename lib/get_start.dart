// ignore_for_file: non_constant_identifier_names, avoid_print

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'login_screen.dart';
class BoardingModel {

  final String image;
  final String title;
  final String body;

  BoardingModel({

    required this.title,
    required this.image,
    required this.body,


  });
}
class OnBoardingScreen extends StatefulWidget {
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  //const OnBoardingScreen({Key? key}) : super(key: key);
  List<BoardingModel>boarding=[
    BoardingModel(title:'Summer', image: 'assets/images/summer.jpg', body: 'Catching some rays, some waves and some favs'),
    BoardingModel(title:'Winter', image: 'assets/images/winter.jpg', body: 'Keep calm and winter on!'),
    BoardingModel(title:'After Winter', image: 'assets/images/well.jpg', body: ' After Rain Comes Weather Fair.'),

  ];
  bool isLast=false;

  @override
  Widget build(BuildContext context) {
    var boardingController=PageController();
    bool isLast=false;
    return Scaffold(
      appBar:AppBar(
        title: Text('Weather App',),
        actions: [
          TextButton(onPressed: (){

            Navigator.pushReplacement(
              context,
                MaterialPageRoute(
                  builder: (context) =>
                  const LoginScreen(),),
            );
          },

              child: const Text(
                'SKIP',
                style: TextStyle(
                  color: Colors.white,
                ),

              ) ,
          ),


        ],
      ) ,
      body:Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: boardingController,
                onPageChanged: (int index) {
                  if(index==(boarding.length-1)){
                    setState(() {
                      isLast=true;
                    });
                  }else{
                    setState(() {
                      isLast=false;
                    });
                  }
                },
                itemBuilder: (context, index) =>BoardingBuildItem(boarding[index]),
                itemCount: boarding.length,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              children: [
                SmoothPageIndicator(
                  controller:boardingController ,
                  count:boarding.length ,
                  effect: const WormEffect(
                    dotHeight: 10,
                    dotWidth: 10,
                    type: WormType.normal,
                    dotColor: Colors.blue,
                    activeDotColor: Colors.blue,
                  ),
                ),
                const Spacer(),
                FloatingActionButton(onPressed: (){
                  if(isLast==false){
                    boardingController.nextPage(
                        duration: const Duration(milliseconds: 700,),
                        curve: Curves.fastLinearToSlowEaseIn);
                  }else{
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                        const LoginScreen(),),
                    );

                  }

                },
                  child: const Icon( Icons.arrow_forward_ios,),),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget BoardingBuildItem(BoardingModel model)=>Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children:   [
      Expanded(child: Image(
        image: AssetImage('${model.image}'),
        fit: BoxFit.fitWidth,
      ),),
      Text('${model.title}',
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 30,
        ),
      ),
      const SizedBox(
        height: 30,
      ),
      Text('${model.body}',
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),


    ],
  );
}
