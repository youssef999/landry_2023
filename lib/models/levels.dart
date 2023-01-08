import 'package:get/get_utils/src/extensions/internacionalization.dart';

class Levels {
  String id;
  String Titel;
  String subTitel;
  // int levelNumber;
  String Image;

  Levels(
    this.id,
    this.Titel,
    // this.levelNumber,
    this.subTitel,
    this.Image,
  );

  static List<Levels> generateLevels() {
    return [
      Levels(
        "1",
        "غسيل وطي ".tr,
        //1,
        "يومين",
        "assets/images/Icon Washing Ma.png",
      ),
      Levels(
        "2",
        "غسيل وكي",
        //   2,
        "3 ايام",
        "assets/images/Icon Clothes.png",
      ),
      Levels(
        "3",
        "تنضيف جاف".tr,
        //  3,
        "يومين",
        "assets/images/Icon Shirt.png",
      ),
      Levels(
        "4",
        "كي فقط".tr,
        //  4,
        "يوم فقط",
        "assets/images/Icon Iron.png",
      ),
    ];
  }
}
