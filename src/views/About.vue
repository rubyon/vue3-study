<template>
  <div class="about">
    <h1>This is an about page</h1>
  </div>
  <div>{{ greetings }}</div>
  <div>{{ count }} : {{ evenOrOdd }}</div>
  <button @click="increment">+</button>&nbsp;<button @click="decrement">-</button>&nbsp;
  <button @click="incrementIfOdd">Increment if odd</button>&nbsp;
  <button @click="incrementAsync">Increment async</button>
</template>

<script>
import { computed } from 'vue'
import { useStore } from 'vuex'

export default {
  setup() {
    const store = useStore()
    return {
      greetings: store.state.greetings,
      count: computed(() => store.state.count),
      evenOrOdd: computed(() => store.getters.evenOrOdd),
      increment: () => store.dispatch('increment'),
      decrement: () => store.dispatch('decrement'),
      incrementIfOdd: () => store.dispatch('incrementIfOdd'),
      incrementAsync: () => store.dispatch('incrementAsync')
    }
  }
}
</script>
