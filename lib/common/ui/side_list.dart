import 'package:flutter/material.dart';

class Slide {
  final String imageUrl;
  final String title;
  final String description;

  Slide({
    required this.imageUrl,
    required this.title,
    required this.description,
  });
}

final slideList = [
  Slide(
    imageUrl: 'assets/images/girl.png',
    title: 'Apply For Acadque\nTutor[Slide 1]',
    description: 'Join us and provide tutor services online.',
  ),
  Slide(
      imageUrl: 'assets/images/girl.png',
      title: 'Apply For Acadque\nTutor[Slide 2]',
      description: 'Join us and provide tutor services online.'),
  Slide(
    imageUrl: 'assets/images/girl.png',
    title: 'Apply For Acadque\nTutor[Slide 3]',
    description: 'Join us and provide tutor services online.',
  ),
];
