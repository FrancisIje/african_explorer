import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../constants/theme.dart';
import '../routing/app_routes.dart';
import 'sample_tours.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String _query = '';

  @override
  Widget build(BuildContext context) {
    final results = sampleTours.where(
      (tour) => tour.title.toLowerCase().contains(_query.toLowerCase()),
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Search')),
      body: Padding(
        padding: const EdgeInsets.all(AppSpacing.three),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              onChanged: (value) => setState(() => _query = value),
              decoration: const InputDecoration(
                hintText: 'Search tours',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: AppSpacing.three),
            Expanded(
              child: ListView(
                children: results
                    .map(
                      (tour) => ListTile(
                        title: Text(tour.title),
                        subtitle: Text(tour.location),
                        onTap: () =>
                            context.push(AppRoutes.tourDetailsPath(tour.id)),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
