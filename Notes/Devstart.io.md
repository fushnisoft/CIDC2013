# CIDC2013 Session Notes - Devstart.io 

## Slide - Intro

Hello Folks! Thanks for coming, I will do my very best not to waste your time in this session and who knows, may you at least be entertained :)

> Direct a comment to online people too.

Welcome also to those folks watching online, thanks for tuning in!

My name is Brahn Partridge and I work as a ZZP'er for my company Fushnisoft in the Netherlands ('Zelfstandige Zonder Personeel' or Self-Employed Without Staff). 

This session is

  - An introduction and overview of my Devstart.io project.
  - I am primarily a Clarion developer at my company Fushnisoft but I do work with various other technologies to do whatever is needed to find the best solution for a given project... or whatever I happen to think is cool at the time when I obviously have too much spare time. Or is it because it is so cold and rainy in The Netherlands? :D
  - Many, many thanks to John and Arnold and everyone else involved with CIDC2013 for putting this all together and allowing me to give this presentation!

## Slide - Goals

The Devstart.io project I keep referring to is an addin for the Clarion IDE that brings you a stylish, integrated StartPage for the Clarion IDE and so much, much more!

The primary goal of this session is to show you what Devstart.io is, what it can do and convince you that you cannot live without this awesome tool in your Clarion lives.

If there is time I also want to showoff some of the tech and techniques used within the project.

First though, I did a bit of "research" on giving tech presentations and one thing that seemed to be a theme was that now is a good point to make a joke or show a funny picture or something...

## Joke slides!

CSS - haha

Legacy Code - haha

## Slide - What is a Devstart.io ?!

Before we get into a demo lets just take a moment to see how all the different parts go together.

Prior to this latest generation of Clarion IDEs we had what you see on the screen now. An IDE which uses AppGen, Templates and Source code to, optionally, generate more source code which is ultimately, usually, compiled to executables and DLLs.

Then along comes C7/8/9 which adds another thing to the mix. 

>Anyone care to take a guess what that is?

*try to get an answer...*

### Fragment

Thats right, **AddIns!!** 

### Fragment

This Devstart.io thing is an AddIn. This is where your development starts ;) 

### Fragment
It is a replacement to the StartPage you see when you first open the IDE. As well as an interface to selecting recent files the Dashboard shows clarion related newsfeed.

### Fragment
The intention is to add support for additional meta data on your projects, solutions and files used for development.
  * Examples of what you mean by "meta data"! 

### Fragment
It is also your AddIn Management portal.
 * Mention Devstar.io is FREE

### Fragment
Metrics/Analytics about your Files and data and your connection to the wider clarion community resources.
  
  * One of the things I would like to get out of this conference is an indication of what might be important metrics to know about your files and solutions. 

### Fragment
I mean, if Check approves what more can I say! :)

## Slide (Down) - addins
Just quickly, what is an addin?

> How many of you have heard of ClarioAddins?
(this is where we see a room full of hands... right!!)

** Pretty much just quickly read out what is on the screen. Perhaps a little explanation of what addins are and moving right along! **

## Slide - demo
Ok, Time for a DEMO!!

Explain where to get it and off we go..

Do a quick demo, try to natter while doing it...
  - Where to get the download
  - Download it
  - Install it
  - Open it up

  Now do a click-around of Devstart.io
    * Make sure that the recent items is blank at this stage, maybe point that out as well.
    * Make sure the theme starts at default and make a point of setting it to match the IDE theme color
    * etc, etc

** FIX THE MINIMUM WIDTH **

## Slide - The Tech 

(If there is time)

I don't want to spend too long on this but even though it is not clarion I do think that a lot of the things here are really, really neat and have certainly influenced how I think about my clarion code (to the better!)

* AddIns - created in C# using Visual Studio .NET Framework 2.0
* Devstart.io is making heavy use of the WebBrowser component. 
  - Perhaps mention the FEATURE_BROWSER_EMULATION and X-UA-Compatible things
* Metronic from Themeforest - affiliate link
  - Metronic is a responsive and multipurpose admin and frontend theme powered with Twitter Bootstrap Framework.

  * BOOTSTRAP - Sleek, intuitive, and powerful mobile first front-end framework for faster and easier web development.* 

  ** flip back and demo "responsive" **
* Jekyll/Ruby (more in a moment)
* SublimeText 
  - awesome editor
  - Sublime Text is a sophisticated text editor for code, markup and prose. You'll love the slick user interface, extraordinary features and amazing performance.
* PowerShell
  - used to automate a lot of the deployment stuff

## Slide
Jeykll

I have used this to take a plain hard coded HTML/CSS/JS site "theme" and remove all the redundancies so it can be **GENERATED** to suit my needs.

## Slide

Quick look at the main layout
  * Perhaps switch to an original page example?

## Slide

This is what an almost "blank" page looks like.
  * Perhaps switch to the output?

## Slide

Discuss Devstart.io
  * Things it currently does
  * Thing that I want it to do
  * Ideas that people might have
  * Maybe engage the audience by asking which of the features they would like to see?

-----------------------
Setup notes

- link to http://devstart.io/CIDC2013.html
- clean VMs
- clean Clarion 
- clean Console.app 
- clean Invoice.app
- clean Piwik
- make sure the session files are in sync!