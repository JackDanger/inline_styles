# InlineStyles

Take a CSS stylesheet and semantic html and squish them together

## Why?

HTML-formatted emails don't render uniformly unless the css is attached to the 'style' attribute of every element. Unless you want to maintain your templates with explicit inline styles you'll need to apply them automatically. 

## How?

<pre>
class Mailer < ActionMailer::Base
  def message(email)
    recipients email
    subject "Looks nice, eh?"
    html = render(:file   => "message.html",
                  :layout => "email_layout.html")
    body InlineStyles::Page.new(html).apply(stylesheet_content)
  end

  protected

    def stylesheet_content
      File.read("#{Rails.root}/public/stylesheets/messages.css")
    end
end
</pre>

## Requirements
InlineStyles uses the [css_parser](http://github.com/DanaDanger/css_parser) and [Hpricot](http://github.com/hpricot/hpricot) gems

### Copyright

Copyright (c) 2009 [Jack Danger Canty](http://jåck.com). See LICENSE for details.
