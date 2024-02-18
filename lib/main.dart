import 'package:flutter/material.dart';
import 'package:project_4/chat_bloc/chat_bloc.dart';
import 'package:project_4/screens/chat_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatBloc()..add(LoadMessageEvent()),
      child: const MaterialApp(
        home: ChatScreen(),
      ),
    );
  }
}
