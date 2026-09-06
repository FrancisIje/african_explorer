import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../constants/theme.dart';
import '../routing/app_routes.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

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
              const Icon(Icons.travel_explore, size: 96),
              const SizedBox(height: AppSpacing.four),
              Text(
                'African Explorer',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: AppSpacing.two),
              Text(
                'Discover and book unforgettable safari tours across Africa.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: AppSpacing.five),
              FilledButton(
                onPressed: () => context.go(AppRoutes.discover),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: AppSpacing.two),
                  child: Text('Get started'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
