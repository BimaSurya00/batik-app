import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:latihan_erico/model/batik_model.dart';

class HomeController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  
  var batikList = <Batik>[].obs;
  var topBatikList = <Batik>[].obs;
  var isLoading = false.obs;
  var sejarahbatik = <Batik>[].obs;

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

  Future<void> getData() async {
    try {
      isLoading.value = true;
      QuerySnapshot querySnapshot = await firestore.collection('batik').get();
      batikList.value = querySnapshot.docs
          .map((doc) => Batik.fromMap(doc.data() as Map<String, dynamic>))
          .toList();
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getTopBatik() async {
    try {
      isLoading.value = true;
      QuerySnapshot querySnapshot =
          await firestore.collection('topBatik').get();
      topBatikList.value = querySnapshot.docs
          .map((doc) => Batik.fromMap(doc.data() as Map<String, dynamic>))
          .toList();
    } finally {
      isLoading.value = false;
    }
  }

  Stream<QuerySnapshot<Object?>> streamData() {
    CollectionReference batik = firestore.collection('batik');
    return batik.snapshots();
  }

  Stream<QuerySnapshot<Object?>> topBatik() {
    CollectionReference batik = firestore.collection('topBatik');
    return batik.snapshots();
  }

  Stream<QuerySnapshot> streamBatikByCity(String city) {
    return firestore.collection('batik').where('kota', isEqualTo: city).snapshots();
  }

  Stream<QuerySnapshot> streamCities() {
    return firestore.collection('kota').snapshots();
  }

  Future<void> searchBatik(String query) async {
    try {
      CollectionReference batik = firestore.collection('batik');
      String lowerCaseQuery = query.toLowerCase();

      // Assuming 'nama' field is already in lowercase in Firestore
      QuerySnapshot querySnapshot = await batik
          .where('nama_lowercase', isGreaterThanOrEqualTo: lowerCaseQuery)
          .where('nama_lowercase',
              isLessThanOrEqualTo: '$lowerCaseQuery\uf8ff')
          .get();

      batikList.value = querySnapshot.docs
          .map((doc) => Batik.fromMap(doc.data() as Map<String, dynamic>))
          .toList();
    } finally {
      // Handle any necessary cleanup
    }
  }

  
}
