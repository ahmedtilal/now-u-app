import 'package:app/assets/StyleFrom.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum CampaignActionSuperType { GetInvolved, Learn, Advoacte, RaiseMoney }

enum CampaignActionType {
  Volunteer,
  Donation,
  Fundraise,
  Awareness,
  Petition,
  Behaviour,
  Contact,
  Protest,
  Connect,
  Learn,
  Quiz,
  Other
}

List<String> rejectionReasons = [
  "It requires too much effort",
  "It takes too long",
  "It does not seem useful/impactful",
  "I have completed too many of these",
  "This is not something I like doing",
  "Other",
];

Color red = Color.fromRGBO(211, 0, 1, 1);
Color redO = colorFrom(red, opacity: 0.15);
Color orange = Color.fromRGBO(255, 136, 0, 1);
Color orangeO = colorFrom(orange, opacity: 0.15);
Color yellow = Color.fromRGBO(243, 183, 0, 1);
Color yellowO = colorFrom(yellow, opacity: 0.15);
Color blue = Color.fromRGBO(1, 26, 67, 1);
Color blueO = colorFrom(blue, opacity: 0.15);

Map campaignActionSuperTypeData = {
  CampaignActionSuperType.GetInvolved: {
    'name': "Get involved",
    'iconColor': red,
    'iconBackgroundColor': redO,
  },
  CampaignActionSuperType.Learn: {
    'name': "Learn",
    'iconColor': blue,
    'iconBackgroundColor': blueO,
  },
  CampaignActionSuperType.Advoacte: {
    'name': "Advocate",
    'iconColor': orange,
    'iconBackgroundColor': orangeO,
  },
  CampaignActionSuperType.RaiseMoney: {
    'name': "Raise Money",
    'iconColor': yellow,
    'iconBackgroundColor': yellowO,
  },
};

Map defaultCampaignActionTypeData = {
  'name': "other",
  'verb': "Complete",
  'pastVerb': "Completed",
  'displayName': "special action",
  'icon': FontAwesomeIcons.check,
  'type': CampaignActionSuperType.GetInvolved,
};

Map campaignActionTypeData = {
  CampaignActionType.Volunteer: {
    'name': "volunteer",
    'verb': "Volunteer",
    'pastVerb': "Volunteered",
    'displayName': "volunteer",
    'icon': FontAwesomeIcons.handsHelping,
    'type': CampaignActionSuperType.GetInvolved,
  },
  CampaignActionType.Donation: {
    'name': "donation",
    'verb': "Make",
    'pastVerb': "Made",
    'displayName': "donation",
    'icon': FontAwesomeIcons.handHoldingHeart,
    'type': CampaignActionSuperType.RaiseMoney,
  },
  CampaignActionType.Fundraise: {
    'name': "fundraise",
    'verb': "Take part in",
    'pastVerb': "Took part in",
    'displayName': "fundraiser",
    'icon': FontAwesomeIcons.piggyBank,
    'type': CampaignActionSuperType.RaiseMoney,
  },
  CampaignActionType.Awareness: {
    'name': "awareness",
    'verb': "Raise awareness",
    'pastVerb': "Raised awareness",
    'displayName': "time",
    'icon': FontAwesomeIcons.bullhorn,
    'type': CampaignActionSuperType.Advoacte,
  },
  CampaignActionType.Petition: {
    'name': "petition",
    'verb': "Sign",
    'pastVerb': "Signed",
    'displayName': "petiton",
    'icon': FontAwesomeIcons.penNib,
    'type': CampaignActionSuperType.Advoacte,
  },
  CampaignActionType.Behaviour: {
    'name': "behaviour",
    'verb': "Complete",
    'pastVerb': "Completed",
    'displayName': "behaviour change action",
    'icon': FontAwesomeIcons.exchangeAlt,
    'type': CampaignActionSuperType.GetInvolved,
  },
  CampaignActionType.Contact: {
    'name': "contact",
    'verb': "Complete",
    'pastVerb': "Completed",
    'displayName': "contact change action",
    'icon': FontAwesomeIcons.envelope,
    'type': CampaignActionSuperType.Advoacte,
  },
  CampaignActionType.Protest: {
    'name': "protest",
    'verb': "Take part in",
    'pastVerb': "Took part in",
    'displayName': "protest",
    'icon': FontAwesomeIcons.fistRaised,
    'type': CampaignActionSuperType.GetInvolved,
  },
  CampaignActionType.Connect: {
    'name': "connect",
    'verb': "Connect",
    'pastVerb': "Connted",
    'displayName': "times",
    'icon': FontAwesomeIcons.link,
    'type': CampaignActionSuperType.GetInvolved,
  },
  CampaignActionType.Learn: {
    'name': "learn",
    'verb': "Complete",
    'pastVerb': "Completed",
    'displayName': "learning action",
    'icon': FontAwesomeIcons.bookReader,
    'type': CampaignActionSuperType.Learn,
  },
  CampaignActionType.Quiz: {
    'name': "quiz",
    'verb': "Complete",
    'pastVerb': "Completed",
    'displayName': "quiz",
    'icon': FontAwesomeIcons.questionCircle,
    'type': CampaignActionSuperType.Learn,
  },
  CampaignActionType.Other: defaultCampaignActionTypeData
};

List<Map> timeBrackets = [
  {"text": "1-5 mins", "minTime": 0, "maxTime": 5},
  {"text": "5-15 mins", "minTime": 5, "maxTime": 15},
  {"text": "15-30 mins", "minTime": 15, "maxTime": 30},
  {"text": "30-60 mins", "minTime": 30, "maxTime": 60},
  {"text": "Few hours", "minTime": 60, "maxTime": 240},
  {"text": "Long term", "minTime": 240, "maxTime": double.infinity},
];

CampaignActionType campaignActionTypeFromString(String s) {
  // Apparently if we return early it just doesnt do the return? Not sure why that would be but this seems to fix it
  CampaignActionType t = CampaignActionType.Other;
  campaignActionTypeData.forEach((key, value) {
    if (value['name'] == s) {
      t = key;
    }
  });
  return t;
}

Tuple3<String, String, String> generateCampaingActionDesc(
    CampaignActionType t) {
  print("Getting campaing aciton desc");
  if (campaignActionTypeData.containsKey(t)) {
    print("Found key");
    print(campaignActionTypeData[t]['name']);
    print("Looking for the thing");
    return Tuple3(
        campaignActionTypeData[t]['verb'],
        campaignActionTypeData[t]['pastVerb'],
        campaignActionTypeData[t]['displayName']);
  }
  return Tuple3("Complete", "Completed", "special action");
}

class CampaignAction {
  int id;
  String title;
  double time;
  String whatDescription;
  String whyDescription;
  String link;
  CampaignActionType type;

  CampaignAction({
    @required int id,
    @required String title,
    @required String whatDescription,
    @required String whyDescription,
    @required String link,
    @required CampaignActionType type,
    @required double time,
  }) {
    this.id = id;
    this.title = title;
    this.whatDescription = whatDescription;
    this.whyDescription = whyDescription;
    this.link = link;
    this.type = type;
    this.time = time;
  }

  CampaignAction.fromJson(Map json) {
    //print(json);
    id = json['id'];
    title = json['title'];
    whatDescription = json['what_description'];
    whyDescription = json['why_description'];
    link = json['link'];
    time = json['time'].toDouble();
    type = campaignActionTypeFromString(json['type']);
  }

  int getId() {
    return id;
  }

  String getTitle() {
    return title;
  }

  String getWhatDescription() {
    return whatDescription;
  }

  String getWhyDescription() {
    return whyDescription;
  }

  String getLink() {
    return link;
  }

  double getTime() {
    return time;
  }

  String getTimeText() {
    return timeBrackets.firstWhere((b) => b['maxTime'] > time)['text'];
  }

  CampaignActionType getType() {
    return type;
  }

  CampaignActionSuperType getSuperType() {
    return campaignActionTypeData[type]['type'];
  }

  Map getActionIconMap() {
    if (campaignActionTypeData.containsKey(type)) {
      return {
        'icon': campaignActionTypeData[type]['icon'],
        'iconColor':
            campaignActionSuperTypeData[campaignActionTypeData[type]['type']]
                ['iconColor'],
        'iconBackgroundColor':
            campaignActionSuperTypeData[campaignActionTypeData[type]['type']]
                ['iconBackgroundColor'],
      };
    }
    return defaultCampaignActionTypeData;
  }
}
