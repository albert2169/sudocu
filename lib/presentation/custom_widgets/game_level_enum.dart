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
}
