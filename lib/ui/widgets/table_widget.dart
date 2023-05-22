import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

class TableWidget extends StatelessWidget {
  final String fan;
  final String sinf;
  final String startTime;
  final bool note;
  final VoidCallback onChanged;

  const TableWidget(
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
      margin: const EdgeInsets.only(right: 20, bottom: 15, left: 20),
      decoration: BoxDecoration(
          color: const Color(0xff8085FD),
          borderRadius: BorderRadius.circular(15)),
      height: 155,
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
                height: 30,
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
                onChanged: (bool value) {},
                value: note,
                activeColor: Colors.white,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            sinf,
            style: const TextStyle(fontSize: 20, color: Colors.white),
          ),
          Row(
            children: [
              const Icon(
                Icons.access_time_filled_rounded,
                color: Colors.white,
                size: 27,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                startTime,
                style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 70, bottom: 20),
                child: Icon(
                  Icons.edit,
                  size: 40,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
