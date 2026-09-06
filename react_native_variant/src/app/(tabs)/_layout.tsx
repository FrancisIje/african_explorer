import { SymbolView } from 'expo-symbols';
import { Tabs } from 'expo-router';

import { useTheme } from '@/hooks/use-theme';

export default function TabsLayout() {
  const theme = useTheme();

  return (
    <Tabs
      screenOptions={{
        headerShown: false,
        tabBarActiveTintColor: theme.accent,
        tabBarInactiveTintColor: theme.textSecondary,
        tabBarStyle: { backgroundColor: theme.background },
      }}>
      <Tabs.Screen
        name="discover"
        options={{
          title: 'Discover',
          tabBarIcon: ({ color, size }) => (
            <SymbolView
              tintColor={color}
              name={{ ios: 'safari', android: 'travel_explore', web: 'explore' }}
              size={size}
            />
          ),
        }}
      />
      <Tabs.Screen
        name="search"
        options={{
          title: 'Search',
          tabBarIcon: ({ color, size }) => (
            <SymbolView
              tintColor={color}
              name={{ ios: 'magnifyingglass', android: 'search', web: 'search' }}
              size={size}
            />
          ),
        }}
      />
      <Tabs.Screen
        name="saved"
        options={{
          title: 'Saved',
          tabBarIcon: ({ color, size }) => (
            <SymbolView
              tintColor={color}
              name={{ ios: 'bookmark', android: 'bookmark', web: 'bookmark' }}
              size={size}
            />
          ),
        }}
      />
    </Tabs>
  );
}
