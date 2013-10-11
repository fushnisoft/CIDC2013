# CIDC2013 Session Notes - App Analytics

===================================================
* Start Node server for local slide "master"! - http://localhost:8080/AppAnalytics.html
* Start the Piwik bitnami VM
* Prepare the IDE with recent items for ConsoleTest and Invoice.app
    C:\Dev\Clarion\C9\bin\Clarion.exe /configdir=c:\Dev\Clarion\Softvelocity\Clarion\9.0.WithRecents
* Check the hosts file, make sure it points correctly to the piwik VM IP.
===================================================

## Slide - Intro

Hello Folks! Thanks for coming to this presentation, its great to be here!
Welcome also to those folks watching on-line, thanks for tuning in!

My name is Brahn Partridge, originally from Australia currently living and working in The Netherlands.

Many, many thanks to John and Arnold, the folks at Softvelocity and everyone else involved with CIDC2013 for putting it all together and giving me the opportunity to speak to you today!

----
Before I go any further I would like to direct your attention to the QRCode you see on the screen. Let me just make that a little larger...

## Slide (Down) to big QR Code!

If you have picked up one of my cards, you will see a QRCode there as well. Take a moment now to fire up your QRCode scanner, or for those who like to do it old-school type in the link you see in the top left - http://Fushnisoft.com/cidc2013

Now.. this is a little experimental but if it all works out, you will be able to follow along with the slides on your laptop/phone/device/whatever as I give this presentation.

It works like this:

>As the master presentation navigates the slides, all client presentations will update in real time.
  - Multiplexing  

*I have left the controls enabled on the clients so you can skip forward and back if you want but each time I navigate in the master presentation your client will again return to mirroring the state of the master.*

**PERHAPS GIVE A MOMENT FOR EVERYONE TO GET SETUP**

## SLIDE (Down) Invoice.app

----

This session is an introduction to Analytics and more specifically, App Analytics.

Quick Question...

> Who uses GoogleAnalytics for their website(s)? 

Ok great, so hopefully you guys will have an idea of what I am going on about!

Another question...

> Who has a website and DOESN'T know when someone visits their site or even IF someone has visited their site?

Interesting... :)

Ok, soo... Primarily I am a Clarion developer but I do work with various other technologies depending on what is needed... and occasionally, whatever grabs my attention. Maybe I have too much spare time (my wife and son certainly disagree there!), Perhaps it is the lack of sunlight in the netherlands :D

## Slide - Goals

Discovering Analytics - what is it, what options are there?

  * We will learn a little about the term Analytics
  * I will try to define it a little more, perhaps see what contexts or domains of analytics are available and try to see what is relevant to us as Clarion App Developers.
  * What options already exists for Analytics and more specifically App Analytics.

Some Buzzwordd

  * Metrics 

    - of or relating to measurement
    - the art of using poetic metre

  * Telemetrics or Telemetry

    - Telemetry is the highly automated communications process by which measurements are made and other data collected at remote or inaccessible points and transmitted to receiving equipment for monitoring

  * Analytics

    - the science of logical analysis
    - The branch of logic dealing with analysis
       * online dictionaries
    - Digital Analytics is a set of business and technical activities that define, create, collect, verify or transform digital data into reporting, research, analyses, recommendations, optimization, predictions, and optimizations. - Wikipedia

 * Big Data...

   - Wikipedia: Since analytics can require extensive computation (See Big Data)
   - data sets, typically consisting of billions or trillions of records, that are so vast and complex that they require new and powerful computational resources to process: 

>"Big data" has increased the demand of information management specialists in that Software AG, Oracle Corporation, IBM, Microsoft, SAP, EMC, HP and Dell have spent more than $15 billion on software firms only specializing in data management and analytics.

  * Code - .NET Interop, Clarion wrappers and the Invoice.app!

Using a range of different techniques and the occasional tangent we will see how to put some code into a clarion application (the famous invoice.app) which will collect and send data to be used for analysis and try to derive some meaning from it!

Before we move on, I did a bit of "research" on giving tech presentations (i.e. watching a bunch of interesting tech talks!) and one thing that seemed to be a common occurrence was that about now is a good point to make a joke or show a funny picture or something...

## Slide (Down) Joke slides!

BRB - haha

## Slide (Down)

- Take-Your-Child-To-Work Day and the BRB
http://thedailywtf.com/Articles/The_Big_Red_Button.aspx

## Slide - Seriously

What are Analytics?!?!

> Read the slide... blah, blah

### Fragment 

There are a whole BUNCH of different "Something" Analytics. I picked a few and will cover them here briefly.

Business Analytics

>Business analytics (BA) refers to the skills, technologies, applications and practices for continuous iterative exploration and investigation of past business performance to gain insight and drive business planning.[1] Business analytics focuses on developing new insights and understanding of business performance based on data and statistical methods. In contrast, business intelligence traditionally focuses on using a consistent set of metrics to both measure past performance and guide business planning, which is also based on data and statistical methods.

- wikipedia

A couple of the headings from there:

  * Types of analytics (4 of them)
  * Basic domains within business analytics (14!)
  * See Also - Data mining, Business Intelligence, etc

### Fragment 

Operational Analytics

>In simplest terms, what I mean by operational analytics is analytics being done on the fly as part of operational business processes. 
  - http://www.dbms2.com/2011/11/08/terminology-operational-analytics/

>analytics that improve the efficiency or effectiveness of a business process.

  - http://portfortune.wordpress.com/2013/01/31/analytic-applications-part-three-operational-analytics/

You may be noticing a pattern, all of these definitions of analytics use the word analytics... 

### Fragment 

Web Analytics

I found a site that referenced the "Web Analytics Association" out there. That was a new one to me. Actually following their link led to a "Digital Analytics Association" so I guess they decided they were not generic enough.

> "Web Analytics is the measurement, collection, analysis and reporting of Internet data for the purposes of understanding and optimizing Web usage."

This was a good one:

> "Analytics is the process of obtaining an optimal and realistic decision based on existing data."
  - http://online-behavior.com/analytics/definition

### Fragment 

App Analytics

Actually, I am wondering if I may have accidentally contributed to the buzzword eco system a little here. App Analytics may be better expressed as "Desktop Analytics" or "Application" Analytics. I used the word "App" when I pitched the idea for this talk to provide a connection to a Clarion "APP". It also bring up an association to mobile "apps" which is not entirely incorrect but still a slightly different domain to desktop app.

## Slide (down) - table

Understanding analytics types and needs - Neil Raden, Jan 08, 2013

The table show here is from one of the better articles I found on the topic "Types of Analytics". Most seem to be discuss the various forms of analytics within their own specific domain.

Types of Analytics

amusing anectode, doing a web search on "Types of Analytics" the first page of hits contains 
  * Business analytics - Wikipedia, the free encyclopedia
  * 4 Major Types of Analytics | Infogroup
  * The Five Types Of Analytics - Information Builders.
  * Eight levels of analytics | SAS
  * 11 Types of Analytics for 2011 | Get Elastic Ecommerce Blog
  * etc, etc

**DO A WEB SEARCH AND SHOW THIS**

As you can see, not everyone agrees on Analytics. I suspect it is more to do with context though, so in each case the writer behind the link is referring to their specific domain. 
Additionally, a lot of these articles are referring to specif components of their domain as analytical elements whereas I think they are really just parts of the same thing. Different ways of viewing and interpreting the data. This is still relevant though! ** Define Analytics better please! **

> "I suggest coming up with a list of questions to be answered in the first place"
  - http://www.infogroup.com/resources/blog/4-major-types-of-analytics

Anecdote

I have been using Web Analytics for quite some time with my web sites, I find it quite useful to know what is going on, looking at patterns of when and why visitors end up at particular web pages, what keywords attract more interest sometimes to identify potential problems in usage patterns.

  It more recently dawned on me that this sort of information could be very useful to see in the Clarion Apps that I work on. In my work I am very rarely in contact with the end users of the application, I am in a different country and different timezone and quite often, as I am sure you have all experienced, users are not exactly the best at describing their issues...

> Bruce mentioned on wednesday how useful the logs can be in message box... Imagine that you could see that kind of data IN REAL TIME? And we will look at an example of that shortly from the Invoice.app data you guys have provided over the last few days in fact!

## Slide - options

Talk about some of the experiences with the various options.

Google Analytics
  - It's pretty hard to talk about analytics without this one. Especially in the Web Analytics domain, or web anything, Google are a big player and their Google Analytics are pretty fantastic. 

IBM Analytics
  - Just here because they are such a big player... I am sure there are loads of them doing it.

DeskMetrics
  - I saw this one mentioned a few times on stackoverflow. Looks good but expensive

TrackerBird
  - Great looking service. This is the one I considered very seriously before going for my final solution stack. I even went as far as to contact them with some questions about data retention options, exception stack traces and adhoc event data gathering. They gave a great candid response to my queries.
  Just a few weeks back I actually had a follow up to my original inquiry which must have been at least 6 months ago. They were contacting me to say that their new version includes a lot of the things I was asking about. Awesome service!

  I was pretty impressed so I went to Trackerbird and mentioned that I would be discussing their product here and they have offered the first 30 applicants a $100 voucher (equivalent to 2 months free starter account). I will post details of the offer to DevRoadmaps but basically you just need to email them and mention my name or the conference and they will sort you out.

Little software Stats
  - I discovered this one while poking around softalicious one day. It is a great looking options but a little on the immature side. Keep an eye on it though.

Open Web Analytics (OWA)
  - Included because it looks very similar to Piwik but I have not actually used it myself.

Splunk>Storm
  - This one looks pretty amazing but I never actually got it to work. At the time I was looking for a way to spit GPF reports up to a "somewhere" from client sites so the I could get reports and do analysis.

Piwik
  - finally Piwik, the solution I have settled on for App Analytics and something I have been for a while for Web Analytics anyway. This was already a mature project when I started with it and it just keeps getting better.
  - It is primarily for Web Analytics but I think it can be abused just fine for App analytics too.

KissMetrics, Mint, Flurry, Countly, Mixpanel, etc!
  - There are hundreds of others. Mostly meeting the demands of Mobile Analytics and several are specific to Windows 8/Phone "apps".

## Slide - Why Piwik

http://www.pebosi.net/200903/wie-spricht-man-piwik-aus
http://piwik.org/faq/new-to-piwik/#faq_85

> Do a bunch of talking about why I chose this option

* mobile app!

## Slide (Down) - Real-Time map
Click around...

## Slide (Down) - Page Titles
Click around...

## Slide (Down) - Custom Variables
Click around...

## Slide - Solution Stack

>A solution stack is an ordered collection of software that makes it possible to complete a particular task.  

>In computing, a solution stack is a set of software subsystems or components needed to deliver a fully functional solution, e.g. a product or service.

"Solution" in this case being the ability to gather data and perform analysis on that data.

We need:

> Read slide a little...

## Slide (Down) - LAMP or WAMP

Discuss the various components, VMs, appliances, production hosts, clout providers, etc...

* show the VM test environment.

## Slide (Down) - Visual Studio

Again, discuss the various components. Perhaps click over to gitHub occasionally, etc..

* Show VS
* Maybe point to my blog on NuGet UnmanagedExport
    http://www.clarionedge.com/clarion/clarion-and-net-interop-without-com.html

## Slide (Down) - Clarion

ConsoleSupport Class
* Point to GIST for the example?

CWAnalytics

DotNetSupport

More on this in a second!

## Pause for questions?

## Slide - on to the demos!

Demo of the ConsoleSupport class
Demo of GetNetProperty !!
Demo of PowershellInvoke !!
Looking at the http://piwik.local
Now let's put it together in the Invoice.app
Looking http://piwik.local again.

## Slide - What did we learn?

* What analytics are, how they can help

* Some buzzwords

* A bunch of new code, go get it on GitHub !!!

## Questions?