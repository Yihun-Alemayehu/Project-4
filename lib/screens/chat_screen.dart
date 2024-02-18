import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_4/chat_bloc/chat_bloc.dart';
import 'package:project_4/data/model/message_model.dart';

@immutable
class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});

  final TextEditingController _contentController = TextEditingController();
  final TextEditingController _senderController = TextEditingController();

  void _sendMessage(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const Text('Send message'),
              TextField(
                controller: _contentController,
                decoration: const InputDecoration(
                  hintText: 'Enter message here',
                  border: OutlineInputBorder(),
                ),
              ),
              TextField(
                controller: _senderController,
                decoration: const InputDecoration(
                  hintText: 'Enter Your name here',
                  border: OutlineInputBorder(),
                ),
              ),
              TextButton(
                onPressed: () {
                  // context.read<ChatBloc>()..add(LoadMessageEvent());
                  context.read<ChatBloc>()
                    .add(
                      SendMessageEvent(
                        message: Message(
                            senderName: _senderController.text,
                            content: _contentController.text),
                      ),
                    );
                    // context.read<ChatBloc>()..add(LoadMessageEvent());
                  Navigator.pop(context);
                },
                child: const Text('Send'),
              )
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatBloc, ChatState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Chat App'),
            centerTitle: true,
          ),
          body: _buildBody(state),
          floatingActionButton: FloatingActionButton(
            onPressed: () => _sendMessage(context),
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}

Widget _buildBody(ChatState state) {
  if (state is ChatLoadingState) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  } else if (state is ChatLoadedState) {
    return ListView.builder(
      itemCount: state.message.length,
      itemBuilder: (context, index) {
        final message = state.message[index];
        return ListTile(
          title: Text(message.senderName),
          subtitle: Text(message.content),
        );
      },
    );
  } else if (state is ChatErrorState) {
    return Center(
      child: Text(state.errorMessage),
    );
  } else {
    return const Center(
      child: Text('I don\'t know what happened to you...'),
    );
  }
}
