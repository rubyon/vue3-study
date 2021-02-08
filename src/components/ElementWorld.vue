<template>
  <div class="element">
    <el-container>
      <el-main>
        <el-form :inline="true" :model="formInline" class="demo-form-inline">
          <el-form-item label="Username">
            <el-input v-model="formInline.name" placeholder="Username"></el-input>
          </el-form-item>
          <el-form-item label="Email address">
            <el-input v-model="formInline.email" placeholder="Email address"></el-input>
          </el-form-item>
          <el-form-item>
            <el-button type="primary" @click="onSubmit">Query</el-button>
          </el-form-item>
        </el-form>
        <el-table
          :data="tableData"
          :default-sort="{ prop: 'id', order: 'descending' }"
          style="width: 100%"
        >
          <el-table-column
            v-for="item in tableStructure"
            :key="item.prop"
            :prop="item.prop"
            :label="item.label"
          ></el-table-column>
        </el-table>
        <div class="block">
          <span class="demonstration">&nbsp;</span>
          <el-pagination
            background
            @size-change="handleSizeChange"
            @current-change="handleCurrentChange"
            v-model:currentPage="currentPage"
            :page-sizes="pageSizes"
            :page-size="pageSize"
            layout="total, sizes, prev, pager, next, jumper"
            :total="usersCount"
          >
          </el-pagination>
        </div>
      </el-main>
    </el-container>
  </div>
</template>

<script>
import * as getUserAPI from '@/api/getUser'
import * as setUserAPI from '@/api/setUser'
import * as getCommonAPI from '@/api/getCommon'

export default {
  name: 'ElementWorld',
  data() {
    return {
      pageSizes: [10, 25, 50, 100],
      pageSize: 10,
      currentPage: 1,
      usersCount: '',
      tableStructure: [
        { label: 'ID', prop: 'id' },
        { label: 'Name', prop: 'name' },
        { label: 'Email', prop: 'email' }
      ],
      tableData: [],
      formInline: {
        name: '',
        email: ''
      }
    }
  },
  mounted() {
    this.getUserDo(this.pageSize)
    this.getCommonTotalUsersDo()
  },
  methods: {
    getUserDo(pagesize) {
      getUserAPI
        .getUser('1', pagesize)
        .then((response) => {
          this.tableData = response.data.result
          console.log(response)
        })
        .catch((error) => {
          console.log(error)
        })
    },
    getCommonTotalUsersDo() {
      getCommonAPI
        .getCommonTotalUsers()
        .then((response) => {
          this.usersCount = response.data.result
          console.log(response)
        })
        .catch((error) => {
          console.log(error)
        })
    },
    handleCurrentChange(val) {
      getUserAPI
        .getUser(val, this.pageSize)
        .then((response) => {
          this.tableData = response.data.result
          console.log(response)
        })
        .catch((error) => {
          console.log(error)
        })
    },
    handleSizeChange(val) {
      this.pageSize = val
      this.getUserDo(this.pageSize)
    },
    onSubmit() {
      console.log('submit!')
      setUserAPI
        .setUser(this.formInline.name, this.formInline.email)
        .then((response) => {
          this.getUserDo(this.pageSize)
          this.currentPage = 1
          this.getCommonTotalUsersDo()
          this.formInline.name = ''
          this.formInline.email = ''
          console.log(response)
        })
        .catch((error) => {
          console.log(error)
        })
    }
  }
}
</script>
