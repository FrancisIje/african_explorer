import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../constants/theme.dart';
import '../routing/app_routes.dart';

class ConfirmedScreen extends StatelessWidget {
  const ConfirmedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.four),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Icon(
                Icons.check_circle,
                size: 96,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(height: AppSpacing.four),
              Text(
                'Booking confirmed!',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: AppSpacing.two),
              Text(
                'We\'ve sent the itinerary details to your email.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: AppSpacing.five),
              FilledButton(
                onPressed: () => context.go(AppRoutes.discover),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: AppSpacing.two),
                  child: Text('Back to Discover'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
