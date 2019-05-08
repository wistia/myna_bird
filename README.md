```
                                      ____                   __
 /'\_/`\                             /\  _`\    __          /\ \
/\      \   __  __     ___       __  \ \ \L\ \ /\_\   _ __  \_\ \
\ \ \__\ \ /\ \/\ \  /' _ `\   /'__`\ \ \  _ <'\/\ \ /\`'__\/'_` \
 \ \ \_/\ \\ \ \_\ \ /\ \/\ \ /\ \L\.\_\ \ \L\ \\ \ \\ \ \//\ \L\ \
  \ \_\\ \_\\/`____ \\ \_\ \_\\ \__/.\_\\ \____/ \ \_\\ \_\\ \___,_\
   \/_/ \/_/ `/___/> \\/_/\/_/ \/__/\/_/ \/___/   \/_/ \/_/ \/__,_ /
                ```/\_
                __/
                \/__/
```

MynaBird converts email addresses into "account names" suitable for use in a
host name.

We use this here at Wistia. A user can sign up for an account using just
their email address, and in typical trendy SaaS fashion, they get an account
URL in the form of http://account-name.wistia.com. MynaBird performs the
conversion of their email into their new account name.

It works like this: if the domain is a that of a known ISP or email provider
(like Comcast or Gmail), then MynaBird uses the local part of their address as
the name. Otherwise, MynaBird builds the account name from the domain.

For example:

  brendan@wistia.com                  -> wistia
  brendan.schwartz@gmail.com          -> brendan-schwartz
  brendan+nospam@gmail.com            -> brendan
  support@gmail.com                   -> support-at-gmail

Ok, that last one is a bit of a special case, but you get the idea.


Usage:

  require 'myna_bird'
  MynaBird.convert('brendan@wistia.com')  #=> 'wistia'

You can also tell MynaBird to avoid a list of domains. No need to include the
TLD, just a second-level domain. For example:

  MynaBird.avoid_domains = ['coolmail', 'bestmail']
  MynaBird.convert('best.business@coolmail.com')  #=> 'best-business'


Specs:

  Just run "rake spec" to run the specs.
  Don't be shy, feel free to add more examples.


Questions:

  Feel free to email me at brendan@wistia.com with any questions.


License:

  Go nuts. See LICENSE for full details.
