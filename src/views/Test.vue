<template>
  <div
    style="height: 200px; border: 2px solid #333; overflow-x: hidden; box-sizing: border-box"
    @scroll="scroll"
  >
    <h1>List</h1>
    <div v-for="i in arr" :key="i" style="height: 200px">{{ i }}</div>
  </div>
</template>

<script>
export default {
  name: 'list',
  data() {
    return {
      arr: [1, 2, 3, 4, 5],
      pos: 0
    }
  },
  methods: {
    scroll(event) {
      this.pos = event.target.scrollTop
      console.log('scroll', event.target.scrollTop)
    }
  },
  activated() {
    this.$el.scrollTop = this.pos
  },
  beforeRouteEnter: (to, from, next) => {
    // Before rendering the component, the corresponding route is called before confirm.
    // No Yes! Get component instance ` this`
    // Because before the guard executes, the component instance has not been created
    // console.log('before enter', this)
    // let topy = document.body.scrollTop
    //
    // console.log(topy)
    next()
  },
  beforeRouteLeave(to, from, next) {
    // Called when the navigation leaves the corresponding route of the component
    // Can access component instance ` this`
    console.log('route leave')

    // let topy = document.body.scrollTop
    const topy = window.scrollTop
    console.log(topy, this.$el)
    next()
  }
}
</script>

<style scoped></style>
