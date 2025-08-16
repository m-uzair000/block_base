import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'loader_bloc.dart';

class LoaderOverlay extends StatelessWidget {
  final Widget child;
  final bool dismissible;

  const LoaderOverlay({
    super.key,
    required this.child,
    this.dismissible = false,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoaderBloc, LoaderState>(
      builder: (context, state) {
        return Stack(
          children: [
            child,
            if (state.isLoading)
              GestureDetector(
                onTap: dismissible
                    ? () => context.read<LoaderBloc>().add(HideLoader())
                    : null,
                child: Container(
                  color: Colors.black54,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
