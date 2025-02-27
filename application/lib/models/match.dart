class Match {
  final String homeTeam;
  final String awayTeam;
  final String date;

  Match({required this.homeTeam, required this.awayTeam, required this.date});

  factory Match.fromJson(Map<String, dynamic> json) {
    return Match(
      homeTeam: json['homeTeam']['name'],
      awayTeam: json['awayTeam']['name'],
      date: json['utcDate'],
    );
  }
}