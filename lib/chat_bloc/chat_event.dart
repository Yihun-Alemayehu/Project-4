part of 'chat_bloc.dart';

abstract class ChatEvent extends Equatable {
  const ChatEvent();
}

class LoadMessageEvent extends ChatEvent {
  @override
  List<Object> get props => [];
}

class SendMessageEvent extends ChatEvent {
  final Message message;

  const SendMessageEvent({required this.message});

  @override
  List<Object> get props => [message];
}
