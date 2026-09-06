import { SymbolView } from 'expo-symbols';
import { Link } from 'expo-router';
import { Pressable, StyleSheet } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';

import { ThemedText } from '@/components/themed-text';
import { ThemedView } from '@/components/themed-view';
import { MaxContentWidth, Radius, Spacing } from '@/constants/theme';
import { useTheme } from '@/hooks/use-theme';

export default function OnboardingScreen() {
  const theme = useTheme();

  return (
    <ThemedView style={styles.container}>
      <SafeAreaView style={styles.safeArea}>

        <ThemedText type="title" style={{ fontSize: 64, lineHeight: 68 }}>
          Discover
          African
          Savanna
        </ThemedText>
        <ThemedText type="default" themeColor="textSecondary" style={styles.container}>
          Discover and book unforgettable safari tours across Africa.
        </ThemedText>


        <Link href="/(tabs)/discover" replace asChild>
          <Pressable style={({ pressed }) => [styles.cta, { backgroundColor: theme.accent }, pressed && styles.pressed]}>
            <ThemedText type="smallBold" style={{ color: '#FFFFFF' }}>
              Get started
            </ThemedText>
          </Pressable>
        </Link>
      </SafeAreaView>
    </ThemedView>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
  },
  safeArea: {
    flex: 1,
    alignSelf: 'flex-start',
    width: '100%',
    maxWidth: MaxContentWidth,
    justifyContent: "flex-start",

    paddingHorizontal: Spacing.four,
    paddingVertical: Spacing.four,
  },
  hero: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
    gap: Spacing.three,
  },
  centerText: {
    textAlign: 'center',
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
