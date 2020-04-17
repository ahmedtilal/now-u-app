import 'package:flutter/material.dart';
import 'package:app/models/Campaign.dart';

Campaign _campaign;

class CampaignTile extends StatelessWidget {
  
  CampaignTile(campaign) {
    _campaign = campaign;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
       child: Stack(
              children: <Widget>[
                // Image
                Container(decoration: BoxDecoration(
                  image: DecorationImage( 
                             image: NetworkImage(_campaign.getHeaderImage()), 
                             fit: BoxFit.cover, 
                         ),
                  )
                ),
                // Gradient
                Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [const Color.fromRGBO(0, 0,0, 0), Color.fromRGBO(0, 0,0, 0.4)],
                      )
                  ),
                ),
                // Text
                Container(
                   width: MediaQuery.of(context).size.width,
                   child: Padding(
                      padding: EdgeInsets.all(26),
                      child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Text(_campaign.getTitle().toUpperCase(), style: Theme.of(context).primaryTextTheme.display1,),
                              Text(_campaign.getNumberOfCampaigners().toString() + " campaigners"),
                            ], 
                          ),
                          ) 
                   )
              ], 
           ),
    );
  }
}
