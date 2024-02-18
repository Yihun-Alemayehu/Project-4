import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_4/chat_bloc/chat_bloc.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat App'),
        centerTitle: true,
      ),
      body: BlocBuilder<ChatBloc, ChatState>(
        builder: (context, state) {
          if(state is ChatLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          else if(state is ChatLoadedState) {
            
          return ListView.builder(
            itemCount: state.message.length,
            itemBuilder: (context, index) {
              final message = state.message[index];
              return  ListTile(
                title: Text(message.senderName),
                subtitle: Text(message.content),
              );
            },
          );}
          else if(state is ChatErrorState) {
            return Center(
              child: Text(state.errorMessage),
            );
          }else {
            return const Center(
              child: Text('I don\'t know what happened to you...'),
            );
          }
        },
      ),
    );
  }
}
