import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memorial/bloc/editor/editor_bloc.dart';
import 'package:memorial/ui/widget/editor_panel.dart';
import 'package:memorial/ui/widget/side_panel.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditorBloc()..add(const EditorEvent.init()),
      child: const _HomePageBody(),
    );
  }
}

class _HomePageBody extends StatelessWidget {
  const _HomePageBody();

  @override
  Widget build(BuildContext context) {
    return BlocListener<EditorBloc, EditorState>(
      listener: (context, state) {
        state.mapOrNull(
          error: (state) => showDialog(
            context: context,
            builder: (context) => AlertDialog.adaptive(
              content: Text(state.exception.toString()),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text("OK"),
                ),
              ],
            ),
          ),
        );
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              BlocBuilder<EditorBloc, EditorState>(
                builder: (context, state) {
                  return Expanded(
                    flex: 3,
                    child: SidePanel(
                      document: state.mapOrNull(loaded: (s) => s.note.document),
                    ),
                  );
                },
              ),
              Container(
                width: 1.0,
                height: MediaQuery.of(context).size.height,
                margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                color: Colors.grey.shade300,
              ),
              const Expanded(
                flex: 9,
                child: EditorPanel(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
