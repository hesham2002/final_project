// card_cubit.dart

import 'package:flutter_bloc/flutter_bloc.dart';

import 'entry_login_state.dart';


class CardCubit extends Cubit<SelectedCard> {
  CardCubit() : super(SelectedCard.patient); // Initial state is set to patient

  // Method to select a card
  void selectCard(SelectedCard card) {
    emit(card);
  }
}
