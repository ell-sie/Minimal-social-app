import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/components/my_drawer.dart';
import 'package:flutter_app/components/my_list_tile.dart';
import 'package:flutter_app/components/my_post_button.dart';
import 'package:flutter_app/components/my_textfield.dart';
import 'package:flutter_app/database/firestore.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  // firestore acess
  final FirstoreDatabase database = FirstoreDatabase();

  // text controller
  final TextEditingController newPostController = TextEditingController();

  // post message
  void postMessage() {
    // only post message if there is something in the textfield
    if (newPostController.text.isNotEmpty) {
      String message = newPostController.text;
      database.addPosts(message);
    }

  // clear the controller
  newPostController.clear();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        title: const Text("W A L L"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 0,
        ),
        drawer: const MyDrawer(),
        body: Column(
          children: [
            // Textfield box for user to type
            Padding(
              padding: const EdgeInsets.all(25),
              child: Row(
                children: [
                  // textfield
                  Expanded(
                    child: MyTextField(
                      key: const Key('textfield'),
                      hintText: "Say something", 
                      obscureText: false, 
                      controller: newPostController),
                  ),
                    
                  // post button
                  PostButton(
                    key: const Key('postbutton'),
                    onTap: postMessage,
                    )
                ],
              ),
            ),

            // posts
            StreamBuilder(
              stream: database.getPostsStream(),
              builder: (context, snapshot) {
                // show loading circle
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                // get all posts
                final posts = snapshot.data!.docs;

                // no data?
                if (snapshot.data == null || posts.isEmpty) {
                  return const Center(
                    child: Padding(
                      padding: EdgeInsets.all(25),
                      child: Text("No posts.. Post something!"),
                      ),
                  );
                }

                // return as list
                return Expanded(
                  child: ListView.builder(
                    itemCount: posts.length,
                    itemBuilder: (context, index) {
                      // get each individual post
                      final post = posts[index];
                      // get data from each post
                      String message = post['PostMessage'];
                      String userEmail = post['UserEmail'];
                      Timestamp timestamp = post['TimeStamp'];

                      // return as a a list tile
                      return MyListTile(
                        title: message, 
                        subTitle: userEmail,
                        );
                    }),
                );
              },
              )
        ],)
    );
  }
}