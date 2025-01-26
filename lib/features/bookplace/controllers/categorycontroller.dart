
import 'package:bookme_app/data/repositories/categoryrepo.dart';
import 'package:bookme_app/features/bookplace/models/categorymodel.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class CategoryController extends GetxController {

  static CategoryController get instance => Get.find();

  final _categoryrepo = Get.put(CategoryRepo());
  final isLoading = false.obs;
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    fetchCategories();
    super.onInit();
  }
  /// Loading data of Categories
  Future<void> fetchCategories() async {
    try {
    isLoading.value = true;

    final categories = await _categoryrepo.getAllCategories();

    allCategories.assignAll(categories);

    featuredCategories.assignAll(allCategories.where((category) => category.isFeatured).take(8).toList());



    } catch(e) {
      printError();
    } finally {
    isLoading.value = false;
    }
  }
}