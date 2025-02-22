import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';

import 'package:app/models/Action.dart';
import 'package:app/models/Campaign.dart';
import 'package:app/models/Learning.dart';
import 'package:app/models/User.dart';

class AnalyticsService {
  final FirebaseAnalytics _analytics = FirebaseAnalytics();

  FirebaseAnalyticsObserver getAnalyticsObserver() =>
      FirebaseAnalyticsObserver(analytics: _analytics);

  Future logUserAccountDeleted() async {
    print("Deleted account logged in Analytics");
    await _analytics
        .logEvent(name: "User account deleted", parameters: <String, dynamic>{
      "time_deleted": new DateTime.now().toString(),
    });
  }

  Future logActionStatusUpdate(CampaignAction action, String status) async {
    print("Logging action completed");
    await _analytics
        .logEvent(name: "action_$status", parameters: <String, dynamic>{
      "id": action.getId(),
      "title": action.getTitle(),
      "type": action.getType().toString(),
      "super_type": action.getSuperType().toString(),
      "time": action.getTime(),
    });
  }

  Future logCampaignStatusUpdate(Campaign campaign, String status) async {
    await _analytics
        .logEvent(name: "campaign_$status", parameters: <String, dynamic>{
      "id": campaign.getId(),
      "title": campaign.getTitle(),
    });
  }

  Future logLearningResourceClicked(LearningResource resource) async {
    await _analytics.logEvent(
        name: "learning_resource_clicked",
        parameters: <String, dynamic>{
          "id": resource.getId(),
          "title": resource.getTitle(),
          "time": resource.getTime(),
          "type": resource.getType()
        });
  }
}

class ActionStatus {
  static String complete = "complete";
  static String reject = "rejected";
  static String favourite = "favourite";
}

class CampaignStatus {
  static String join = "join";
  static String leave = "leave";
}
