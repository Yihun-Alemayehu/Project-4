part of 'chat_bloc.dart';

abstract class ChatState extends Equatable {
  const ChatState();
  @override
  List<Object?> get props => [];
}

class ChatInitialState extends ChatState {
  
}
class ChatLoadingState extends ChatState {

}

class ChatLoadedState extends ChatState {
  final Message message;

  const ChatLoadedState({
    required this.message,
  });

  @override
  List<Object?> get props => [message];
}

class ChatErrorState extends ChatState {
  final String errorMessage;

  const ChatErrorState(this.errorMessage);
  @override
  List<Object?> get props => [errorMessage];
}
