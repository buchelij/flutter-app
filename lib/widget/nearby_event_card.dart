import 'package:flutter/material.dart';
import '../models/app_theme.dart';
import '../models/event_model.dart';
import '../utils/datetime_utils.dart';
import '../widget/ui_helper.dart';

class NearbyEventCard extends StatelessWidget {
  final Event event;
  final VoidCallback onTap;
  const NearbyEventCard({Key? key, required this.event, required this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: <Widget>[
            buildImage(),
            buildEventInfo(context),
          ],
        ),
      ),
    );
  }

  Widget buildImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Container(
        color: AppTheme.imgBG,
        width: 80,
        height: 100,
        child: Hero(
          tag: event.image,
          child: Image.network(
            event.image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget buildEventInfo(context) {
    return Container(
      padding: const EdgeInsets.all(12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(DateTimeUtils.getFullDate(event.eventDate), style: AppTheme.monthStyle),
          UIHelper.verticalSpace(8),
          Text(event.name, style: AppTheme.title),
          // Text(event.status, style: AppTheme.title),
          UIHelper.verticalSpace(8),
          Row(
            children: <Widget>[
              Icon(Icons.location_on, size: 16, color: Theme.of(context).primaryColor),
              UIHelper.horizontalSpace(4),
              Text(event.location.toUpperCase(), style: AppTheme.subtitle),
            ],
          ),
        ],
      ),
    );
  }
}
