import http from './http'

export async function setUser(name, email) {
  return http.post('api/setUser', { name, email })
}
