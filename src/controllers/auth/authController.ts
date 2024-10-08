import { Request, Response } from "express";
import logger from "../../utils/winston";
import authService from "../../services/auth/authService";
var jwt = require('jsonwebtoken');
import crypto from 'crypto';

const signin = async (req: Request, res: Response) => {
  try {
    const { userName, password } = req.body;
    logger.info(`Sign In start for username : ${userName}`);
    let hashedPassword = hashPassword(password);
    const user = await authService.signin(userName, hashedPassword);
    const permission = await authService.getPermission(user.id);
    if (user) {
      let data = {
        token: jwt.sign(user, process.env.SECRET_KEY, { algorithm: 'HS256' }),
        type: user.user_type,
        username: user.username,
        name: user.first_name + " " + user.last_name,
        id: user.id,
        cellphone: user.cell_number,
        avatar: user.avatar,
        user_type: user.user_type,
        permissions: permission
      };
      logger.info(`Sign In completed for username : ${userName}`);
      res.status(200).json({ status: true, message: "Logged in successfully", data: data });
    } else {
      logger.debug(`Invalid username or password : ${userName}`);
      res.status(400).json({ status: false,  message: "Invalid username or password" });
    }
  } catch (error) {
    logger.error(`Error signin in: - ${error}`);
    res.status(500).json({ status: false, message: "An error occurred while signing in" });
  }
};

const hashPassword = (password: string): string => {
  return crypto.createHash('md5').update(password).digest('hex');
};


export default {
  signin
};
