<template>
  <div class="infinite" align="center">
    <el-container>
      <el-main>
        <!--        <el-table :data="tableData" style="width: 100%">-->
        <!--          <el-table-column-->
        <!--            class="infinite-list"-->
        <!--            v-infinite-scroll="load"-->
        <!--            style="overflow: auto"-->
        <!--            v-for="item in tableStructure"-->
        <!--            :key="item.prop"-->
        <!--            :prop="item.prop"-->
        <!--            :label="item.label"-->
        <!--          ></el-table-column>-->
        <!--        </el-table>-->

        <ul class="infinite-list" v-infinite-scroll="load" style="overflow: auto">
          <li v-for="{ id, name, email } in tableData" class="infinite-list-item" v-bind:key="id">
            {{ id }} {{ name }} {{ email }}
          </li>
        </ul>
      </el-main>
    </el-container>
  </div>
</template>

<script>
import * as getUserAPI from '@/api/getUser'

export default {
  data() {
    return {
      page: 1,
      firstPage: 100,
      perPage: 100,
      tableStructure: [
        { label: 'ID', prop: 'id' },
        { label: 'Name', prop: 'name' },
        { label: 'Email', prop: 'email' }
      ],
      tableData: [],
      loading: false
    }
  },
  methods: {
    getUserDo(pagesize) {
      getUserAPI
        .getUser(this.page, pagesize)
        .then((response) => {
          this.tableData = response.data.result
          console.log(response)
          this.page += 1
        })
        .catch((error) => {
          console.log(error)
        })
    },
    scroll() {
      window.onscroll = () => {
        const bottomOfWindow =
          Math.max(
            window.pageYOffset,
            document.documentElement.scrollTop,
            document.body.scrollTop
          ) +
            window.innerHeight ===
          document.documentElement.offsetHeight
        if (bottomOfWindow) {
          console.log('BOTTOM')
          this.loading = true
          this.load()
        }
      }
    },
    load() {
      if (this.loading !== false) {
        getUserAPI
          .getUser(this.page, this.perPage)
          .then((response) => {
            const vm = this
            response.data.result.forEach((result) => {
              vm.tableData.push(result)
            })
            this.page += 1
            console.log(response)
          })
          .catch((error) => {
            console.log(error)
          })
        this.loading = false
      }
    }
  },
  mounted() {
    this.scroll()
    this.getUserDo(this.firstPage)
    this.page = this.firstPage / this.perPage
  }
}
</script>

<style>
.el-container {
  width: 800px;
}
</style>
