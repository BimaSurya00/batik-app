import 'package:get/get.dart';
import 'package:latihan_erico/model/detail_batik_model.dart';

class AddToBookmarkViewModel extends GetxController {
  var bookmarkList = <Bookmark>[].obs;

  void addToBookmark(String name, String imageUrl, String description) {
    var newBookmark = Bookmark(
      name: name,
      imageUrl: imageUrl,
      description: description,
    );

    bookmarkList.add(newBookmark);

    // Tampilkan notifikasi berhasil tambah bookmark
    Get.snackbar('Bookmark Added', 'Berhasil di tambahkan.',
        duration: const Duration(seconds: 2));
  }

  void removeBookmark(int index) {
    bookmarkList.removeAt(index);
    // Tampilkan notifikasi berhasil hapus bookmark
    Get.snackbar('Bookmark Removed', 'Berhasil di hapus.',
        duration: const Duration(seconds: 2));
  }
}
