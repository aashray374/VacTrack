import { log } from 'console';
import express, { Request, Response } from 'express';
import { Videos } from '../models/videos';


export const addVideo = async (req:Request,res: Response) : Promise<void> =>{
      try {
            const { url } = req.body;


    if (!url) {
      res.status(400).json({ message: 'Title, image URL, and URL are required' });
    }

    // Create the article
    const article = await Videos.create({ url });
    res.status(201).json(article);
      } catch (error) {
            console.log(`Server error ${error}`);
            res.status(500).json({ message: 'Error deleting appointment', error });
      }
}

export const deleteVideo = async (req: Request, res: Response) : Promise<void> =>{
      try {
            const {id} = req.body;

            const article =await Videos.findByPk(id);

            if(!article){
                  res.status(404).json({ message: 'article not found' });
            }else{

                  await article.destroy();
            }
      } catch (error) {
            console.log(`Server error ${error}`);
            res.status(500).json({ message: 'Error deleting appointment', error });
      }
}


export const getAllVideos = async (req: Request, res: Response): Promise<void> => {
      try {
          // Fetch all videos from the Videos table
          const videos = await Videos.findAll();
  
          // Check if no videos are found
          if (videos.length === 0) {
              res.status(404).json({ message: 'No videos found' });
              return;
          }
  
          // Return the videos in response
          res.status(200).json({
              message: 'Videos fetched successfully',
              videos,
          });
      } catch (error) {
          console.error(`Error fetching videos: ${error}`);
          res.status(500).json({ message: 'Error fetching videos', error });
      }
  };