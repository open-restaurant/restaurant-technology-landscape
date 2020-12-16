import Vuetify from 'vuetify'
import 'vuetify/dist/vuetify.min.css'
import DefaultLayout from '~/layouts/Default.vue'

export default function (Vue, { appOptions, head }) {
  head.htmlAttrs = { lang: 'en' }

  head.link.push({
    rel: 'stylesheet',
    href: 'https://cdn.jsdelivr.net/npm/@mdi/font@latest/css/materialdesignicons.min.css',
  })

  head.link.push({
    rel: 'stylesheet',
    href: 'https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700,900',
  });

  head.meta.push({ charset: 'utf-8' })
  head.meta.push({ 'http-equiv': 'x-ua-compatible', content: 'ie=edge' })
  head.meta.push({ name: 'viewport', content: 'width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' })

  const opts = {
    breakpoint: {},
    icons: {},
    lang: {},
    rtl: false,
    theme: {
      themes: {
        light: {
          primary: '#003366',
          accent: '#Fcfcfc',
          secondary: '#CC0000'
        }
      }
    }
  } //opts includes, vuetify themes, icons, etc.
  Vue.use(Vuetify)

  appOptions.vuetify = new Vuetify(opts);

  // Set default layout as a global component
  Vue.component('Layout', DefaultLayout)
}