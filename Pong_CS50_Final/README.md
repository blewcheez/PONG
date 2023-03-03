# My Final Project for Haravard's CS50 
# Project title: pong

# Video demo: <https://youtu.be/1e5Bl4Jbdc8>

### Description: for my final project I wanted to create a 2D video game using the game engine LOVE with the programming language Lua. I've settled on the fairly simple game of table tennis that was first introduced on the atari long time ago.

## Main.lua: 
### This is the main file of my game that's going to handle all of the functions of the game such as updating the Player and AI movement and score, drawing the the paddles, ball, player & ai, as well as the scoreboard. This main.lua file is also going to ensure each file is called when the game starts up and check for collisions between ball, wall, and players. 

## Ball.lua 

### This is the ball file created for the game of pong that has a set speed and dimensions to determine that it is in ball form (a small square) as much as possible. I've thought about speeding the ball up the longer you play, but I want to make the game friendly for the casual player. 

## Player.lua

### This is the player file that I've created so that we can interact with the AI. Since this is a 2D table tennies game, in the movement functions I've made it so the controls are 'w' for up and 's' for down. This function is going to update when called back to the main file. 

## AI.lua

### This file is made for the automated AI that we can play against. It's similar to the player file with a few changes. There is a timer and rate variable included so we can have a chance at winning. The aquireTarget function is so the AI can track the ball. The timer variable is created to delay the update function. This makes it possible for the AI to miss hitting the ball. 

## conf.lua

### This conf file shows us the description of the game as well as the version that we're using for the game and the height for the window. 