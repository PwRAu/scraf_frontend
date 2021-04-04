part of 'menu_bloc.dart';

class MenuState extends Equatable {
  const MenuState({this.menuWidth, this.menuOpen});
  final double menuWidth;
  final bool menuOpen;

  MenuState copyWith({
    double menuWidth,
  }) {
    return MenuState(
        menuWidth: menuWidth ?? this.menuWidth,
        menuOpen: menuOpen ?? this.menuOpen);
  }

  @override
  List<Object> get props => [menuWidth];
}

class MenuOpen extends MenuState {
  const MenuOpen({this.menuWidth, this.menuOpen});
  final double menuWidth;
  final bool menuOpen;

  List<Object> get props => [menuWidth, menuOpen];
}

class MenuClose extends MenuState {
  const MenuClose({this.menuWidth, this.menuOpen});
  final double menuWidth;
  final bool menuOpen;

  List<Object> get props => [menuWidth, menuOpen];
}

class MenuStart extends MenuState {
  const MenuStart({this.menuWidth, this.menuOpen});
  final double menuWidth;
  final bool menuOpen;

  List<Object> get props => [224, true];
}
