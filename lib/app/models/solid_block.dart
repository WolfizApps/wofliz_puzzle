import 'package:puzzle_game/app/models/block.dart';
import 'package:puzzle_game/app/models/location.dart';

class SolidBlock extends Block {
  SolidBlock({
    required List<Location> location,
  }) : super(
          location: location,
          lottiePath: '',
        );
}
