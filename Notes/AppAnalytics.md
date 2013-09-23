# CIDC2013 Session Notes - App Analytics

insights about user actions inside your mobile application and helps improve your product.



Mobile App Analytics captures mobile app-specific usage data and integrates it with your Google Analytics account, where you can reapply your knowledge of web analytics to dedicated app reports. This suite of reports provides the tools and metrics you need to analyze and evaluate your app performance, including:

    the number of installations
    devices and networks used to access app
    the geographic location and languages spoken by visitors
    in-app purchase totals
    customized tracking of special content, like video
    the number of screens seen per visit, and the order in which visitors move through these screens


Types of Analytics

amusing anectode, doing a web search on "Types of Analytics" the first page of hits contains 
  * Business analytics - Wikipedia, the free encyclopedia
  * 4 Major Types of Analytics | Infogroup
  * The Five Types Of Analytics - Information Builders.
  * Eight levels of analytics | SAS
  * 11 Types of Analytics for 2011 | Get Elastic Ecommerce Blog
  * etc, etc

As you can see, not everyone agress on Analytics. I suspect it is more to do with context though, so in each case the writer behind the link is referring to their specific domain. 
Additionally, a lot of these articles are referring to spefic components of their domain as analytical elements whereas I think they are really just parts of the same thing. Different ways of viewing and interpreting the data. This is still relevant though! ** Define Analytics better please! **

-----------
* “Business Intelligence”, or BI reporting
* “Descriptive Analytics”:
* “Predictive Analytics”: 
* Optimization: 


"I suggest coming up with a list of questions to be answered in the first place"

http://www.infogroup.com/resources/blog/4-major-types-of-analytics

-------
Marketing analytics
Lifecycle analytics
Customer analytics
On-site engagement analytics
Funnel analytics


----------------
http://www.slideshare.net/NeilRaden/understanding-analytics-types-and-needs

http://www.desktop-web-analytics.com/
  - https://github.com/DesktopWebAnalytics/Desktop-Web-Analytics/downloads

Need a piwik site for console and invoice app testing
  - as well as a live site for invoice.app!

Framework 4 installer - http://www.microsoft.com/en-us/download/details.aspx?id=17718


## Slide - Intro

Hello Folks! Thanks for coming, I will do my very best not to waste your time in this session and who knows, may you at least be entertained if not edutained :)

> Direct a comment to online people too.

Welcome also to those folks watching online, thanks for tuning in!

My name is Brahn Partridge and I work as a ZZP'er for my company Fushnisoft in the Netherlands ('Zelfstandige Zonder Personeel' or Self-Employed Without Staff). 

This session is

  - An introduction to Analytics

> Who uses GoogleAnalytics for their website(s)? 

So those folks should at least have a starting point. App Analytics is very similar.

  - I am primarily a Clarion developer at my company Fushnisoft but I do work with various other technologies to do whatever is needed to find the best solution for a given project... or whatever I happen to think is cool at the time when I obviously have too much spare time. Or is it because it is so cold and rainy in The Netherlands? :D
  - Many, many thanks to John and Arnold and everyone else involved with CIDC2013 for putting this all together and allowing me to give this presentation!

** Discuss the relevance to how I work remotely and not in direct contact with the end users **

## Slide - Goals

Discovering Analytics - what is it, what options are there?
  * We will learn a little about the term Analytics
  * try to define it a little more, perhaps see what contexts are available
  * What options already exists for App Analytics
  * etc.
Buzzwords - 
  * Metrics 
    - of or relating to measurement
    - the art of using poetic metre

  * Telemetrics or Telemetry
    - Telemetry is the highly automated communications process by which measurements are made and other data collected at remote or inaccessible points and transmitted to receiving equipment for monitoring
  * Analytics
    - the science of logical analysis
 * Big Data...
   - Wikipedia: Since analytics can require extensive computation (See Big Data)
   - data sets, typically consisting of billions or trillions of records, that are so vast and complex that they require new and powerful computational resources to process: 


>"Big data" has increased the demand of information management specialists in that Software AG, Oracle Corporation, IBM, Microsoft, SAP, EMC, HP and Dell have spent more than $15 billion on software firms only specializing in data management and analytics.

Code - .NET Interop, Clarion wrappers and the Invoice.app!

## Joke slides!

BRB - haha

## Slide - Seriously

What are Analytics?!?!

> Read the slide... blah, blah

### Fragment 
Business Analytics
### Fragment 
Operational Analytics
### Fragment 
Web Analytics
### Fragment 
App Analytics

## Slide (down) - table

Understanding analytics types and needs - Neil Raden, Jan 08, 2013

this slide is one of the better resoruces I found on the topic. Most seem to be discuss the various forms of analytics within their own specific domain.

Types of Analytics

amusing anectode, doing a web search on "Types of Analytics" the first page of hits contains 
  * Business analytics - Wikipedia, the free encyclopedia
  * 4 Major Types of Analytics | Infogroup
  * The Five Types Of Analytics - Information Builders.
  * Eight levels of analytics | SAS
  * 11 Types of Analytics for 2011 | Get Elastic Ecommerce Blog
  * etc, etc

As you can see, not everyone agrees on Analytics. I suspect it is more to do with context though, so in each case the writer behind the link is referring to their specific domain. 
Additionally, a lot of these articles are referring to specif components of their domain as analytical elements whereas I think they are really just parts of the same thing. Different ways of viewing and interpreting the data. This is still relevant though! ** Define Analytics better please! **

> "I suggest coming up with a list of questions to be answered in the first place"
  - http://www.infogroup.com/resources/blog/4-major-types-of-analytics

## Slide - options

Talk about some of the experiences with the various options.

Google Analytics
  - can't talk analytics without this one.
  - somtimes you cannot avoid it but I have personally never felt comfortable with my history of data at the mercy of google. 
IBM Analytics
  - Just here because they are such a big player... I am sure there are loads of them doing it.
DeskMetrics
  - I saw this one mentioned a few times on stackoverflow. Looks good but expensive
TrackerBird
  - Great looking service. This is the one I considered most carefully before going for my final solution stack. I even went as far as to contact them with some questions about data retention options, exception stack traces and adhoc event data gathering. they gave me a great candid response and were very timely an helpful.
  - Just a week or so ago I actually recieved a follow up (the original enquiry was at least 6 months back) to say that their new version includes a lot of the thigns I was asking about. Awesome service!
Little software Stats
  - I discovered this one while poking around softalicious one day. It is a great looking options but a little on the immature side. Keep an eye on it though.
Open Web Analytics (OWA)
  - Included because it looks very similar to Piwik but I have not actually used it myself.
Splunk>Storm
  - This one looks pretty amazing but I never actually got it to work. At the time I was looking for a way to spit GPF reports up to a "somewhere" from client sites so the I could get reports and do analysis.
Piwik
  - finally Piwik, my solution and my fav for many years. This was already a mature project when I started with it and it just keeps getting better.
  - primarily for Web Analytics, I think it can be coopted just fine for App analytics too.

KissMetrics, Mint, Flurry, Countly, Mixpanel, etc!
  - There are hundreds of others. Mostly meeting the demands of Mobile Analytics and several are specific to Windows 8/Phone "apps".

## Slide - Why Piwik

http://www.pebosi.net/200903/wie-spricht-man-piwik-aus
http://piwik.org/faq/new-to-piwik/#faq_85

> Do a bunch of talking about why I chose this option

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
