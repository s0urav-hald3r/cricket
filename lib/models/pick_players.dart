class PickPlayers {
  bool? status;
  String? version;
  int? statusCode;
  String? expires;
  String? etag;
  String? cacheKey;
  Data? data;

  PickPlayers(
      {this.status,
      this.version,
      this.statusCode,
      this.expires,
      this.etag,
      this.cacheKey,
      this.data});

  PickPlayers.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    version = json['version'];
    statusCode = json['status_code'];
    expires = json['expires'];
    etag = json['Etag'];
    cacheKey = json['cache_key'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['version'] = version;
    data['status_code'] = statusCode;
    data['expires'] = expires;
    data['Etag'] = etag;
    data['cache_key'] = cacheKey;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<FantasyPoints>? fantasyPoints;
  Match? match;
  Players? players;
  Teams? teams;
  String? lastUpdated;

  Data(
      {this.fantasyPoints,
      this.match,
      this.players,
      this.teams,
      this.lastUpdated});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['fantasy_points'] != null) {
      fantasyPoints = <FantasyPoints>[];
      json['fantasy_points'].forEach((v) {
        fantasyPoints!.add(FantasyPoints.fromJson(v));
      });
    }
    match = json['match'] != null ? Match.fromJson(json['match']) : null;
    players =
        json['players'] != null ? Players.fromJson(json['players']) : null;
    teams = json['teams'] != null ? Teams.fromJson(json['teams']) : null;
    lastUpdated = json['last_updated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (fantasyPoints != null) {
      data['fantasy_points'] = fantasyPoints!.map((v) => v.toJson()).toList();
    }
    if (match != null) {
      data['match'] = match!.toJson();
    }
    if (teams != null) {
      data['teams'] = teams!.toJson();
    }
    data['last_updated'] = lastUpdated;
    return data;
  }
}

class FantasyPoints {
  double? creditValue;
  String? lastUpdatedMatchDate;
  String? player;
  int? rankInMatch;
  int? seasonPoints;
  List<PrevPoints>? prevPoints;
  double? score;

  FantasyPoints(
      {this.creditValue,
      this.lastUpdatedMatchDate,
      this.player,
      this.rankInMatch,
      this.seasonPoints,
      this.prevPoints,
      this.score});

  FantasyPoints.fromJson(Map<String, dynamic> json) {
    creditValue = json['credit_value'];
    lastUpdatedMatchDate = json['last_updated_match_date'];
    player = json['player'];
    rankInMatch = json['rank_in_match'];
    seasonPoints = json['season_points'];
    if (json['prev_points'] != null) {
      prevPoints = <PrevPoints>[];
      json['prev_points'].forEach((v) {
        prevPoints!.add(PrevPoints.fromJson(v));
      });
    }
    score = json['score'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['credit_value'] = creditValue;
    data['last_updated_match_date'] = lastUpdatedMatchDate;
    data['player'] = player;
    data['rank_in_match'] = rankInMatch;
    data['season_points'] = seasonPoints;
    if (prevPoints != null) {
      data['prev_points'] = prevPoints!.map((v) => v.toJson()).toList();
    }
    data['score'] = score;
    return data;
  }
}

class PrevPoints {
  double? points;
  String? matchKey;
  int? matchRank;

  PrevPoints({this.points, this.matchKey, this.matchRank});

  PrevPoints.fromJson(Map<String, dynamic> json) {
    points = json['points'];
    matchKey = json['match_key'];
    matchRank = json['match_rank'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['points'] = points;
    data['match_key'] = matchKey;
    data['match_rank'] = matchRank;
    return data;
  }
}

class Match {
  String? key;
  String? dataReviewCheckpoint;
  String? status;
  String? statusOverview;
  String? lastBall;
  String? format;
  int? startAt;

  Match(
      {this.key,
      this.dataReviewCheckpoint,
      this.status,
      this.statusOverview,
      this.lastBall,
      this.format,
      this.startAt});

  Match.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    dataReviewCheckpoint = json['data_review_checkpoint'];
    status = json['status'];
    statusOverview = json['status_overview'];
    lastBall = json['last_ball'];
    format = json['format'];
    startAt = json['start_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['key'] = key;
    data['data_review_checkpoint'] = dataReviewCheckpoint;
    data['status'] = status;
    data['status_overview'] = statusOverview;
    data['last_ball'] = lastBall;
    data['format'] = format;
    data['start_at'] = startAt;
    return data;
  }
}

class Players {
  List<Cricketer>? cricketerList;

  Players({this.cricketerList});

  Players.fromJson(Map<String, dynamic> json) {
    json.forEach((key, value) {
      cricketerList!.add(Cricketer.fromJson(value));
    });
  }
}

class Cricketer {
  String? fullname;
  IdentifiedRoles? identifiedRoles;
  String? key;
  String? name;
  String? gender;
  String? seasonalRole;
  String? teamKey;
  String? nationality;
  String? dateOfBirth;
  String? cardName;

  Cricketer(
      {this.fullname,
      this.identifiedRoles,
      this.key,
      this.name,
      this.gender,
      this.seasonalRole,
      this.teamKey,
      this.nationality,
      this.dateOfBirth,
      this.cardName});

  Cricketer.fromJson(Map<String, dynamic> json) {
    fullname = json['fullname'];
    identifiedRoles = json['identified_roles'] != null
        ? IdentifiedRoles.fromJson(json['identified_roles'])
        : null;
    key = json['key'];
    name = json['name'];
    gender = json['gender'];
    seasonalRole = json['seasonal_role'];
    teamKey = json['team_key'];
    nationality = json['nationality'];
    dateOfBirth = json['date_of_birth'];
    cardName = json['card_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['fullname'] = fullname;
    if (identifiedRoles != null) {
      data['identified_roles'] = identifiedRoles!.toJson();
    }
    data['key'] = key;
    data['name'] = name;
    data['gender'] = gender;
    data['seasonal_role'] = seasonalRole;
    data['team_key'] = teamKey;
    data['nationality'] = nationality;
    data['date_of_birth'] = dateOfBirth;
    data['card_name'] = cardName;
    return data;
  }
}

class IdentifiedRoles {
  bool? batsman;
  bool? bowler;
  bool? keeper;

  IdentifiedRoles({this.batsman, this.bowler, this.keeper});

  IdentifiedRoles.fromJson(Map<String, dynamic> json) {
    batsman = json['batsman'];
    bowler = json['bowler'];
    keeper = json['keeper'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['batsman'] = batsman;
    data['bowler'] = bowler;
    data['keeper'] = keeper;
    return data;
  }
}

class Teams {
  A? a;
  A? b;

  Teams({this.a, this.b});

  Teams.fromJson(Map<String, dynamic> json) {
    a = json['a'] != null ? A.fromJson(json['a']) : null;
    b = json['b'] != null ? A.fromJson(json['b']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (a != null) {
      data['a'] = a!.toJson();
    }
    if (b != null) {
      data['b'] = b!.toJson();
    }
    return data;
  }
}

class A {
  String? key;
  String? name;
  String? shortName;

  A({this.key, this.name, this.shortName});

  A.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    name = json['name'];
    shortName = json['short_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['key'] = key;
    data['name'] = name;
    data['short_name'] = shortName;
    return data;
  }
}
