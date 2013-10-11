# CIDC2013 Session Notes - Devstart.io 

===================================================
* Start Node server for local slide "master"! - http://localhost:8080/Devstart.io.html  
* Prep an IDE with the dashboard ready to show.  
   C:\Dev\Clarion\C9\bin\Clarion.exe /configdir=c:\Dev\Clarion\Softvelocity\Clarion\9.0.WithRecents
===================================================

## Slide - Intro

Hello Folks! Thanks for coming to this presentation, its great to be here!
Welcome also to those folks watching on-line, thanks for tuning in!

My name is Brahn Partridge, originally from Australia currently living and working in The Netherlands.

Many, many thanks to John and Arnold, the folks at Softvelocity and everyone else involved with CIDC2013 for putting it all together and giving me the opportunity to speak to you today!

----
Before I go any further I would like to direct your attention to the QRCode you see on the screen. Let me just make that a little larger...

## Slide (Down) to big QR Code!

You may have also picked up one of my cards, you will see a QRCode there as well. If you follow the link that provides, or for those who like to do it old-school type in the link you see in the top left - http://Devstart.io/cidc2013. Once that loads you will see a landing page with a "Join here" link. 

Now.. this is a little experimental but if it all works out, clicking on the "Join here" link will allow you to follow along with the slides on your laptop/phone/device/whatever as I give this presentation.

It works like this:

>As the master presentation navigates the slides, all client presentations will update in real time.
  - Multiplexing  

*I have left the controls enabled on the clients so you can skip forward and back if you want but each time I navigate in the master presentation your client will again return to mirroring the state of the master.*

**PERHAPS GIVE A MOMENT FOR EVERYONE TO GET SETUP**

----

This session is an introduction to and an overview of my Devstart.io project.

Primarily I am a Clarion developer but I do work with various other technologies depedning on what is needed... and occasionally, whatever grabs my attention. You would think maybe that I have too much spare time. Or is it because it is so cold and rainy in The Netherlands? (Any Clarioneers in the audience?) :D

## Slide - Goals

The Devstart.io project I am here to talk about is an AddIn for the Clarion IDE that gives you a great looking, integrated StartPage and lots more!

The goal of this session is to show you what Devstart.io is, what it can do and convince you that you absolutely cannot live without this awesome tool in your Clarion lives.

I am also curious to find out what you would like it to do once you see some of the things that are possible so if you don't get a chance to ask a question at the end of this session, find me in the solutions area, grab a card. I also spend far too much time on the CW-Talk skype chat.

If there is time I also want to showoff some of the tech and techniques used within the project, we will see how it goes.

Before we move on, I did a bit of "research" on giving tech presentations (i.e. watching a bunch of interesting tech talks!) and one thing that seemed to be a common occurrence was that about now is a good point to make a joke or show a funny picture or something...

## Joke slides!

BTW, these are from a site called thecodinglove.com in case you need a diversion at some point.

## Slide (Down)

when I change the css - haha

## Slide (Down)

when my code runs but is not what I expected - haha

## Slide (Down)

Me, putting these talks together :) - haha

(actually originally entitled "when I solve a bug 5 minutes before it goes in production" which I guess is also still applicable!)

## Slide - What is a Devstart.io ?!

Before I get into an actual demo I just want to take a moment to look at how all the different parts go together and try to figure out where Devstart.io sits.

Prior to the current generation of the Clarion IDE (or at least C4-6 as that is all I have ever used) we had available something sort of like what I have listed on the screen now. An IDE which uses AppGen, Templates and Source code to, optionally, generate more source code which is ultimately, usually, compiled to executables and DLLs.

Then along comes C7/8/9 which allows for something new and very exciting to the clarion environment.

>Anyone care to take a guess what that is?

(no cheating and skipping forward though!)

*... try to get an answer from the audience here ...*

### Fragment

Thats right, **AddIns!!** 

### Fragment

So... this Devstart.io thing is an AddIn. It is also the first AddIn you will "see" when you load the IDE. Well, technically pretty much all of the IDE is comprised of AddIns but Devstart.io is the first thing you will interact with once loading is finished. **So, this is where your development starts ;)**DevStart... get it? Boom Ching!

### Fragment

**FLIP OVER TO A REAL QUICK LOOK AT THE DASHBOARD**
**TALK WHILE SHOWING THESE BITS**

It is designed to be a replacement to the shipping StartPage. With this installed you can do everything you could with the shipping StartPage. 

As well as a clean and fast interface to working with your recent files there is now a  Dashboard that shows clarion related news feeds, RSS feeds. Allowing you to keep up to date at a glance... that is what dashboards are for right?

> C:\Dev\Clarion\C9\bin\Clarion.exe /configdir=c:\Dev\Clarion\Softvelocity\Clarion\9.0.WithRecents

### Fragment

Metadata (meta content):

There are just place holders for this at the moment, my plan is to add support for additional meta data about projects, solutions, DCTs, files, etc.

**FLIP OVER REAL QUICK AND SHOW THE EXPANDED SOLUTION CONTENT**

On the plane over here I had a great idea.

> How many of you have used GitHub?

> And who remembers Readme files?!

On GitHub repositories you can have a "ReadMe" file, optionally written in a variaty of markup sytnaxes that gets displayed when you view your repository in the browser. 

How about the same thing for solutions? A simple text file with a specific name, the contents of which get rendered right here in the start page...

**SHOW GITHUB EXAMPLE**

https://github.com/fushnisoft/CIDC2013

At least on the solution level I think this might work really well. For individual files I will look at other was to store meta information, perhaps in the clarion config folder perhaps even synced online.

**Maybe having reading structured comments from within text files?**

Other examples might be:

  - Links to bug tracking systems that are specific to the resource 
  - AdHoc notes
  - Developer Team notes
  - Perhaps VC states
  - CI status indicators could be neat
  - This is one of those things I am here to research... what sort of additional data would be handy to see in an overview of your solutions/projects and other files?!

### Fragment

Devstart.io is also going to be your primary AddIn Management portal.

  - Install (including downloading)/Enable/Disable/Remove addins
  - View AddIn information, links to documentation, source etc.
  - Purchase and manage subscriptions.

By the way, I haven't even mentioned price yet. Devstart.io is a free product. Yes, all this awesome... FREE! 

(maybe draw a smiley face... Ctrl+1, click)

### Fragment

More on that in a second. 

At this stage it is not open source but once things have settled down I probably will open it up when I find the right kind of license. It also depends on what is allowed by the license in the HTML template I am using.

### Fragment

Metrics/Community

Metrics/Analytics about your Files and data and your connection to the wider clarion community resources. 

(note: see my session tomorrow for more on Analytics!)

> Time of session - Friday September 27, 2:30 pm

  * One of the things I would like to get out of this conference is an indication of what might be important metrics to know about your files and solutions. 

  How about
    * Lines of code?
    * CPU/Memory usage during complies
    * Number of compiles per day, per developer, etc
    * ?

Community
  * ClarionExchange, Clarion wikis, Code sharing, etc...

### Fragment

Anyway, no need to take it from me... Chuck knows the way things are! :D

## Slide (Down) - Editions

**READ FROM THE SLIDE**

## Slide (Down) - addins

Just quickly, what is an addin?

> How many of you have heard of ClarionAddins?
(this is where we see a room full of hands... right!!)

** Pretty much just quickly read out what is on the screen. Perhaps a little explanation of what addins are and moving right along! **

## Slide - demo

Ok, Time for a DEMO!!

At the moment Devstart.io is still in beta.

To get a link to the download you need to sign up on the web site. In your welcome email will be a link to the beta page. If you really want a direct link let me know but signing up online is preferable!

Do a quick demo, try to natter while doing it...

1. Plain Clarion:

* Uninstall Devstart.io!

**CLOSE IDE**

c:\Dev\Clarion\C9\accessory\Uninstall\Devstart.io\unins000.exe

C:\Dev\Clarion\C9\bin\Clarion.exe /configdir=c:\Dev\Clarion\Softvelocity\Clarion\9.0

2. Install Devstart.io

C:\Dev\CIDC2013\_support\Devstart.io-Setup-v2.9.exe

Plain clarion again:

C:\Dev\Clarion\C9\bin\Clarion.exe /configdir=c:\Dev\Clarion\Softvelocity\Clarion\9.0

3. Oh look, there is an update available! 
  - Click on it, skip the actual download and run this:

C:\Dev\CIDC2013\_support\Devstart.io-Setup-v2.11.exe
C:\Dev\Clarion\C9\bin\Clarion.exe /configdir=c:\Dev\Clarion\Softvelocity\Clarion\9.0

4. Ok, now we have the latest version. Nice but to me it still doesn't look quite right. Let me just grab a version with all the bits and pieces...

C:\Dev\Clarion\C9\bin\Clarion.exe /configdir=c:\Dev\Clarion\Softvelocity\Clarion\9.0.WithAddins

5. Ahh, thats better. Ok now lets poke around a bit and see what we have. First thing to do is pretend we have used it a little. Lets open up some files.

**In case of time issues, use this**

C:\Dev\Clarion\C9\bin\Clarion.exe /configdir=c:\Dev\Clarion\Softvelocity\Clarion\9.0.WithRecents

## Slide - The Tech 

**TODO:**Practice for timing, make notes of when this should skipped.

(If there is time)

I don't want to spend too long on this but even though it is not clarion I do think that a lot of the things here are really, really neat and have certainly influenced how I think about my clarion code (to the better!).

As well as being cool, having an overview of things that are possible might spark some ideas for new addins or features you might like to see in Devstart.io

* AddIns - created in C# using Visual Studio .NET Framework 2.0
* Devstart.io is making heavy use of the WebBrowser component. 
  - Perhaps mention the FEATURE_BROWSER_EMULATION and X-UA-Compatible things
* Metronic from Themeforest - affiliate link

>Metronic is a responsive and multipurpose admin and frontend theme powered with Twitter Bootstrap Framework.

>BOOTSTRAP - Sleek, intuitive, and powerful mobile first front-end framework for faster and easier web development.* 

**flip back and demo "responsive"?**

* Jekyll/Ruby (more in a moment)
* SublimeText 
  - Awesome editor

>Sublime Text is a sophisticated text editor for code, markup and prose. You'll love the slick user interface, extraordinary features and amazing performance.

* PowerShell
  * used to automate a lot of the deployment stuff

## Slide

Jeykll

**Quickly read over the slide**

I have used this to take a plain hard coded HTML/CSS/JS site "theme" and remove all the redundancies so it can be **GENERATED** to suit my needs.

This kind of stuff is, in my opinion, making web based work finally worth the hassle. I love static site generators, the templating engines out there are truly astounding and when you combine these with server side code it really starts to get powerful. 

## Slide

Quick look at the main layout

**TODO:**confirm this idea and prep it.

  * Perhaps switch to an original page example?

## Slide

This is what an almost "blank" page looks like.

**TODO:**confirm this idea and prep it.

  * Perhaps switch to the output?

## Slide

Discuss Devstart.io

**TODO:**Expand on the details

### Things it currently does

  * Recent items
  * News Feeds
  * AddinManager - almost finished!
  * Basic usage metrics

### Thing that I want it to do

  * More advanced metrics - local only and global shared
  * Solutions/Code related metrics, compile times, lines of code, etc
  * Configurable News Feeds
  * Snippet Interface (code snippets, via GIST)
  * ClarionExchange - perhaps even similar to NuGet?
  * All the meta data stuff previously mentioned

### Questions  

  * Ideas that people might have
  * Maybe engage the audience by asking which of the features they would like to see?
  * Code Questions?
