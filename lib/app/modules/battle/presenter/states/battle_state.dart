abstract class IBattleState {}

class BattleReady extends IBattleState {}

class BattleSelection extends IBattleState {}

class BattleP1Choice extends IBattleState {}

class BattleP2Choice extends IBattleState {}

class BattleGame extends IBattleState {}

class BattleEnd extends IBattleState {
  final String message;

  BattleEnd(this.message);
}
