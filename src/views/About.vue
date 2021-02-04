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
import * as fooApi from '@/api/foobar'

export default {
  name: 'axios',
  data() {
    return {
      foo: ''
    }
  },
  mounted() {
    const vm = this
    fooApi
      .getFoo()
      .then((response) => {
        vm.foo = response.data
      })
      .catch((error) => {
        console.log(error)
      })
  }
  // methods() {
  //   login() {
  //     fooApi
  //       .login( this.userid, this.password )
  //       .then(response => {
  //         console.log(response.data)
  //       })
  //       .catch(error => {
  //         console.log(error)
  //       })
  //   }
  // }
}
</script>
