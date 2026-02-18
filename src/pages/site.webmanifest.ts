export async function GET() {
  const manifest = {
    "name": "Stuart Bain - Software Developer",
    "short_name": "Stuart Bain",
    "description": "Personal website and portfolio of Stuart Bain, software developer and entrepreneur",
    "icons": [
      {
        "src": "/favicon-192x192.png",
        "sizes": "192x192",
        "type": "image/png"
      },
      {
        "src": "/favicon-512x512.png", 
        "sizes": "512x512",
        "type": "image/png"
      }
    ],
    "start_url": "/",
    "display": "standalone",
    "theme_color": "#2563eb",
    "background_color": "#ffffff",
    "lang": "en-US",
    "scope": "/",
    "orientation": "portrait-primary"
  };

  return new Response(JSON.stringify(manifest, null, 2), {
    headers: {
      'Content-Type': 'application/json',
    },
  });
}