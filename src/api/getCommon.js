import http from './http'

export async function getCommonTotalUsers() {
  return http.post('api/getCommon/totalUsers')
}
