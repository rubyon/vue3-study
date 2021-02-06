<template>
  <div class="about">
    <h1>This is an about page</h1>
    <h2>API Server BaseURL: {{ apiServer }}</h2>
    <span>
      {{ apiServer }}/api/getFoo Json result:
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
      foo: '',
      apiServer: process.env.VUE_APP_API_SERVER
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
