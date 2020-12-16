<template>
  <v-app class="layout">
    <header class="header">
      <v-app-bar :dense="isNotHome">
        <g-link class="heading-link" :to="{ name: 'home' }">
          <component :is="titleTag" class="heading">{{ $static.metadata.siteName }}</component>
        </g-link>
    </v-app-bar>
    </header>
    <v-main>
      <v-container>
        <slot />
      </v-container>
    </v-main>
  </v-app>
</template>

<static-query>
query {
  metadata {
    siteName
  }
}
</static-query>

<script>
export default {
  computed: {
    titleTag () {
      return this.$route.name === 'home' ? 'h1' : 'h4'
    },
    isNotHome () {
      return this.$route.name !== 'home';
    }
  }
}
</script>

<style>

</style>
