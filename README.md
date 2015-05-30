# TestExternalURL
模仿 iPhone App 简述 的效果:在html中跳转到App中的对应页面,并能从App跳转到原来的网址
 ![enter image description here][6]

  

There is a way to accomplish what you want using standard iOS APIs. No need to use external components.

You control your webpage and your app, so you know the exact URL that has the link to your app.

These are the steps:

1) In your app, define a custom URL scheme. In this case let's assume you use the scheme `myawesomeapp://`. You can do this in your Xcode project by going to the Info section of your target. See below

![Defining a custom URL scheme][1]

2) In your web page you need to handle the two scenarios: app installed / not installed. It is just a matter of detecting if an app responds to the scheme `myawesomeapp://`. 


I will explain the case where your app is already installed. 

Let's say the webpage that contains the link is:

`http://www.mywebsite.com/mypage.html#mytag`

The link you provide in your webpage should pass some parameters to the app and one of these should be the URL that you want the app to return. Following with the example the link could be:

`myawesomeapp://?action=my_action_1&sourceurl=http%3A%2F%2Fwww.mywebsite.com%2Fmypage.html%23mytag`

Note that the URL you pass as a parameter inside the scheme has to be [URL encoded][3] or it won't work properly.

3) In your app delegate you need to implement the method:

`- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation`

In this method, parse the URL, decode the query items and pass the sourceURL to the view controller responsible of handling the action prior to calling it. In this case I set a public property in the ViewController that will store the URL.

`@property (nonatomic, strong) NSURL *sourceURL;`

4) In the view controller when the user finishes the interaction, you just call:

`[[UIApplication sharedApplication] openURL:self.sourceURL];`

Because `self.sourceURL` contains the URL of your webpage, Safari will be launched with the URL. However, because that page is already opened, iOS detects this and re-opens that page.

I have a sample project in my [Github page][4] that implements all this.

And to finalize, after you install the sample project in your iPhone, open this stack overflow post from mobile Safari and [open my awesome app][5]

Once the app is opened, click on the button and you will return to this stack overflow post.


  [1]: https://github.com/ChenYilong/CYLExternalURL/blob/master/CYLExternalURL/it_is_screenshot_setting.png
  [3]: http://en.wikipedia.org/wiki/Percent-encoding
  [4]: https://github.com/ChenYilong/CYLExternalURL
  [5]: myawesomeapp://?action=my_action_1&sourceurl=http://weibo.com/1692391497/CkirQtS1I?from=page_1005051692391497_profile&wvr=6&mod=weibotime&type=comment#_rnd1433007524429
  [6]: https://github.com/ChenYilong/TestExternalURL/blob/master/TestExternalURL/it_is_effect_show_shemeurl.gif
