# Templatr

Hi there! This is an app for generating `.txt` and `.html` files using [ERB]("https://docs.ruby-lang.org/en/2.3.0/ERB.html").

## How to use Templatr

**TLDR:**
The app will step through each template in `/templates`, and generate a file using your config into the `/out` folder.

**I wanna read!:**
## 1. Config
First, you can check out the [user config file](/config/user_config.yml).

Here, you can input your data to easily use them in your templates.
I've added some dummy data so you can easily mess around with the examples, feel free to remove/change this dummy data as needed.

You'll notice that there's also a [regular config file](/config/confi.yml) in this directory.
This file is for configuring the behaviour of the app, though currently it only lets you specifically select

-----

## 2. Templates
*(In the root folder, you can find an example template which uses the dummy config, though you can add a additional templates of your own here*)

In each template, the data you provided in the [user config file](/config/user_config.yml) will be available as an instance variable.
Meaning, if you have a config like this:
```yaml
  user:
    name: "Test Name"
```
You can then access it inside a template like this:
```html
  <h1>Sup! My name is <%= @user.name %>!
```

Currently, the app only recognizes templates with `.txt.erb`, `.rhtml` and `.html.erb` extensions.
Please open an issue or a PR if you want support for any other extension, I will make sure to implement it ASAP!

-----
