import http from './http'

export async function getUser(page, perpage) {
  return http.post('api/getUser', { page, perpage })
}
