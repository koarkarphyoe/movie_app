import 'package:hive/hive.dart';
import 'package:movie_app/data.vos/vos/credit_vo.dart';
import 'package:movie_app/persistence/daos/hive_constants.dart';
import 'package:rxdart/rxdart.dart';

class CreditsDao {
  static final CreditsDao _singleton = CreditsDao._internal();
  factory CreditsDao() {
    return _singleton;
  }
  CreditsDao._internal();

  void saveAllCredits(List<CreditVO> mCredits) async {
    Map<int, CreditVO> creditMap = Map.fromIterable(mCredits,
        key: (credit) => credit.id, value: (credit) => credit);
    await getCreditsBox().putAll(creditMap);
  }

  List<CreditVO> getAllCredits() {
    return getCreditsBox().values.toList();
  }

  //Reactive Programming
  Stream<void> getAllCreditsEventStream() {
    return getCreditsBox().watch();
  }

  Stream<List<CreditVO>> getAllCreditsListStream() {
    return getCreditsBox()
        .watch()
        .map((event) => getAllCredits())
        .startWith(getAllCredits());
  }

  Box<CreditVO> getCreditsBox() {
    return Hive.box<CreditVO>(boxName_CreditVO);
  }
}