import 'dart:async';
import 'package:flutter/material.dart';

class AdWidget extends StatefulWidget {
  AdWidget({super.key});

  final List adList = [
    {"img": "ad.webp", "text": "Texte 01" },
    {"img": "ad.webp", "text": "Texte 02" },
    {"img": "ad.webp", "text": "Texte 03" },
  ];

  @override
  State<AdWidget> createState() => _AdWidgetState();
}

class _AdWidgetState extends State<AdWidget> {

  int adIndex = 0;
  double adPosition = 0;

  @override
  void initState() {
    super.initState();

      Timer.periodic(Duration( seconds: 2), _getTimer);
  }

  void _getTimer(Timer timer){
    if(adIndex < widget.adList.length - 1){
      adIndex++;
    }
    else{
      adIndex = 0;
    }

    setState(() {
      adPosition = -(adIndex * MediaQuery.of(context).size.width);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Stack(
        children: [ 
          AnimatedPositioned(
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInSine,
            left: adPosition,
            child: SizedBox(
              height: 300,
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: [
                  ...widget.adList.map((ad){
                    return Column(
                    children: [
                      Image.asset("assets/images/${ad["img"]}", width: MediaQuery.of(context).size.width,),
                      Text(ad["text"])
                    ],
                    );
                  }),   
                ]
              ),
            ),
          ),
        ],
      ),
    );
  }
}