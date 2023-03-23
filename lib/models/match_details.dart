class MatchDetails {
  bool? status;
  String? version;
  int? statusCode;
  String? expires;
  String? etag;
  String? cacheKey;
  Data? data;

  MatchDetails(
      {this.status,
      this.version,
      this.statusCode,
      this.expires,
      this.etag,
      this.cacheKey,
      this.data});

  MatchDetails.fromJson(Map<String, dynamic> json) {
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
  List<Months>? months;
  String? cardType;
  String? prevMonth;
  String? currentMonth;
  String? nextMonth;

  Data(
      {this.months,
      this.cardType,
      this.prevMonth,
      this.currentMonth,
      this.nextMonth});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['months'] != null) {
      months = <Months>[];
      json['months'].forEach((v) {
        months!.add(Months.fromJson(v));
      });
    }
    cardType = json['card_type'];
    prevMonth = json['prev_month'];
    currentMonth = json['current_month'];
    nextMonth = json['next_month'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (months != null) {
      data['months'] = months!.map((v) => v.toJson()).toList();
    }
    data['card_type'] = cardType;
    data['prev_month'] = prevMonth;
    data['current_month'] = currentMonth;
    data['next_month'] = nextMonth;
    return data;
  }
}

class Months {
  bool? currentMonth;
  String? month;
  List<Days>? days;

  Months({this.currentMonth, this.month, this.days});

  Months.fromJson(Map<String, dynamic> json) {
    currentMonth = json['current_month'];
    month = json['month'];
    if (json['days'] != null) {
      days = <Days>[];
      json['days'].forEach((v) {
        days!.add(Days.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['current_month'] = currentMonth;
    data['month'] = month;
    if (days != null) {
      data['days'] = days!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Days {
  List<Matches>? matches;
  int? day;
  bool? currentDay;

  Days({this.matches, this.day, this.currentDay});

  Days.fromJson(Map<String, dynamic> json) {
    if (json['matches'] != null) {
      matches = <Matches>[];
      json['matches'].forEach((v) {
        matches!.add(Matches.fromJson(v));
      });
    }
    day = json['day'];
    currentDay = json['current_day'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (matches != null) {
      data['matches'] = matches!.map((v) => v.toJson()).toList();
    }
    data['day'] = day;
    data['current_day'] = currentDay;
    return data;
  }
}

class Matches {
  String? key;
  String? name;
  String? shortName;
  String? relatedName;
  String? title;
  Season? season;
  Teams? teams;
  Msgs? msgs;
  StartDate? startDate;
  String? format;
  String? venue;
  String? status;
  String? winnerTeam;
  String? ref;
  String? expires;
  int? approxCompletedTs;
  String? cacheKey;
  Stadium? stadium;
  String? gender;
  Board? board;

  Matches(
      {this.key,
      this.name,
      this.shortName,
      this.relatedName,
      this.title,
      this.season,
      this.teams,
      this.msgs,
      this.startDate,
      this.format,
      this.venue,
      this.status,
      this.winnerTeam,
      this.ref,
      this.expires,
      this.approxCompletedTs,
      this.cacheKey,
      this.stadium,
      this.gender,
      this.board});

  Matches.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    name = json['name'];
    shortName = json['short_name'];
    relatedName = json['related_name'];
    title = json['title'];
    season = json['season'] != null ? Season.fromJson(json['season']) : null;
    teams = json['teams'] != null ? Teams.fromJson(json['teams']) : null;
    msgs = json['msgs'] != null ? Msgs.fromJson(json['msgs']) : null;
    startDate = json['start_date'] != null
        ? StartDate.fromJson(json['start_date'])
        : null;
    format = json['format'];
    venue = json['venue'];
    status = json['status'];
    winnerTeam = json['winner_team'];
    ref = json['ref'];
    expires = json['expires'];
    approxCompletedTs = json['approx_completed_ts'];
    cacheKey = json['cache_key'];
    stadium =
        json['stadium'] != null ? Stadium.fromJson(json['stadium']) : null;
    gender = json['gender'];
    board = json['board'] != null ? Board.fromJson(json['board']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['key'] = key;
    data['name'] = name;
    data['short_name'] = shortName;
    data['related_name'] = relatedName;
    data['title'] = title;
    if (season != null) {
      data['season'] = season!.toJson();
    }
    if (teams != null) {
      data['teams'] = teams!.toJson();
    }
    if (msgs != null) {
      data['msgs'] = msgs!.toJson();
    }
    if (startDate != null) {
      data['start_date'] = startDate!.toJson();
    }
    data['format'] = format;
    data['venue'] = venue;
    data['status'] = status;
    data['winner_team'] = winnerTeam;
    data['ref'] = ref;
    data['expires'] = expires;
    data['approx_completed_ts'] = approxCompletedTs;
    data['cache_key'] = cacheKey;
    if (stadium != null) {
      data['stadium'] = stadium!.toJson();
    }
    data['gender'] = gender;
    if (board != null) {
      data['board'] = board!.toJson();
    }
    return data;
  }
}

class Season {
  String? key;
  String? name;
  String? cardName;

  Season({this.key, this.name, this.cardName});

  Season.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    name = json['name'];
    cardName = json['card_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['key'] = key;
    data['name'] = name;
    data['card_name'] = cardName;
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
  String? country;
  Match? match;

  A({this.key, this.name, this.shortName, this.country, this.match});

  A.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    name = json['name'];
    shortName = json['short_name'];
    country = json['country'];
    match = json['match'] != null ? Match.fromJson(json['match']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['key'] = key;
    data['name'] = name;
    data['short_name'] = shortName;
    data['country'] = country;
    if (match != null) {
      data['match'] = match!.toJson();
    }
    return data;
  }
}

class Match {
  String? seasonTeamKey;

  Match({this.seasonTeamKey});

  Match.fromJson(Map<String, dynamic> json) {
    seasonTeamKey = json['season_team_key'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['season_team_key'] = seasonTeamKey;
    return data;
  }
}

class Msgs {
  String? result;
  List<String>? others;
  String? info;
  String? completed;

  Msgs({this.result, this.others, this.info, this.completed});

  Msgs.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    if (json['others'] != null) {
      others = <String>[];
      json['others'].forEach((v) {
        others!.add(v);
      });
    }
    info = json['info'];
    completed = json['completed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['result'] = result;
    if (others != null) {
      data['others'] = others!.map((v) => v).toList();
    }
    data['info'] = info;
    data['completed'] = completed;
    return data;
  }
}

class StartDate {
  String? iso;

  StartDate({this.iso});

  StartDate.fromJson(Map<String, dynamic> json) {
    iso = json['iso'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['iso'] = iso;
    return data;
  }
}

class Stadium {
  String? key;
  String? name;
  String? city;
  String? country;

  Stadium({this.key, this.name, this.city, this.country});

  Stadium.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    name = json['name'];
    city = json['city'];
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['key'] = key;
    data['name'] = name;
    data['city'] = city;
    data['country'] = country;
    return data;
  }
}

class Board {
  String? key;
  String? name;
  String? code;
  String? country;
  String? parent;

  Board({this.key, this.name, this.code, this.country, this.parent});

  Board.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    name = json['name'];
    code = json['code'];
    country = json['country'];
    parent = json['parent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['key'] = key;
    data['name'] = name;
    data['code'] = code;
    data['country'] = country;
    data['parent'] = parent;
    return data;
  }
}
