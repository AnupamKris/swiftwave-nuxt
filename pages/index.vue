<template>
  <div class="main">
    <h1>Swiftwave - Test</h1>
    <button @click="checkServer">Click to check server route!</button>
    <br /><br />
    <span>Random num from server - {{ val }}</span>
  </div>
</template>

<script setup>
const val = ref("");

const checkServer = async () => {
  const res = await $fetch("/api/serverTest");
  console.log(res);
  val.value = res.num;
};
</script>

<style lang="scss" scoped></style>
