#Welcome to instafood

####An introduction

Instafood it's a webservice created by the single idea of order food without paying at the time the food arrives, just select your food, select where you are or where you want your food for delivered, pay with your credit card, and that's it, your will arrive soon.

#let's get started
1.By the first thing you gonna do is clone the Repo from the github

<pre><code>$ git clone git@github.com:supherman/instafood.git
</code></pre>

2.Install Powrc from <http://pow.cx>
<pre><code>$ curl get.pow.cx | sh
</code></pre>

3.Now you've installed pow open your the app 

<pre><code>$ cd instafood
</code></pre>

4.Once you are in your app run a bundle install

<pre><code>$ bundle install
</code></pre>

5.You need to configure your powrc
<pre><code>$ cp.powrc.example .powrc
</code></pre>
##Adding Keys :

6.All ths is necessary for exporting the keys from Twitter and Amazon to do this you need to add your keys  


* For Twitter:

<pre><code>-export TWITTER_KEY=XXX
-export TWITTER_SECRET=XXX
</code></pre>

* For Amazon:

<pre><code>-export AMAZON_KEY=XXX
-export AMAZON_SECRET=XXX
</code></pre>
##Configure your Database

7.Now you have your keys added to the porject so you need setup the database, its quiet simple just run:

<pre><code>$ rake db:setup
</code></pre>
8.Now just steup your app in pow and it's done 

<pre><code>$ cd ~/.pow
$ ln -s /path/to/instafood
</code></pre>

##FINISHED


For see your app runing you don't need to run rails server just type in your browser 



<http://instafood.dev>
