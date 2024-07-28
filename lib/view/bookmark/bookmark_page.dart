import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan_erico/viewmodel/add_to_bookmark_controller.dart';
import 'package:latihan_erico/model/detail_batik_model.dart';
import 'package:latihan_erico/view/bookmark/bookmark_detail_page.dart';

class BookmarkPage extends StatefulWidget {
  const BookmarkPage({super.key});

  @override
  State<BookmarkPage> createState() => _BookmarkPageState();
}

class _BookmarkPageState extends State<BookmarkPage> {
  final AddToBookmarkViewModel _addToBookmarkViewModel =
      Get.find<AddToBookmarkViewModel>(); // Access the view model

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown,
      appBar: AppBar(
        foregroundColor: Colors.brown[100],
        backgroundColor: Colors.brown,
        title: const Text('Bookmark Page'),
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: _addToBookmarkViewModel.bookmarkList.length,
          itemBuilder: (BuildContext context, int index) {
            Bookmark bookmark = _addToBookmarkViewModel.bookmarkList[index];
            return ListTile(
              contentPadding: const EdgeInsets.all(10.0),
              trailing: IconButton(
                  onPressed: () {
                    _addToBookmarkViewModel.removeBookmark(index);
                  },
                  icon: Icon(
                    Icons.delete,
                    color: Colors.brown[100],
                    size: 30,
                  )),
              title: Text(
                bookmark.name,
                style: TextStyle(
                  color: Colors.brown[100],
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              leading: Image.network(
                bookmark.imageUrl,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
              onTap: () {
                // Navigate to detail page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BookmarkDetailPage(
                      batik: Bookmark(
                        name: bookmark.name,
                        imageUrl: bookmark.imageUrl,
                        description: bookmark.description,
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
