import express from 'express';
import {connect} from './db/connect'
import parentRoutes from './controllers/parent'
import hospitalRoutes from './routes/hospital';

const app = express();
const port = 3000;


// using express.json because the request body is in json
app.use(express.json());

// creating a db connection
connect();


//connecting to routes here
app.use("/api", parentRoutes);
app.use("/api", hospitalRoutes);

// lostening to a port
app.listen(port, () => {
  console.log(`Server listening on port ${port}`);
});