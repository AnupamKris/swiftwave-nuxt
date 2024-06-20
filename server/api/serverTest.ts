export default defineEventHandler((event) => {
  // generate random number

  let num = Math.floor(Math.random() * 100);
  return {
    num,
  };
});
