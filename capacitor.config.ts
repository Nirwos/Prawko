import type { CapacitorConfig } from '@capacitor/cli'

const config: CapacitorConfig = {
  appId: 'pl.npkteam.prawko',
  appName: 'Prawko',
  webDir: 'www',
  backgroundColor: '#040c0f',
  server: {
    url: 'https://prawko.npkteam.pl/profil',
    allowNavigation: ['prawko.npkteam.pl', 'www.npkteam.pl', 'npkteam.pl'],
  },
  android: { backgroundColor: '#040c0f', allowMixedContent: false },
  ios: { backgroundColor: "#040c0f", contentInset: "never" },
}

export default config
