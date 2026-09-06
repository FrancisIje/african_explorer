import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../constants/theme.dart';
import '../routing/app_routes.dart';
import 'sample_tours.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({super.key, required this.tourId});

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
      appBar: AppBar(title: const Text('Confirm booking')),
      body: Padding(
        padding: const EdgeInsets.all(AppSpacing.four),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(tour.title, style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: AppSpacing.one),
            Text(
              '${tour.location} · \$${tour.price} per person',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const Spacer(),
            FilledButton(
              onPressed: () => context.go(AppRoutes.confirmed),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: AppSpacing.two),
                child: Text('Confirm booking'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
