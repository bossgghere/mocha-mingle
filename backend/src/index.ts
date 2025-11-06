import express from 'express';
import cors from 'cors';
import dotenv from 'dotenv';
import { PrismaClient } from '@prisma/client';
import { Request, Response } from 'express';
import { it } from 'node:test';

dotenv.config()

const app=express()
const prisma = new PrismaClient()


app.use(cors());
app.use(express.json());


app.get('/',(req,res)=>{
    res.json({
        message: 'Mocha Mingle Backend is working!',
        status: 'healthy' 
    })
})


//api/restaurant

app.get('/api/restaurant', getRestaurants)
app.post('/api/restaurant', addRestaurant)

async function getRestaurants(req: Request, res: Response) {
    try {
        const restaurants = await prisma.restaurant.findMany()
        res.status(200).json({
            message: "successfully fetched the restaurants",
            data: restaurants
        })
    }
    catch {
        res.status(500).json({ message: "error while getting restaurants from db" })
    }
}

async function addRestaurant(req: Request, res: Response) {
    try {
        const { name } = req.body;
        const restaurant = await prisma.restaurant.create({
            data: { name }
        })
        res.status(201).json({
            message: "successfully added the restaurant",
            data: restaurant
        })
    }
    catch {
        res.status(500).json({ message: "error while adding restaurant to db" })
    }
}





//api/items
app.get('/api/items',getItem)
app.post('/api/items',addItem)

async function getItem(req:Request,res:Response) {
    try{
        const items=await prisma.item.findMany({
            include:{
                restaurant:true
            }
        })
        res.status(200).json({
            message: "successfully fetched items",
            data: items
        })
    }
    catch{
        res.status(500).json({ message: "error while getting items from db" })
    }
}


async function addItem(req:Request,res:Response) {
    try{
        const { name, description, price, restaurantId, imageUrl } = req.body;
        const item=await prisma.item.create({
            data:{
                name,
                description,
                price,
                restaurantId,
                imageUrl
            }
        })
        res.status(201).json({
            message: "successfully added items",
            data: item
        })
    }
    catch (e) {
  console.error("Add item error:", e);
  res.status(500).json({ message: "error while adding items to db", error: e })
}
}




//api/users
app.get('/api/users', getUsers)
app.post('/api/users', addUser)

async function getUsers(req:Request,res:Response) {
    try{
        const users=await prisma.user.findMany({
            include:{
                orders:true
            }
        })
        res.status(200).json({
            message:"successfully fetched all the users from db",
            data:users
        })
    }
    catch{
        res.status(500).json({ message: "error while getting users from db" })
    }   
}
async function addUser(req:Request,res:Response) {
    try{
        const {name,email} = req.body
        const user=await prisma.user.create({
            data:{
                name,
                email,
            }
        })
        res.status(201).json({
            message:"successfully added a new user to db",
            data:user
        })
    }
    catch{
        res.status(500).json({ message: "error while adding user to db" })
    }  
}

// api/orders
app.get('/api/orders',getOrders)
app.post('/api/orders',addOrder)


async function getOrders(req:Request,res:Response) {
    try{
        const orders=await prisma.order.findMany({
            include:{
                user:true,
                restaurant:true,
                items:{
                    include:{
                        item:true
                    }
                }
            }
        })
        res.status(200).json({
            message: "successfully fetched orders",
            data: orders
        })
    }
    catch{
        res.status(500).json({message:"error while gettin the orders"})
    }
}


async function addOrder(req: Request, res: Response) {
    try {
        const { userId, restaurantId, items, totalPrice } = req.body;
        
        const order = await prisma.order.create({
            data: {
                userId,
                restaurantId,
                totalPrice,
            }
        })

        for (const orderItem of items) {
            await prisma.orderItem.create({
                data: {
                    orderId: order.id,
                    itemId: orderItem.itemId,
                    quantity: orderItem.quantity,
                    size: orderItem.size,
                    price: orderItem.price
                }
            })
        }

        res.status(201).json({  // Change to 201 (Created)
            message: "successfully added the order",
            data: order
        })
    }
    catch (error) {  // Add error parameter for debugging
        console.log(error);  // Log the actual error
        res.status(500).json({ message: "error while adding the order to db" })
    }
}


app.listen(3000,()=>{
    console.log("server runing at 3000")
})