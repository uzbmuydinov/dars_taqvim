import 'package:app/ui/add_task_bar.dart';
import 'package:app/ui/profile/home_page.dart';
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

class HomeWidget extends StatelessWidget {
  final String fan;
  final String sinf;
  final String startTime;
  final bool note;
  final VoidCallback onChanged;

  const HomeWidget(
      {Key? key,
      required this.startTime,
      required this.fan,
      required this.sinf,
      required this.note,
      required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20),
      margin: const EdgeInsets.only(right: 20, bottom: 15),
      decoration: BoxDecoration(
          color: const Color(0xff8085FD),
          borderRadius: BorderRadius.circular(15)),
      height: 147,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 300,
                height: 40,
                child: fan.length < 20
                    ? Text(
                        fan,
                        style: const TextStyle(
                            fontSize: 32,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      )
                    : Marquee(
                        text: fan,
                        style: const TextStyle(
                            fontSize: 32,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                        blankSpace: 30,
                        velocity: 40,
                        accelerationCurve: Curves.bounceOut,
                        decelerationCurve: Curves.bounceIn,
                        showFadingOnlyWhenScrolling: false,
                        pauseAfterRound: const Duration(seconds: 3),
                      ),
              ),
              Switch(
                onChanged: (value) {},
                value: note,
                activeColor: Colors.white,
              ),
            ],
          ),
          Text(
            sinf,
            style: const TextStyle(fontSize: 25, color: Colors.white),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(Icons.access_time_filled_rounded, color: Colors.white),
              const SizedBox(width: 10,),
              Text(
                startTime,
                style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
              ),
               Padding(
                padding: const EdgeInsets.only(left: 240,bottom: 10),
                child: TextButton(
                  onPressed: (){
                    showDialog(
                        context: context,
                        builder: (context){
                          return AlertDialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            title:  const Text("Tahrirlash",style: TextStyle(
                              color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold
                            ),),
                            content: const Text(
                              "Siz shu haftani tanlashga ishonchingiz komilmi",
                              style: TextStyle(
                                color: Colors.grey,fontSize: 17
                              ),
                            ),
                            actions: [
                              TextButton(
                                  onPressed: (){
                                    Navigator.pop(context);
                                  }, child: const Text(
                                "Yo'q",style: TextStyle(
                                color: Colors.grey,fontSize: 17
                              ),
                              )),
                            ],
                          );
                        });
                  },
                  child: const Icon(
                    Icons.edit,
                    size: 35,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
