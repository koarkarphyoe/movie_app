import 'package:hive/hive.dart';
import 'package:movie_app/data.vos/vos/actor_vo.dart';
import 'package:stream_transform/stream_transform.dart';
import '../hive_constants.dart';

class ActorDao {
  // make singleton
  static final ActorDao _singleton = ActorDao._internal();
  factory ActorDao() {
    return _singleton;
  }
  ActorDao._internal();

  //save all actors from network to hiveBox
  void saveAllActors(List<ActorVO> actorList) async {
    Map<int, ActorVO> actorMap = Map.fromIterable(actorList,
        key: (actors) => actors.id, value: (actors) => actors);
    // putall actors to actorHiveBox
    await getActorBox().putAll(actorMap);
  }

  // take all actors from hiveBox
  List<ActorVO> getAllActors() {
    return getActorBox().values.toList();
  }

  ///Reactive programming
  Stream<void> getAllActorsEventStream() {
    return getActorBox().watch();
  }

  Stream<List<ActorVO>> getAllActorsListStream() {
    return getActorBox()
        .watch()
        .map((event) => getAllActors())
        .startWith(getAllActors());
  }

  //take hiveBox name
  Box<ActorVO> getActorBox() {
    return Hive.box<ActorVO>(boxName_ActorVO);
  }
}
