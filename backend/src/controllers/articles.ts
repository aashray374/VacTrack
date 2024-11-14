import { log } from 'console';
import express, { Request, Response } from 'express';
import { Articles } from '../models/articles'

export const addArticle = async (req:Request,res: Response) : Promise<void> =>{
      try {
            const { title, img, url } = req.body;


    if (!title || !img || !url) {
      res.status(400).json({ message: 'Title, image URL, and URL are required' });
    }

    // Create the article
    const article = await Articles.create({ title, img, url });
    res.status(201).json(article);
      } catch (error) {
            console.log(`Server error ${error}`);
            res.status(500).json({ message: 'Error deleting appointment', error });
      }
}

export const deleteArticle = async (req: Request, res: Response) : Promise<void> =>{
      try {
            const {id} = req.body;

            const article =await Articles.findByPk(id);

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