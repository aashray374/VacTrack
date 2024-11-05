import express from 'express';
import {connect} from './db/connect'
import parentRoutes from './controllers/parent'

const app = express();
const port = 3000;


// using express.json because the request body is in json
app.use(express.json());

// creating a db connection
connect();


//connecting to routes here
app.use("/api", parentRoutes);

// lostening to a port
app.listen(port, () => {
  console.log(`Server listening on port ${port}`);
});