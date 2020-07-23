import 'package:flutter/material.dart';

import 'package:app/assets/components/header.dart';
import 'package:app/pages/campaign/CampaignTile.dart';

import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:app/models/ViewModel.dart';
import 'package:app/models/State.dart';

class AllCampaignsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ViewModel>(
      converter: (Store<AppState> store) => ViewModel.create(store),
      builder: (BuildContext context, ViewModel viewModel) {
        return Scaffold(
          body: SafeArea(
            child: ListView(
              children: <Widget>[
                PageHeader(
                  backButton: true,
                  title: "All Campaigns",
                ),

                SizedBox(height: 20),

                // New Campaigns
                _titleBuilder("New", context),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: viewModel.campaigns.activeLength(),
                  itemBuilder: (BuildContext context, int index) {
                    return CampaignTile(viewModel.campaigns.getActiveCampaigns()[index]);
                  },
                ),

                // Past
                _titleBuilder("Old", context),
                FutureBuilder(
                  future: viewModel.api.getAllCampaigns(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if(!snapshot.hasData) {
                      return CircularProgressIndicator();
                    }
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: snapshot.data.getPastCampaings().length,
                      itemBuilder: (BuildContext context, int index) {
                        return CampaignTile(snapshot.data.getPastCampaings()[index]);
                      },
                    );
                  },
                )
              ]
            )
          )
        );
      }
    );
  }

  Widget _titleBuilder(String text, BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Text(
        text,
        style: Theme.of(context).primaryTextTheme.headline3,
      ),
    );
  }
}


