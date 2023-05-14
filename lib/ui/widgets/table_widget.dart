import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';


class TableWidget extends StatelessWidget {
  final String fan;
  final String sinf;
  final String startTime;
  final bool note;
  final VoidCallback onChanged;

  const TableWidget({Key? key, required this.startTime, required this.fan, required this.sinf, required this.note, required this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20),
      margin: const EdgeInsets.only(right: 20, bottom: 15, left: 20),
      decoration: BoxDecoration(
          color: const Color(0xff8085FD),
          borderRadius: BorderRadius.circular(15)
      ),
      height: 144,
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
                child: fan.length < 20 ?
                Text(fan, style: const TextStyle(fontSize: 32, color: Colors.white, fontWeight: FontWeight.w600),)
                    :
                Marquee(
                  text: fan,
                  style: const TextStyle(fontSize: 32, color: Colors.white, fontWeight: FontWeight.w600),
                  blankSpace: 30,
                  velocity: 40,
                  accelerationCurve: Curves.bounceOut,
                  decelerationCurve: Curves.bounceIn,
                  showFadingOnlyWhenScrolling: false,
                  pauseAfterRound: const Duration(seconds: 3),
                ),
              ),

              Switch(
                onChanged: (value){

                },
                value: note,
                activeColor: Colors.white,
              ),
            ],
          ),
          Text(sinf, style: const TextStyle(fontSize: 16, color: Colors.white),),

          Row(
            children: [
              const Icon(Icons.access_time_rounded, color: Colors.white),
              Text(startTime, style: const TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.w500),)
            ],
          ),
        ],
      ),
    );
  }
}
