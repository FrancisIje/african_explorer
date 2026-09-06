import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../constants/theme.dart';
import '../routing/app_routes.dart';
import 'sample_tours.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Discover')),
      body: ListView.separated(
        padding: const EdgeInsets.all(AppSpacing.three),
        itemCount: sampleTours.length,
        separatorBuilder: (context, index) =>
            const SizedBox(height: AppSpacing.two),
        itemBuilder: (context, index) {
          final tour = sampleTours[index];
          return Card(
            margin: EdgeInsets.zero,
            child: ListTile(
              contentPadding: const EdgeInsets.all(AppSpacing.three),
              title: Text(tour.title),
              subtitle: Text('${tour.location} · \$${tour.price}'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () =>
                  context.push(AppRoutes.tourDetailsPath(tour.id)),
            ),
          );
        },
      ),
    );
  }
}
