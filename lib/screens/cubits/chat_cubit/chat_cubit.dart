import 'package:bloc/bloc.dart';
import 'package:chatapp/models/massage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());
  List<Massage> message = [];

  CollectionReference massages =
      FirebaseFirestore.instance.collection("massages");
  void sendMessage({required String message, required String email}) {
    massages.add({
      'massages': message,
      'createdAt': DateTime.now(),
      'id': email,
    });
    print("send message success");
  }

  void getMessages() {
    massages
        .orderBy(
          'createdAt',
          descending: true,
        )
        .snapshots()
        .listen((event) {
      for (var element in event.docs) {
        message.add(Massage.fromJson(element));
      }
      emit(ChatSuccess(message: message));
    });
  }
}
