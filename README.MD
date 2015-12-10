#MetifyJS `2.0`#
_Javascript class which allows Shopify store owners and/or developers the ability to block out product.content / product.description content._

_Currently Shopify store owners have little freedom of how their product "description" is displayed._
_For example if a store owner wishes to display a piece of the {{ product.description }} in several places on the product page he/she cannot._ 
_With Metify you can create as many meta tags necessary to accommodate your particular design theme and layout_

`recently updated plugin to use object literal instead of constructor function`

## Setup

_I only used Javascript for this project, so no need to depend on JQuery or any other frameworks._ 
_As long as the end-user's browser supports DOM you are good to go!_

1. Add metify.js to the end of html `<body>` tag
1.1. Be sure to upload metify.js to your _ASSETS_ directory of your shopify store.
2. Setup `{{ product.description }}` `<div>` holder in your product.liquid template.
3. Obviously using your theme of choice, feel free to place the "meta-value" tags which will accept the "meta-keys" values.
4. Define your meta tags inside of your Shopify store products.

##Options##
* metify.appData.hideMode = 'hide' or 'remove'
`hide` -  sets raw element style display as *none*
`remove` - removes raw element from DOM

## How-to use

Add metify.js to your document, just before `</body>`
```HTML
<script src="metify.js"></script>
<script>
 //Initialize metify2.js class
metify.appInit();
 
 /*
 * you could also pass in your own shopify product.description holder class.
 * example:
 */
metify.mfClass = 'metify'
metify.mfRawContent = 'mf-content-raw'
metify.mfMetaKeys = 'mf-meta-key'
metify.appInit();
</script>
</body>
```

Example of `<div>` holder inside of product.liquid template.
```HTML
<div class="mf-content-raw">
	{{ product.description }}
</div>
```

```HTML
<!-- html from selector with attribute data-mf-meta-key="my-product-custom" will be placed below -->
<div id="my-product-custom"></div>
```

To be placed inside of Shopify product description (example only)
```HTML
<div class="metify" data-mf-meta-key="my-product-custom">
	<p> some custom content here! </p>
</div>
```

## Included
1. metify.js - javascript class to be used with our shopify store.
2. shopify-em.htm - this is just a basic example of how the class is used.

## Resource which may be useful
http://www.shopify.com/?ref=charlietopjian

http://docs.shopify.com/themes/liquid-variables/product





#Development Information#
##Installation##
* npm install
* bower install

##Grunt Commands##
* `grunt` dist
* `grunt` dev

##Notes##
* notes

#Contact#
* Email: charlietopjian@gmail.com
* Github: [http://github.com/ctopjian](http://github.com/ctopjian)

#Resources#
* [https://docs.npmjs.com/cli/install](NPM install options)






## License

The MIT License (MIT)

Copyright (c) 2013 Charlie Topjian

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.