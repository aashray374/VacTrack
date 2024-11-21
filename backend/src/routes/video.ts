import express from 'express';
import { addVideo , deleteVideo } from '../controllers/video';


const router = express.Router();


router.post('/addVideo', addVideo);
router.delete('/deleteVideo', deleteVideo);
router.get('/getVideos')

