import { useLocalSearchParams, useRouter } from 'expo-router';
import { Pressable, StyleSheet } from 'react-native';
import { useSafeAreaInsets } from 'react-native-safe-area-context';

import { ThemedText } from '@/components/themed-text';
import { ThemedView } from '@/components/themed-view';
import { findSampleTour } from '@/constants/sample-tours';
import { MaxContentWidth, Radius, Spacing } from '@/constants/theme';
import { useTheme } from '@/hooks/use-theme';

export default function BookingScreen() {
  const { id } = useLocalSearchParams<{ id: string }>();
  const tour = findSampleTour(id);
  const insets = useSafeAreaInsets();
  const theme = useTheme();
  const router = useRouter();

  return (
    <ThemedView style={styles.container}>
      <ThemedView style={[styles.content, { paddingBottom: insets.bottom + Spacing.four }]}>
        <ThemedText type="subtitle">{tour.title}</ThemedText>
        <ThemedText type="default" themeColor="textSecondary">
          {tour.location} · ${tour.price} per person
        </ThemedText>

        <ThemedView style={styles.spacer} />

        <Pressable
          onPress={() => router.replace('/confirmed')}
          style={({ pressed }) => [styles.cta, { backgroundColor: theme.accent }, pressed && styles.pressed]}>
          <ThemedText type="smallBold" style={{ color: '#FFFFFF' }}>
            Confirm booking
          </ThemedText>
        </Pressable>
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
    gap: Spacing.one,
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
