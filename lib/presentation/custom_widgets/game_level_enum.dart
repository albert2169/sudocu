enum GameLevelEnum { easy, medium, hard, expert }

extension GameLevelName on GameLevelEnum {
  String get name {
    switch (this) {
      case GameLevelEnum.easy:
        return 'Easy';
      case GameLevelEnum.medium:
        return 'Medium';
      case GameLevelEnum.hard:
        return 'Hard';
      case GameLevelEnum.expert:
        return 'Expert';
    }
  }

  double get time {
    switch (this) {
      case GameLevelEnum.easy:
        return 20;
      case GameLevelEnum.medium:
        return 15;
      case GameLevelEnum.hard:
        return 10;
      case GameLevelEnum.expert:
        return 1;
    }
  }
}
