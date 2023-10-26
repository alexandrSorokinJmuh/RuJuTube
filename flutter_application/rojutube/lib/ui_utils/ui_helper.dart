import 'package:flutter/animation.dart';
import 'package:flutter_animate/flutter_animate.dart';

final StandardCardAppearAnimation = <Effect>[
  FadeEffect(duration: 1000.ms, curve: Curves.easeOutBack),
  MoveEffect(duration: 500.ms,
      begin: Offset(-190, 0),
      end: Offset(0, 0),
      curve: Curves.easeInOutBack),
  FlipEffect(duration: 700.ms, curve: Curves.easeInOutBack),
];

final StandardPageAppearAnimation = <Effect>[
  FadeEffect(duration: 1200.ms, curve: Curves.easeOutBack),
  // MoveEffect(duration: 500.ms,
  //     begin: Offset(-190, 0),
  //     end: Offset(0, 0),
  //     curve: Curves.easeInOutBack),
  // FlipEffect(duration: 700.ms, curve: Curves.easeInOutBack),
];