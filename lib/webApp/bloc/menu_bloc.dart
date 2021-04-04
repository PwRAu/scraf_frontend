import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'menu_event.dart';
part 'menu_state.dart';

class MenuBloc extends Bloc<MenuEvent, MenuState> {
  MenuBloc() : super(MenuOpen(menuWidth: 224, menuOpen: true));

  @override
  Stream<MenuState> mapEventToState(
    MenuEvent event,
  ) async* {
    if (event is OpenMenuEvent) {
      yield MenuOpen(menuWidth: 224, menuOpen: true);
    } else if (event is CloseMenuEvent) {
      //print("ss di milano");
      yield MenuClose(menuWidth: 96, menuOpen: false);
    } else if (event is InizializeMenuEvent) {
      yield MenuStart(menuWidth: 224, menuOpen: true);
    }
  }
}
