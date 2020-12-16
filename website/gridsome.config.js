module.exports = {
  siteName: `Open Restaurant Technology Landscape`,
  siteDescription: 'Building a community to define a restaurant technology landscape.',
  titleTemplate: `%s - Open Restaurant Technology Landscape`,

  plugins: [
    {
      use: '@gridsome/source-filesystem',
      options: {
        path: 'blog/*.md',
        typeName: 'BlogPost',
        route: '/:slug'
      }
    }
  ],
  templates: {
    BlogPost: '/blog/:year/:month/:day/:slug'
  }
}
