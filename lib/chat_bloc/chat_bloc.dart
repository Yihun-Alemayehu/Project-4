import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:project_4/data/model/message_model.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc() : super(ChatInitialState()) {
    on<LoadMessageEvent>((event, emit) async {
      emit(ChatLoadingState());
      await Future.delayed(const Duration(seconds: 5));
      emit(
        ChatLoadedState(message: [
          Message(senderName: 'user-1', content: 'Hi bro...'),
          Message(senderName: 'user-2', content: 'What\'s up bro...'),
          Message(senderName: 'user-3', content: 'Nothing happened here'),
          Message(
              senderName: 'user-4',
              content: 'So , Is everything fine there...?'),
        ]),
      );
    });
    on<SendMessageEvent>((event, emit) async {
      try {
        // emit(ChatLoadingState());
        await Future.delayed(const Duration(seconds: 2));
        // emit(ChatLoadedState())
        final currentState = state;
        if (currentState is ChatLoadedState) {
          final List<Message> updatedMessages = List.from(currentState.message)
            ..add(event.message);
          emit(ChatLoadedState(message: updatedMessages));
        } else {
          emit(const ChatErrorState(errorMessage: "Failed to send message"));
        }
      } catch (e) {
        emit(ChatErrorState(errorMessage: 'Error: $e'));
      }
    });
  }
}
