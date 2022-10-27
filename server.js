const app = require("./index");

const connect = require("./src/configs/db");

const PORT = process.env.PORT || 300;

app.listen(PORT, async () => {
  await connect().then(() =>{
    console.log('mongodb connected')
  });
  console.log("listening to port", PORT);
});
