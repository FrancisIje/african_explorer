import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../constants/theme.dart';
import '../routing/app_routes.dart';
import 'sample_tours.dart';

class TourDetailsScreen extends StatelessWidget {
  const TourDetailsScreen({super.key, required this.tourId});

  final String tourId;

  @override
  Widget build(BuildContext context) {
    final tour = sampleTours.firstWhere(
      (tour) => tour.id == tourId,
      orElse: () => SampleTour(
        id: tourId,
        title: 'Tour $tourId',
        location: 'Unknown',
        price: 0,
      ),
    );

    return Scaffold(
      appBar: AppBar(title: Text(tour.title)),
      body: Padding(
        padding: const EdgeInsets.all(AppSpacing.four),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(tour.title, style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: AppSpacing.one),
            Text(
              tour.location,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
            ),
            const SizedBox(height: AppSpacing.three),
            Text(
              '\$${tour.price} per person',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const Spacer(),
            FilledButton(
              onPressed: () =>
                  context.push(AppRoutes.bookingPath(tour.id)),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: AppSpacing.two),
                child: Text('Book now'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
