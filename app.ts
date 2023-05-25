import express from "express";
import { createClient } from "redis";
let app = express();

app.get("/", async (req: express.Request, res: express.Response) => {
  const client = createClient({
    url: process.env.REDIS_CONN_STRING,
  });

  client.on("error", (err: any) => console.log("Redis Client Error", err));
  await client.connect();
  await client.set("key", "value");
  const value = await client.get("key");
  console.log({ value });
  await client.disconnect();
  res.send("Hello Railway TypeScript!");
});

app.listen(process.env.PORT, () => {
  console.log("Example app listening on port " + process.env.PORT);
});
