import express from "express";
let app = express();

app.get("/", (req: express.Request, res: express.Response) => {
  res.send("Hello Railway TypeScript!");
});

app.listen(3000, () => {
  console.log("Example app listening on port 3000!");
});
