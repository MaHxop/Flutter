import 'package:dz1/blok/error_blok/error_event.dart';
import 'package:dz1/blok/error_blok/error_state.dart';
import 'package:dz1/const/error_dialog.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ErrorBloc extends Bloc<ErrorEvent, ErrorState> {
  ErrorBloc() : super(const ErrorState()) {
    on<ShowDialogEvent>(_onShowDialog);
  }

  void _onShowDialog(ShowDialogEvent event, Emitter<ErrorState> emit) {
    showErrorDialog(error: '${event.title} ${event.message}');
  }
}
