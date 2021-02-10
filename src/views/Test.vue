<template>
  <p>count: {{ count }}</p>
  <button @click="count++">count update</button>
  <p>list: {{ list }}</p>
  <button @click="updateList(list)">list push</button>
  <p>readOnlyCount: {{ readOnlyCount }}</p>
  <button @click="readOnlyCount++">readOnlyCount update</button>
  <hr />
  <p>failedCount: {{ failedCount }}</p>
  <button @click="failedCount++">count update</button>
  <p>failedList: {{ failedList }}</p>
  <button @click="updateList(failedList)">list push</button>
</template>

<script>
import { ref, reactive, readonly } from 'vue'

export default {
  setup() {
    const count = ref(0) // 단순값인 ref를 사용했다
    const list = reactive([]) // 배열임으로 reactive를 사용했다
    const readOnlyCount = readonly(count) // ref를 이용한 값에 readonly 속성을 지정하여 새로운 변수로 지정했다. 업데이트를 하려 해도 업데이트가 되지 않으며 count가 올라갈때 자동으로 참조되어 업데이트된다

    const failedCount = reactive(0) // 단순값을 지정해야 할 곳에 reactive를 사용했다. 값이 반영되지 않는다.
    const failedList = ref([]) // 배열에 ref를 사용했다. 값이 반영되지 않는다.

    const updateList = (base) => {
      base.push(Math.random()) // 왜인지 모르겠는데 직접 참조하면 안되는것이 function으로 동적으로 받아서 push하면 ref/reactive 상관없이 배열/셋이 반응한다. 버그인것같은데, 코드의 의도만 파악해주시라.
    }

    return {
      count,
      list,
      readOnlyCount,
      failedCount,
      failedList,
      updateList
    }
  }
}
</script>
