// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class DetailsElementView extends StatelessWidget {
  const DetailsElementView({
    super.key,
    required this.poster,
    required this.title,
    required this.backdrop,
    required this.atomicNumber,
    required this.description,
  });

  final String poster;
  final String title;
  final String backdrop;
  final String atomicNumber;
  final String description;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Details',
          style: TextStyle(
            letterSpacing: 1,
            fontSize: 28,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                width: 480,
                height: 240,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: NetworkImage(backdrop),
                  fit: BoxFit.fill,
                  colorFilter: ColorFilter.mode(
                    Colors.white38,
                    BlendMode.dstATop,
                  ),
                )),
              ),
              Row(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image(
                        image: NetworkImage(poster),
                        fit: BoxFit.fill,
                        width: 150,
                        height: 220,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Name : $title',
                          style: const TextStyle(
                            letterSpacing: 1.2,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Atomic Number : $atomicNumber',
                          style: const TextStyle(
                            letterSpacing: 1,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12, right: 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 25,
                ),
                Text(
                  'Description : $description',
                  style: const TextStyle(
                    height: 1.8,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
