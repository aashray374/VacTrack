import { log } from 'console';
import express, { Request, Response } from 'express';
import { Parent } from '../models/parent';
import jwt from 'jsonwebtoken';
import bcrypt from 'bcrypt';
import { auth } from '../middlewares/auth'
import { Child } from '../models/child';

const router = express.Router();

router.post("/parent/create", async (req: Request, res: Response) => {
      const { password, email, name, adahar, location }:
            { password: string; email: string; name?: string; adahar?: string; location?: string } = req.body;

      try {
            const existingParent = await Parent.findOne({ where: { email } });
            if (!existingParent) {
                  const parent = await Parent.create({ email, password, name, adahar, location });

                  const payload = {
                        parent: {
                              id: parent.id
                        }
                  };


                  jwt.sign(payload, "VacTrack", {
                        expiresIn: "30d"
                  }, (err, token) => {
                        if (err) {
                              log(`JWT Error: ${err}`);
                              return res.status(500).json({ success: false, msg: 'Error signing token' });
                        }

                        res.status(200).json({
                              success: true,
                              token: token,
                        });
                  });
            } else {
                  res.status(400).json({ msg: 'Email already in use' });
            }
      } catch (error) {
            log(`Internal Server Error: ${error}`);
            res.status(500).json({
                  msg: "Internal Server Error",
                  err: error,
            });
      }
});


router.get("/parent/login", async (req: Request, res: Response) => {
      const { email, password }: { email: string; password: string } = req.body;

      try {
            const parent = await Parent.findOne({ where: { email } });
            if (parent == null) {
                  res.status(400).json({
                        msg: 'User with this email does not exists'
                  });
            } else {
                  const isMatch: boolean = await bcrypt.compare(password, parent.password);
                  if (isMatch) {
                        const payload = {
                              parent: {
                                    id: parent.id
                              }
                        };

                        jwt.sign(payload, "VacTrack", {
                              expiresIn: "30d"
                        }, (err, token) => {
                              if (err) {
                                    log(`JWT Error: ${err}`);
                                    return res.status(500).json({ success: false, msg: 'Error signing token' });
                              }

                              res.status(200).json({
                                    success: true,
                                    token: token,
                              });
                        });
                  } else {
                        res.status(400).json({
                              msg: "Invalid Password"
                        })
                  }
            }
      } catch (error) {
            res.status(500).json({
                  msg: "Internal Server Error",
                  err: error,
            });
      }
});


router.get("/getChildren", auth, async (req: Request, res: Response) => {
      try {
            const parentId = req.body.parent.id;

            const parent = await Parent.findOne({ where: { id: parentId }, include: [Child] });

            if (parent == null) {
                  res.status(404).json({
                        msg: "Parent Not Found",
                  });
            } else {
                  res.status(200).json({
                        msg: "Children found",
                        children: parent.children
                  });
            }
      } catch (error) {
            log(`internal server error ${error}`);
            res.status(500).json({
                  msg: 'Internal Srever error',
                  err: error
            });
      }
});


router.post("/addChild", auth, async (req: Request, res: Response) => {
      try {
            const parentId = req.body.parent.id;

            const parent = await Parent.findOne({ where: { id: parentId } });

            if (parent == null) {
                  res.status(404).json({
                        msg: "Parent Not Found",
                  });
            } else {
                  const { name, adahar, gender, dob, img } = req.body;

                  const newChild = await Child.create({
                        name,
                        adahar,
                        gender,
                        dob,
                        img,
                        parentId: parent.id 
                  });

                  res.status(200).json({
                        msg: "Child added successfully",
                        child: newChild
                  });
            }
      } catch (error) {
            log(error);
            res.status(500).json({
                  msg: "Internal Server Error",
                  err: error,
            });
      }
});






export default router;
