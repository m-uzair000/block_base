import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'loader_bloc.dart';

void showLoader(BuildContext context) {
  context.read<LoaderBloc>().add(ShowLoader());
}

void hideLoader(BuildContext context) {
  context.read<LoaderBloc>().add(HideLoader());
}
