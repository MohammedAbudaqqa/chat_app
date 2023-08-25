import 'dart:io';
import 'dart:math';

import 'package:chatapp/constants.dart';
import 'package:chatapp/screens/cubits/chat_cubit/chat_cubit.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../models/massage.dart';
import '../widgets/custom_buble.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';

class ChatPage extends StatelessWidget {
  ChatPage({Key? key}) : super(key: key);

  // CollectionReference massages =
  //     FirebaseFirestore.instance.collection('massages');

  TextEditingController controller = TextEditingController();

  final _controller = ScrollController();

  ////////////////////////////////////////////

  ////////////////////////////////////////////

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   getimagename();
  // }
  // List<Massage> massagesList = [];

  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments as String;
    // return StreamBuilder<QuerySnapshot>(
    //   //future like request to bring data
    //   stream: massages
    //       .orderBy(
    //         'createdAt',
    //         descending: true,
    //       )
    //       .snapshots(),
    //   builder: (context, snapshot) {
    //     if (snapshot.hasData) {
    //       List<Massage> massagesList = [];
    //       for (int i = 0; i < snapshot.data!.docs.length; i++) {
    //         massagesList.add(Massage.fromJson(snapshot.data!.docs[i]));
    //       }
    //   print(snapshot.data!.docs[0]['massages']);
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('Scholar Chat'),
          centerTitle: true,
          backgroundColor: kPrimaryColor,
        ),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: BlocBuilder<ChatCubit, ChatState>(
                  // listener: (context, state) {
                  //   if (state is ChatSuccess) {
                  //     massagesList = state.message;
                  //   }
                  // },
                  builder: (context, state) {
                    var massagesList =
                        BlocProvider.of<ChatCubit>(context).message;
                    for (var i = 0; i < massagesList.length; i++) {
                      print(massagesList[i].massage);
                    }
                    return ListView.builder(
                      reverse: true,
                      controller: _controller,
                      itemCount: massagesList.length,
                      itemBuilder: (context, index) {
                        return massagesList[index].id == email
                            ? ChatBuble(
                                massageins: massagesList[index],
                              )
                            : ChatBubleTwo(massageins: massagesList[index]);
                      },
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextField(
                  controller: controller,
                  onSubmitted: (value) {
                    BlocProvider.of<ChatCubit>(context)
                        .sendMessage(message: value, email: email);
                    // if (value == '' || value.isEmpty) {
                    //   return;
                    // } else {
                    //   massages.add({
                    //     'massages': value,
                    //     'createdAt': DateTime.now(),
                    //     'id': email,
                    //   });
                    controller.clear();
                    _controller.animateTo(_controller.position.minScrollExtent,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.fastLinearToSlowEaseIn);
                    // }
                  },
                  decoration: InputDecoration(
                    hintText: 'Send Message',
                    suffixIcon: IconButton(
                        onPressed: () async {
                          uploadimage();
                          ///////////////////
                          // File file;
                          // final storageRef =
                          //     FirebaseStorage.instance.ref();
                          // ImagePicker _picker = ImagePicker();
                          // XFile? image = await _picker.pickImage(
                          //     source: ImageSource.gallery);
                          // /////
                          // final childref = storageRef.child(image!.path);
                          // final mountainImagesRef =
                          //     storageRef.child(image.path);
                        },
                        icon: Icon(
                          Icons.image_outlined,
                          color: kPrimaryColor,
                        )),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    //     focusedBorder: OutlineInputBorder(),
                    //     enabledBorder: OutlineInputBorder(
                    //   borderRadius: BorderRadius.circular(16)
                    // )
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
    // } else {
    //   return Scaffold(
    //       body: Center(
    //           child: CircularProgressIndicator(
    //     backgroundColor: Colors.red,
    //   )));
    // }
  }
}

uploadimage() async {
  late File file;
  var _picker = ImagePicker();
  var imagepicked = await _picker.pickImage(source: ImageSource.camera);
  if (imagepicked != null) {
    file = File(imagepicked.path);
    var nameimage = basename(imagepicked.path);
    //start upload to fireStroge
    var random = Random().nextInt(10000000);
    nameimage = "$random$nameimage";
    final storageRef =
        FirebaseStorage.instance.ref("imagesfile/$nameimage"); // for image name
    await storageRef.putFile(file);
    var url = await storageRef.getDownloadURL();
    print(url);
    //Done
    print("======================]");
    print(nameimage);
  } else {
    print('PLEASE select image');
  }
}

getimagename() async {
  final storageref = await FirebaseStorage.instance.ref("imagesfile").listAll();
  storageref.items.forEach((element) {
    print(element.name);
  });
}
