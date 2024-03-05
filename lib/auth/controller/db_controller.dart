import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
import 'package:translation/auth/view/licence_screen.dart';
import 'package:translation/login_screen.dart';
import '../database/service_db.dart';
import '../model/db_model.dart';

class DBController extends GetxController {
  final service = ServiceDatabase();
  Future insertData(DatabaseModel model) async {
    final db = await service.initializeData();
    await db!.insert(service.table, model.fromJson());
  }

  Future checkLicence() async {
    Database? database = await service.initializeData();

    if (database != null) {
      Get.offAll(LicenceScreen());
      print('ok');
    } else {
      print('no');
      Get.offAll(LoginScreen());
    }
  }

  @override
  void onInit() {
    checkLicence();
    super.onInit();
  }
}
