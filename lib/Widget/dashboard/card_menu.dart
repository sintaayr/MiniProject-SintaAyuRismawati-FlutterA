import 'package:flutter/material.dart';

class CardMenuWidget extends StatelessWidget {
  final Function() onTap;
  final String title;
  final String desc;
  final String imageAsset;

  const CardMenuWidget({
    super.key,
    required this.onTap,
    required this.title,
    required this.desc,
    required this.imageAsset,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: const Color.fromARGB(255, 207, 38, 38),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 175,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      desc,
                      style: const TextStyle(color: Colors.white),
                      textAlign: TextAlign.justify,
                    )
                  ],
                ),
              ),
              const SizedBox(
                width: 35,
              ),
              SizedBox(
                height: 100,
                width: 80,
                child: Image.asset(
                  imageAsset,
                  fit: BoxFit.fill,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
