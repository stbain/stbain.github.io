import { getCollection } from 'astro:content';

const siteUrl = 'https://stuartbain.com';

export async function GET() {
  // Get all blog posts
  const blogPosts = await getCollection('blog', ({ data }) => {
    return data.draft !== true;
  });
  
  // Static pages
  const staticPages = [
    { url: '', priority: 1.0, changefreq: 'weekly' },
    { url: '/about', priority: 0.9, changefreq: 'monthly' },
    { url: '/projects', priority: 0.9, changefreq: 'monthly' },
    { url: '/blog', priority: 0.8, changefreq: 'weekly' },
  ];
  
  // Blog post pages
  const blogPages = blogPosts.map(post => ({
    url: `/blog/${post.slug}`,
    priority: 0.7,
    changefreq: 'monthly',
    lastmod: post.data.updatedDate || post.data.pubDate
  }));
  
  const allPages = [...staticPages, ...blogPages];
  
  const sitemap = `<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
${allPages.map(page => `  <url>
    <loc>${siteUrl}${page.url}</loc>
    <changefreq>${page.changefreq}</changefreq>
    <priority>${page.priority}</priority>${page.lastmod ? `
    <lastmod>${page.lastmod instanceof Date ? page.lastmod.toISOString().split('T')[0] : page.lastmod}</lastmod>` : ''}
  </url>`).join('\n')}
</urlset>`;

  return new Response(sitemap, {
    headers: {
      'Content-Type': 'application/xml',
    },
  });
}