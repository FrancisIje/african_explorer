import { Link, useLocalSearchParams } from 'expo-router';
import { Pressable, StyleSheet } from 'react-native';
import { useSafeAreaInsets } from 'react-native-safe-area-context';

import { ThemedText } from '@/components/themed-text';
import { ThemedView } from '@/components/themed-view';
import { findSampleTour } from '@/constants/sample-tours';
import { MaxContentWidth, Radius, Spacing } from '@/constants/theme';
import { useTheme } from '@/hooks/use-theme';

export default function TourDetailsScreen() {
  const { id } = useLocalSearchParams<{ id: string }>();
  const tour = findSampleTour(id);
  const insets = useSafeAreaInsets();
  const theme = useTheme();

  return (
    <ThemedView style={styles.container}>
      <ThemedView style={[styles.content, { paddingBottom: insets.bottom + Spacing.four }]}>
        <ThemedText type="title" style={styles.title}>
          {tour.title}
        </ThemedText>
        <ThemedText type="default" themeColor="textSecondary">
          {tour.location}
        </ThemedText>
        <ThemedText type="subtitle" style={styles.price}>
          ${tour.price} per person
        </ThemedText>

        <ThemedView style={styles.spacer} />

        <Link href={{ pathname: '/booking/[id]', params: { id: tour.id } }} asChild>
          <Pressable style={({ pressed }) => [styles.cta, { backgroundColor: theme.accent }, pressed && styles.pressed]}>
            <ThemedText type="smallBold" style={{ color: '#FFFFFF' }}>
              Book now
            </ThemedText>
          </Pressable>
        </Link>
      </ThemedView>
    </ThemedView>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
  },
  content: {
    flex: 1,
    alignSelf: 'center',
    width: '100%',
    maxWidth: MaxContentWidth,
    paddingHorizontal: Spacing.four,
    paddingTop: Spacing.four,
  },
  title: {
    fontSize: 28,
    lineHeight: 34,
  },
  price: {
    fontSize: 22,
    lineHeight: 28,
    marginTop: Spacing.three,
  },
  spacer: {
    flex: 1,
  },
  cta: {
    alignItems: 'center',
    justifyContent: 'center',
    paddingVertical: Spacing.three,
    borderRadius: Radius.pill,
  },
  pressed: {
    opacity: 0.85,
  },
});
