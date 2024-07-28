import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:latihan_erico/model/batik_model.dart';

class SejarahBatikController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  var sejarahbatik = <Batik>[].obs;
  var isLoading = false.obs;

  Future<void> getSejarah() async {
    try {
      isLoading.value = true;
      QuerySnapshot querySnapshot = await firestore.collection('sejarah').get();
      sejarahbatik.value = querySnapshot.docs
          .map((doc) => Batik.fromMap(doc.data() as Map<String, dynamic>))
          .toList();
    } finally {
      isLoading.value = false;
    }
  }

  Stream<QuerySnapshot<Object?>> sejarahBatik() {
    CollectionReference batik = firestore.collection('sejarah');
    return batik.snapshots();
  }
}
