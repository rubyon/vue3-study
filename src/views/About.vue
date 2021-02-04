<template>
  <div class="about">
    <h1>This is an about page</h1>
    <span>
      <a href="http://localhost:8080/api/getFoo">http://localhost:8080/api/getFoo</a> Json result:
      {{ foo }}
    </span>
  </div>
</template>

<script>
import axios from 'axios'

export default {
  name: 'axios',
  data() {
    return {
      foo: ''
    }
  },
  mounted() {
    const vm = this
    axios
      .get('http://localhost:8080/api/getFoo')
      .then(function (response) {
        vm.foo = response.data.foo
      })
      .catch(function (error) {
        alert(error)
      })
  }
}
</script>
