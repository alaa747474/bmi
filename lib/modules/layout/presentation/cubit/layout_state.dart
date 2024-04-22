part of 'layout_cubit.dart';

sealed class LayoutState {
  const LayoutState();
}

final class LayoutInitial extends LayoutState {}

class ChangeBottomNavBarIndex extends LayoutState {}
