// authMiddleware.ts
import { Request, Response, NextFunction } from "express";
import jwt from "jsonwebtoken";

// Middleware to check authorization
const authorize = (req: Request, res: Response, next: NextFunction) => {
  try {
    next();
    // const authHeader = req.headers["authorization"];
    // const token =
    //   authHeader && authHeader.startsWith("Bearer ")
    //     ? authHeader.split(" ")[1]
    //     : null;

    // if (!token) {
    //   return res.status(401).json({ message: "Unauthorised" });
    // }

    // jwt.verify(token, "your_secret_key", (err) => {
    //   if (err) {
    //     return res.status(403).json({ message: "Forbidden" });
    //   }
    //   next();
    // });
    // Verify the token or perform any other authorization check
    // For demonstration, assume token verification is successful

    // You can decode token and check roles/permissions here
    // const decoded = jwt.verify(token, 'your_secret_key');

    // Example: Check user role (assuming decoded token contains user role)
    // if (decoded.role !== 'admin') {
    //   return res.status(403).json({ message: 'Forbidden' });
    // }

    // If everything is fine, proceed to the next middleware/handler
  } catch (error) {
    return res.status(401).json({ message: "Unauthorized" });
  }
};

export default authorize;
