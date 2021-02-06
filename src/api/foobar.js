import http from './http'

export async function getFoo() {
  return http.get('api/getFoo')
}

// export async function login(){
//   return http.post('/login', {
//     userid,
//     password,
//   })
// }
