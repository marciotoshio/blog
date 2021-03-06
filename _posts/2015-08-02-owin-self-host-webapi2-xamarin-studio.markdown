---
layout: post
title:  "WebApi2 application running on Owin self-host using Xamarin Studio"
date:   2015-08-03 16:16:30
categories: webapi2 owin xamarin
comments: true
---

Create a new console app in Xamarin.

Add nuget package [Microsoft ASP.NET Web API 2.2 OWIN Self Host][owin-webapi2-package]

Start an webapp in program.cs

{% highlight c# linenos %}
public static void Main (string[] args)
{
	var host = "http://localhost:9000";
	using(WebApp.Start(host))
	{
		Console.WriteLine ("Server running on " + host);
		Console.WriteLine ("Press any key to shutdown.");
		Console.ReadLine ();
	}
}
{% endhighlight %}

Run the app and it'll complain that we need to create a Startup class, let's create it.

Create a new class file called Startup.cs in the root of our app.

{% highlight c# linenos %}
public class Startup
{
	public void Configuration(IAppBuilder appBuilder) 
	{ 
		var config = new HttpConfiguration(); 

		config.Routes.MapHttpRoute( 
			name: "DefaultApi", 
			routeTemplate: "api/{controller}/{id}", 
			defaults: new { id = RouteParameter.Optional } 
		); 

		appBuilder.UseWebApi(config); 
	}
}
{% endhighlight %}

Now everything is set, let's start creating our controllers.

Create a new class file ValuesController.cs inside Controllers folder just for a bit of organization.

{% highlight c# linenos %}
public class ValuesController : ApiController
{
	public IEnumerable<string> Get()
	{
		return new[] { "value1", "value2", "value3" };
	}
}
{% endhighlight %}

Run the app and now you should access the address http://localhost:9000/api/values and see a response with the values in the controller.
Probably the response is a xml document, let's change it to json.

Add this line to the Startup class.

> config.Formatters.JsonFormatter.SupportedMediaTypes.Add(new MediaTypeHeaderValue("text/html") );

Note that with this method response's Content-Type will still be "text/html" if you need the response as "application/json" see this [Stackoverflow thread][stackoverflow-thread]

The code for this project can be found [here][github-project]

[owin-webapi2-package]: https://www.nuget.org/packages/Microsoft.AspNet.WebApi.OwinSelfHost/5.2.3
[stackoverflow-thread]: http://stackoverflow.com/questions/9847564/how-do-i-get-asp-net-web-api-to-return-json-instead-of-xml-using-chrome
[github-project]: https://github.com/marciotoshio/OwinSelfHostExample

<a href="https://github.com/marciotoshio/OwinSelfHostExample/"><img style="position: absolute; top: 0; right: 0; border: 0;" src="https://camo.githubusercontent.com/652c5b9acfaddf3a9c326fa6bde407b87f7be0f4/68747470733a2f2f73332e616d617a6f6e6177732e636f6d2f6769746875622f726962626f6e732f666f726b6d655f72696768745f6f72616e67655f6666373630302e706e67" alt="Fork me on GitHub" data-canonical-src="https://s3.amazonaws.com/github/ribbons/forkme_right_orange_ff7600.png"></a>