import 'package:puzzle_game/app/models/block.dart';
import 'package:puzzle_game/app/models/location.dart';

class HeroBlock extends Block {
  final List<Location> solution;
  HeroBlock(
      {required this.solution,
      required List<Location> location,
      required String lottiePath})
      : super(
          location: location,
          lottiePath: lottiePath,
        );
}
