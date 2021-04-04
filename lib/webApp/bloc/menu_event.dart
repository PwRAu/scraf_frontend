part of 'menu_bloc.dart';

abstract class MenuEvent extends Equatable {
  const MenuEvent();

  @override
  List<Object> get props => [];
}

class OpenMenuEvent extends MenuEvent {}

class CloseMenuEvent extends MenuEvent {}

class InizializeMenuEvent extends MenuEvent {}
