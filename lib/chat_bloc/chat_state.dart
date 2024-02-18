part of 'chat_bloc.dart';

abstract class ChatState extends Equatable {
  const ChatState();

}

class ChatInitial extends ChatState {
  @override
  List<Object?> get props => [];
}


