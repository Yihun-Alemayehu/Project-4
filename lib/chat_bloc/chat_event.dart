part of 'chat_bloc.dart';

abstract class ChatEvent extends Equatable {
  const ChatEvent();
}

class LoadMessageEvent extends ChatEvent {
  @override
  List<Object> get props => [];
}

class sendMessageEvent extends ChatEvent {
  final Message message;

  const sendMessageEvent({required this.message});

  @override
  List<Object> get props => [message];
}
