import 'package:fpdart/fpdart.dart';

import '../../../../core/erorr/faliure.dart';
import '../../data/models/playground_model.dart';
import '../../data/repositories/sports_repository.dart';

class GetFilterGrounds {
  final SportsRepository sportsRepository;

  GetFilterGrounds({required this.sportsRepository});

  Future<Either<Faliure, List<PlaygroundModel>?>> call() async {
    return await sportsRepository.getPlaygrounds().then((value) => value.fold(
          (l) => left(l),
          (r) => right(r?.where((e) => e.price > 200).toList()),
        ));
  }
}
